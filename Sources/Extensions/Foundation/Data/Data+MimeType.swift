//
//  Data+MimeType.swift
//  SwiftWings
//
//  Created by leacode on 2020/1/8.
//  Copyright © 2020 Leacode. All rights reserved.
//

import Foundation

private let mimeTypes = [
    "3gp":      "video/3gpp",
    "3gpp":     "video/3gpp",
    "7z":       "application/x-7z-compressed",
    "ai":       "application/postscript",
    "asf":      "video/x-ms-asf",
    "asx":      "video/x-ms-asf",
    "atom":     "application/atom+xml",
    "avi":      "video/x-msvideo",
    "bin":      "application/octet-stream",
    "bmp":      "image/x-ms-bmp",
    "cco":      "application/x-cocoa",
    "crt":      "application/x-x509-ca-cert",
    "css":      "text/css",
    "deb":      "application/octet-stream",
    "der":      "application/x-x509-ca-cert",
    "dll":      "application/octet-stream",
    "dmg":      "application/octet-stream",
    "doc":      "application/msword",
    "docx":     "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
    "ear":      "application/java-archive",
    "eot":      "application/vnd.ms-fontobject",
    "eps":      "application/postscript",
    "exe":      "application/octet-stream",
    "flv":      "video/x-flv",
    "gif":      "image/gif",
    "hqx":      "application/mac-binhex40",
    "htc":      "text/x-component",
    "htm":      "text/html",
    "html":     "text/html",
    "ico":      "image/x-icon",
    "img":      "application/octet-stream",
    "iso":      "application/octet-stream",
    "jad":      "text/vnd.sun.j2me.app-descriptor",
    "jar":      "application/java-archive",
    "jardiff":  "application/x-java-archive-diff",
    "jng":      "image/x-jng",
    "jnlp":     "application/x-java-jnlp-file",
    "jpeg":     "image/jpeg",
    "jpg":      "image/jpeg",
    "js":       "application/javascript",
    "json":     "application/json",
    "kar":      "audio/midi",
    "kml":      "application/vnd.google-earth.kml+xml",
    "kmz":      "application/vnd.google-earth.kmz",
    "m3u8":     "application/vnd.apple.mpegurl",
    "m4a":      "audio/x-m4a",
    "m4v":      "video/x-m4v",
    "mid":      "audio/midi",
    "midi":     "audio/midi",
    "mml":      "text/mathml",
    "mng":      "video/x-mng",
    "mov":      "video/quicktime",
    "mp3":      "audio/mpeg",
    "mp4":      "video/mp4",
    "mpeg":     "video/mpeg",
    "mpg":      "video/mpeg",
    "msi":      "application/octet-stream",
    "msm":      "application/octet-stream",
    "msp":      "application/octet-stream",
    "ogg":      "audio/ogg",
    "pdb":      "application/x-pilot",
    "pdf":      "application/pdf",
    "pem":      "application/x-x509-ca-cert",
    "pl":       "application/x-perl",
    "pm":       "application/x-perl",
    "png":      "image/png",
    "ppt":      "application/vnd.ms-powerpoint",
    "pptx":     "application/vnd.openxmlformats-officedocument.presentationml.presentation",
    "prc":      "application/x-pilot",
    "ps":       "application/postscript",
    "ra":       "audio/x-realaudio",
    "rar":      "application/x-rar-compressed",
    "rpm":      "application/x-redhat-package-manager",
    "rss":      "application/rss+xml",
    "rtf":      "application/rtf",
    "run":      "application/x-makeself",
    "sea":      "application/x-sea",
    "shtml":    "text/html",
    "sit":      "application/x-stuffit",
    "svg":      "image/svg+xml",
    "svgz":     "image/svg+xml",
    "swf":      "application/x-shockwave-flash",
    "tcl":      "application/x-tcl",
    "tif":      "image/tiff",
    "tiff":     "image/tiff",
    "tk":       "application/x-tcl",
    "ts":       "video/mp2t",
    "txt":      "text/plain",
    "war":      "application/java-archive",
    "wbmp":     "image/vnd.wap.wbmp",
    "webm":     "video/webm",
    "webp":     "image/webp",
    "wml":      "text/vnd.wap.wml",
    "wmlc":     "application/vnd.wap.wmlc",
    "wmv":      "video/x-ms-wmv",
    "woff":     "application/font-woff",
    "xhtml":    "application/xhtml+xml",
    "xls":      "application/vnd.ms-excel",
    "xlsx":     "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
    "xml":      "text/xml",
    "xpi":      "application/x-xpinstall",
    "xspf":     "application/xspf+xml",
    "zip":      "application/zip",
]

public enum AudioMimeType: String {
  case amr         = "audio/amr"
  case midi        = "audio/midi"
  case mp3         = "audio/mpeg"
  case ogg         = "audio/ogg"
  case m4a         = "audio/x-m4a"
  case ra          = "audio/x-realaudio"
  case unknown     = "unknown"
}

extension AudioMimeType: ExpressibleByStringLiteral {
  public init(stringLiteral value: String) {
    self = AudioMimeType(rawValue: value) ?? AudioMimeType.unknown
  }
}

public enum MimeType: String {
  case amr         = "audio/amr"
  case midi        = "audio/midi"
  case mp3         = "audio/mpeg"
  case ogg         = "audio/ogg"
  case m4a         = "audio/x-m4a"
  case ra          = "audio/x-realaudio"
  case html        = "text/html"
  case css         = "text/css"
  case xml         = "text/xml"
  case gif         = "image/gif"
  case jpeg        = "image/jpeg"
  case js          = "application/javascript"
  case atom        = "application/atom+xml"
  case rss         = "application/rss+xml"
  case mml         = "text/mathml"
  case txt         = "text/plain"
  case jad         = "text/vnd.sun.j2me.app-descriptor"
  case wml         = "text/vnd.wap.wml"
  case htc         = "text/x-component"
  case png         = "image/png"
  case tiff        = "image/tiff"
  case wbmp        = "image/vnd.wap.wbmp"
  case ico         = "image/x-icon"
  case jng         = "image/x-jng"
  case bmp         = "image/x-ms-bmp"
  case svg         = "image/svg+xml"
  case webp        = "image/webp"
  case woff        = "application/font-woff"
  case javaArchive = "application/java-archive"
  case json        = "application/json"
  case hqx         = "application/mac-binhex40"
  case doc         = "application/msword"
  case pdf         = "application/pdf"
  case eps         = "application/postscript"
  case rtf         = "application/rtf"
  case m3u8        = "application/vnd.apple.mpegurl"
  case xls         = "application/vnd.ms-excel"
  case eot         = "application/vnd.ms-fontobject"
  case ppt         = "application/vnd.ms-powerpoint"
  case wmlc        = "application/vnd.wap.wmlc"
  case kml         = "application/vnd.google-earth.kml+xml"
  case kmz         = "application/vnd.google-earth.kmz"
  case x7z         = "application/x-7z-compressed"
  case cco         = "application/x-cocoa"
  case jardiff     = "application/x-java-archive-diff"
  case jnlp        = "application/x-java-jnlp-file"
  case run         = "application/x-makeself"
  case pl          = "application/x-perl"
  case prc         = "application/x-pilot"
  case rar         = "application/x-rar-compressed"
  case rpm         = "application/x-redhat-package-manager"
  case sea         = "application/x-sea"
  case swf         = "application/x-shockwave-flash"
  case sit         = "application/x-stuffit"
  case tcl         = "application/x-tcl"
  case crt         = "application/x-x509-ca-cert"
  case xpi         = "application/x-xpinstall"
  case xhtml       = "application/xhtml+xml"
  case xspf        = "application/xspf+xml"
  case zip         = "application/zip"
  case bin         = "application/octet-stream"
  case docx        = "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
  case xlsx        = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
  case pptx        = "application/vnd.openxmlformats-officedocument.presentationml.presentation"
  case v3gpp       = "video/3gpp"
  case ts          = "video/mp2t"
  case mp4         = "video/mp4"
  case mpeg        = "video/mpeg"
  case mov         = "video/quicktime"
  case webm        = "video/webm"
  case flv         = "video/x-flv"
  case m4v         = "video/x-m4v"
  case mng         = "video/x-mng"
  case asf         = "video/x-ms-asf"
  case wmv         = "video/x-ms-wmv"
  case avi         = "video/x-msvideo"
  case unknown     = "unknown"
  
  public init(pathOrFileName: String) {
    if let fileName = pathOrFileName.split(separator: ".").last {
      let fileExtension = String(fileName)
      if let fileMimeTypeName = mimeTypes[fileExtension] {
        self = MimeType(stringLiteral: fileMimeTypeName)
        return
      }
    }
    self = .unknown
  }
}

extension MimeType: ExpressibleByStringLiteral {
  public init(stringLiteral value: String) {
    self = MimeType(rawValue: value) ?? MimeType.unknown
  }
}

public extension Data {
  
  var isAmr: Bool {
    let len: Int = 6
    var byteData = [UInt8](repeating: 0, count: len)
    copyBytes(to: &byteData, count: len)

    if byteData[0] == 0x23 &&
      byteData[1] == 0x21 &&
      byteData[2] == 0x41 &&
      byteData[3] == 0x4D &&
      byteData[4] == 0x52 &&
      byteData[5] == 0x0A {
        return true
    }
    return false
  }
  
}

