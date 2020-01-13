//
//  Data+MimeTypeTests.swift
//  SwiftWingsTests
//
//  Created by leacode on 2020/1/8.
//  Copyright © 2020 Leacode. All rights reserved.
//

import XCTest
@testable import SwiftWings

class Data_MimeTypeTests: XCTestCase {
  
  // given
    
  func givenFileData(extensionName: String) throws -> Data  {
    return try Data.fromFile(fileName: "\(extensionName)File", extensionName: extensionName)
  }
  
  // tests
  
  // MARK: - Test Audio Types
  
  func test_Data_isAmr_returnsExpected() throws {
    let fileData = try givenFileData(extensionName: "amr")
    XCTAssertTrue(fileData.isAmr)
    
    let wavFileData = try givenFileData(extensionName: "wav")
    XCTAssertFalse(wavFileData.isAmr)
  }
  
  func test_Data_isMp3_returnsExpected() throws {
    let fileData = try givenFileData(extensionName: "mp3")
    XCTAssertTrue(fileData.isMp3)
    
    let wavFileData = try givenFileData(extensionName: "wav")
    XCTAssertFalse(wavFileData.isMp3)
  }
  
  func test_Data_isFlac_returnsExpected() throws {
    let fileData = try givenFileData(extensionName: "flac")
    XCTAssertTrue(fileData.isFlac)
    
    let wavFileData = try givenFileData(extensionName: "wav")
    XCTAssertFalse(wavFileData.isFlac)
  }
  
  func test_Data_isWav_returnsExpected() throws {
    let fileData = try givenFileData(extensionName: "wav")
    XCTAssertTrue(fileData.isWav)
    
    let mp3Data = try givenFileData(extensionName: "mp3")
    XCTAssertFalse(mp3Data.isWav)
  }
  
  func test_Data_isOgg_returnsExpected() throws {
    let fileData = try givenFileData(extensionName: "ogg")
    XCTAssertTrue(fileData.isOgg)
    
    let mp3Data = try givenFileData(extensionName: "mp3")
    XCTAssertFalse(mp3Data.isOgg)
  }
  
  func test_Data_isOpus_returnsExpected() throws {
    let fileData = try givenFileData(extensionName: "opus")
    XCTAssertTrue(fileData.isOpus)
    
    let mp3Data = try givenFileData(extensionName: "mp3")
    XCTAssertFalse(mp3Data.isOpus)
  }
  
  func test_Data_isM4a_returnsExpected() throws {
    let fileData = try givenFileData(extensionName: "m4a")
    XCTAssertTrue(fileData.isM4a)
    
    let mp3Data = try givenFileData(extensionName: "mp3")
    XCTAssertFalse(mp3Data.isM4a)
  }
  
  func test_Data_isMid_returnsExpected() throws {
    let fileData = try givenFileData(extensionName: "mid")
    XCTAssertTrue(fileData.isMid)
    
    let mp3Data = try givenFileData(extensionName: "mp3")
    XCTAssertFalse(mp3Data.isMid)
  }
  
  // MARK: - Test Image Types
  
  func test_Data_isPng_returnsExpected() throws {
    let fileData = try givenFileData(extensionName: "png")
    XCTAssertTrue(fileData.isPng)
    
    let wavFileData = try givenFileData(extensionName: "wav")
    XCTAssertFalse(wavFileData.isPng)
  }
  
  func test_Data_isJPG_returnsExpected() throws {
    let fileData = try givenFileData(extensionName: "jpg")
    XCTAssertTrue(fileData.isJpg)
    
    let wavFileData = try givenFileData(extensionName: "png")
    XCTAssertFalse(wavFileData.isJpg)
  }
  
  func test_Data_isJPEG_returnsExpected() throws {
    let fileData = try givenFileData(extensionName: "jpeg")
    XCTAssertTrue(fileData.isJPEG)
    
    let wavFileData = try givenFileData(extensionName: "png")
    XCTAssertFalse(wavFileData.isJPEG)
  }
  
  func test_Data_isGif_returnsExpected() throws {
    let fileData = try givenFileData(extensionName: "gif")
    XCTAssertTrue(fileData.isGif)
    
    let wavFileData = try givenFileData(extensionName: "png")
    XCTAssertFalse(wavFileData.isGif)
  }
  
  func test_Data_isTiff_returnsExpected() throws {
    let fileData = try givenFileData(extensionName: "tiff")
    XCTAssertTrue(fileData.isTiff)
    
    let wavFileData = try givenFileData(extensionName: "png")
    XCTAssertFalse(wavFileData.isTiff)
  }
  
  func test_Data_isBmp_returnsExpected() throws {
    let fileData = try givenFileData(extensionName: "bmp")
    XCTAssertTrue(fileData.isBmp)
    
    let wavFileData = try givenFileData(extensionName: "png")
    XCTAssertFalse(wavFileData.isBmp)
  }
  
  func test_Data_isWebp_returnsExpected() throws {
    let fileData = try givenFileData(extensionName: "webp")
    XCTAssertTrue(fileData.isWebp)
    
    let wavFileData = try givenFileData(extensionName: "png")
    XCTAssertFalse(wavFileData.isWebp)
  }
  
  func test_Data_isPsd_returnsExpected() throws {
    let fileData = try givenFileData(extensionName: "psd")
    XCTAssertTrue(fileData.isPsd)
    
    let wavFileData = try givenFileData(extensionName: "png")
    XCTAssertFalse(wavFileData.isPsd)
  }
  
  func test_Data_isIco_returnsExpected() throws {
    let fileData = try givenFileData(extensionName: "ico")
    XCTAssertTrue(fileData.isIco)
    
    let wavFileData = try givenFileData(extensionName: "png")
    XCTAssertFalse(wavFileData.isIco)
  }
  
  // MARK: - Test Application Types
  
  func test_Data_isSqlite_returnsExpected() throws {
    let fileData = try givenFileData(extensionName: "sqlite")
    XCTAssertTrue(fileData.isSqlite)
    
    let wavFileData = try givenFileData(extensionName: "wav")
    XCTAssertFalse(wavFileData.isSqlite)
  }
  
  func test_Data_isRar_returnsExpected() throws {
    let fileData = try givenFileData(extensionName: "rar")
    XCTAssertTrue(fileData.isRar)
    
    let wavFileData = try givenFileData(extensionName: "wav")
    XCTAssertFalse(wavFileData.isRar)
  }
  
  func test_Data_isTar_returnsExpected() throws {
    let fileData = try givenFileData(extensionName: "tar")
    XCTAssertTrue(fileData.isTar)
    
    let wavFileData = try givenFileData(extensionName: "wav")
    XCTAssertFalse(wavFileData.isTar)
  }
  
  func test_Data_isGzip_returnsExpected() throws {
    let fileData = try givenFileData(extensionName: "gz")
    XCTAssertTrue(fileData.isGzip)
    
    let wavFileData = try givenFileData(extensionName: "wav")
    XCTAssertFalse(wavFileData.isGzip)
  }
  
  func test_Data_isBz2_returnsExpected() throws {
    let fileData = try givenFileData(extensionName: "bz2")
    XCTAssertTrue(fileData.isBz2)
    
    let wavFileData = try givenFileData(extensionName: "wav")
    XCTAssertFalse(wavFileData.isBz2)
  }
  
}
