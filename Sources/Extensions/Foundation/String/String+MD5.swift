//
//  String+MD5.swift
//  SwiftWings
//
//  Created by leacode on 2020/1/8.
//  Copyright © 2020 Leacode. All rights reserved.
//

import Foundation

public extension String {
  
  /// The md5 of a string
  var md5: String {
    // It's safe to force-unwrap here since it use .utf8 encoding, it's not save using Unicode encoding
    let message = data(using: .utf8)!.bytes
    
    let MD5Calculator = MD5(message)
    let MD5Data = MD5Calculator.calculate()
    
    let MD5String = NSMutableString()
    for c in MD5Data {
      MD5String.appendFormat("%02x", c)
    }
    return MD5String as String
  }
  
}

protocol HashProtocol {
  var message: Array<UInt8> { get }
  
  /** Common part for hash calculation. Prepare header data. */
  func prepare(_ len: Int) -> Array<UInt8>
}

extension HashProtocol {
  func prepare(_ len: Int) -> Array<UInt8> {
    var tmpMessage = message
    
    // Step 1. Append Padding Bits
    tmpMessage.append(0x80) // append one bit (UInt8 with one bit) to message
    
    // append "0" bit until message length in bits ≡ 448 (mod 512)
    var msgLength = tmpMessage.count
    var counter = 0
    
    while msgLength % len != (len - 8) {
      counter += 1
      msgLength += 1
    }
    
    tmpMessage += Array<UInt8>(repeating: 0, count: counter)
    return tmpMessage
  }
}

func toUInt32Array(_ slice: ArraySlice<UInt8>) -> Array<UInt32> {
  var result = Array<UInt32>()
  result.reserveCapacity(16)
  
  for idx in stride(from: slice.startIndex, to: slice.endIndex, by: MemoryLayout<UInt32>.size) {
    let d0 = UInt32(slice[idx.advanced(by: 3)]) << 24
    let d1 = UInt32(slice[idx.advanced(by: 2)]) << 16
    let d2 = UInt32(slice[idx.advanced(by: 1)]) << 8
    let d3 = UInt32(slice[idx])
    let val: UInt32 = d0 | d1 | d2 | d3
    
    result.append(val)
  }
  return result
}

struct BytesIterator: IteratorProtocol {
  let chunkSize: Int
  let data: [UInt8]
  
  init(chunkSize: Int, data: [UInt8]) {
    self.chunkSize = chunkSize
    self.data = data
  }
  
  var offset = 0
  
  mutating func next() -> ArraySlice<UInt8>? {
    let end = min(chunkSize, data.count - offset)
    let result = data[offset ..< offset + end]
    offset += result.count
    return result.count > 0 ? result : nil
  }
}

struct BytesSequence: Sequence {
  let chunkSize: Int
  let data: [UInt8]
  
  func makeIterator() -> BytesIterator {
    return BytesIterator(chunkSize: chunkSize, data: data)
  }
}

func rotateLeft(_ value: UInt32, bits: UInt32) -> UInt32 {
  return ((value << bits) & 0xFFFFFFFF) | (value >> (32 - bits))
}

class MD5: HashProtocol {
  static let size = 16 // 128 / 8
  let message: [UInt8]
  
  init(_ message: [UInt8]) {
    self.message = message
  }
  
  /** specifies the per-round shift amounts */
  private let shifts: [UInt32] = [
    7, 12, 17, 22, 7, 12, 17, 22, 7, 12, 17, 22, 7, 12, 17, 22,
    5, 9, 14, 20, 5, 9, 14, 20, 5, 9, 14, 20, 5, 9, 14, 20,
    4, 11, 16, 23, 4, 11, 16, 23, 4, 11, 16, 23, 4, 11, 16, 23,
    6, 10, 15, 21, 6, 10, 15, 21, 6, 10, 15, 21, 6, 10, 15, 21,
  ]
  
  /** binary integer part of the sines of integers (Radians) */
  private let sines: [UInt32] = [
    0xD76AA478, 0xE8C7B756, 0x242070DB, 0xC1BDCEEE,
    0xF57C0FAF, 0x4787C62A, 0xA8304613, 0xFD469501,
    0x698098D8, 0x8B44F7AF, 0xFFFF5BB1, 0x895CD7BE,
    0x6B901122, 0xFD987193, 0xA679438E, 0x49B40821,
    0xF61E2562, 0xC040B340, 0x265E5A51, 0xE9B6C7AA,
    0xD62F105D, 0x02441453, 0xD8A1E681, 0xE7D3FBC8,
    0x21E1CDE6, 0xC33707D6, 0xF4D50D87, 0x455A14ED,
    0xA9E3E905, 0xFCEFA3F8, 0x676F02D9, 0x8D2A4C8A,
    0xFFFA3942, 0x8771F681, 0x6D9D6122, 0xFDE5380C,
    0xA4BEEA44, 0x4BDECFA9, 0xF6BB4B60, 0xBEBFBC70,
    0x289B7EC6, 0xEAA127FA, 0xD4EF3085, 0x4881D05,
    0xD9D4D039, 0xE6DB99E5, 0x1FA27CF8, 0xC4AC5665,
    0xF4292244, 0x432AFF97, 0xAB9423A7, 0xFC93A039,
    0x655B59C3, 0x8F0CCC92, 0xFFEFF47D, 0x85845DD1,
    0x6FA87E4F, 0xFE2CE6E0, 0xA3014314, 0x4E0811A1,
    0xF7537E82, 0xBD3AF235, 0x2AD7D2BB, 0xEB86D391,
  ]
  
  private let hashes: [UInt32] = [0x67452301, 0xEFCDAB89, 0x98BADCFE, 0x10325476]
  
  func calculate() -> [UInt8] {
    var tmpMessage = prepare(64)
    tmpMessage.reserveCapacity(tmpMessage.count + 4)
    
    // hash values
    var hh = hashes
    
    // Step 2. Append Length a 64-bit representation of lengthInBits
    let lengthInBits = (message.count * 8)
    let lengthBytes = lengthInBits.bytes(64 / 8)
    tmpMessage += lengthBytes.reversed()
    
    // Process the message in successive 512-bit chunks:
    let chunkSizeBytes = 512 / 8 // 64
    
    for chunk in BytesSequence(chunkSize: chunkSizeBytes, data: tmpMessage) {
      // break chunk into sixteen 32-bit words M[j], 0 ≤ j ≤ 15
      let M = toUInt32Array(chunk)
      
      // Initialize hash value for this chunk:
      var A: UInt32 = hh[0]
      var B: UInt32 = hh[1]
      var C: UInt32 = hh[2]
      var D: UInt32 = hh[3]
      
      var dTemp: UInt32 = 0
      
      // Main loop
      for j in 0 ..< sines.count {
        var g = 0
        var F: UInt32 = 0
        
        if (0...15).contains(j) {
          F = (B & C) | ((~B) & D)
          g = j
        } else if (16...31).contains(j) {
          F = (D & B) | (~D & C)
          g = (5 * j + 1) % 16
        } else if (32...47).contains(j) {
          F = B ^ C ^ D
          g = (3 * j + 5) % 16
        } else if (48...63).contains(j) {
          F = C ^ (B | (~D))
          g = (7 * j) % 16
        }
        
        dTemp = D
        D = C
        C = B
        B = B &+ rotateLeft(A &+ F &+ sines[j] &+ M[g], bits: shifts[j])
        A = dTemp
      }
      
      hh[0] = hh[0] &+ A
      hh[1] = hh[1] &+ B
      hh[2] = hh[2] &+ C
      hh[3] = hh[3] &+ D
    }
    
    var result = [UInt8]()
    result.reserveCapacity(hh.count / 4)
    
    hh.forEach {
      let itemLE = $0.littleEndian
      result += [UInt8(itemLE & 0xFF), UInt8((itemLE >> 8) & 0xFF), UInt8((itemLE >> 16) & 0xFF), UInt8((itemLE >> 24) & 0xFF)]
    }
    return result
  }
}
