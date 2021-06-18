//
//  MimeType.swift
//  SwiftWingsTests
//
//  Created by leacode on 2020/1/10.
//  Copyright © 2020 Leacode. All rights reserved.
//

import Foundation

struct MimeType {
  let name: String
  let suffix: String
  let fileType: FileType
}

private let mimeTypes = [
  // Audio Types
  "amr":          MimeType(name: "audio/amr", suffix: "amr", fileType: .amr),
  "flac":         MimeType(name: "audio/x-flac", suffix: "flac", fileType: .flac),
  "m4a":          MimeType(name: "audio/m4a", suffix: "m4a", fileType: .m4a),
  "midi":         MimeType(name: "audio/midi", suffix: "midi", fileType: .midi ),
  "mp3":          MimeType(name: "audio/mpeg", suffix: "mp3", fileType: .mp3),
  "ogg":          MimeType(name: "audio/ogg", suffix: "ogg", fileType: .ogg),
  "opus":         MimeType(name: "audio/opus", suffix: "opus", fileType: .opus),
  "ra":           MimeType(name: "audio/x-realaudio", suffix: "ra", fileType: .ra),
  "wav":          MimeType(name: "audio/x-wav", suffix: "wav", fileType: .wav),
  // Video Types
  "3gpp":         MimeType(name: "video/3gpp", suffix: "3gpp", fileType: .threegpp),
  "asf":          MimeType(name: "video/x-ms-asf", suffix: "asf", fileType: .asf),
  "avi":          MimeType(name: "video/x-msvideo", suffix: "avi", fileType: .avi),
  "flv":          MimeType(name: "video/x-flv", suffix: "flv", fileType: .flv),
  "m4v":          MimeType(name: "video/x-m4v", suffix: "m4v", fileType: .m4v),
  "mkv":          MimeType(name: "video/x-matroska", suffix: "mkv", fileType: .mkv),
  "mng":          MimeType(name: "video/x-mng", suffix: "mng", fileType: .mng),
  "mov":          MimeType(name: "video/quicktime", suffix: "mov", fileType: .mov),
  "mp4":          MimeType(name: "video/mp4", suffix: "mp4", fileType: .mp4),
  "mpg":          MimeType(name: "video/mpeg", suffix: "mpg", fileType: .mpg),
  "ts":           MimeType(name: "video/mp2t", suffix: "wav", fileType: .ts),
  "webm":         MimeType(name: "video/webm", suffix: "webm", fileType: .webm),
  "wmv":          MimeType(name: "video/x-ms-wmv", suffix: "wmv", fileType: .wmv),
  // Image Types
  "bmp":          MimeType(name: "image/x-ms-bmp", suffix: "bmp", fileType: .bmp),
  "cr2":          MimeType(name: "image/x-canon-cr2", suffix: "cr2", fileType: .cr2),
  "flif":         MimeType(name: "image/flif", suffix: "flif", fileType: .flif),
  "gif":          MimeType(name: "image/gif", suffix: "gif", fileType: .gif),
  "ico":          MimeType(name: "image/x-icon", suffix: "ico", fileType: .ico),
  "jng":          MimeType(name: "image/x-jng", suffix: "jng", fileType: .jng),
  "jpg":          MimeType(name: "image/jpeg", suffix: "jpg", fileType: .jpg),
  "jxr":          MimeType(name: "image/vnd.ms-photo", suffix: "jxr", fileType: .jxr),
  "png":          MimeType(name: "image/png", suffix: "png", fileType: .png),
  "psd":          MimeType(name: "image/vnd.adobe.photoshop", suffix: "psd", fileType: .psd),
  "svg":          MimeType(name: "image/svg+xml", suffix: "svg", fileType: .svg),
  "tiff":         MimeType(name: "image/tiff", suffix: "tiff", fileType: .tiff),
  "wbmp":         MimeType(name: "image/vnd.wap.wbmp", suffix: "wbmp", fileType: .wbmp),
  "webp":         MimeType(name: "image/webp", suffix: "webp", fileType: .webp),
  // Text Types
  "html":         MimeType(name:   "text/html", suffix: "html", fileType: .html),
  "css":          MimeType(name:   "text/css", suffix: "css", fileType: .css),
  "xml":          MimeType(name:   "text/xml", suffix: "xml", fileType: .xml),
  "mml":          MimeType(name:   "text/mathml", suffix: "mml", fileType: .mml),
  "txt":          MimeType(name:   "text/plain", suffix: "txt", fileType: .txt),
  "jad":          MimeType(name:   "text/vnd.sun.j2me.app-descriptor", suffix: "jad", fileType: .jad),
  "wml":          MimeType(name:   "text/vnd.wap.wml", suffix: "wml", fileType: .wml),
  "htc":          MimeType(name:   "text/x-component", suffix: "htc", fileType: .htc),
  // Application Types
  "js":           MimeType(name:   "application/javascript", suffix: "js", fileType: .js),
  "atom":         MimeType(name:   "application/atom+xml", suffix: "atom", fileType: .atom),
  "rss":          MimeType(name:   "application/rss+xml", suffix: "rss", fileType: .rss),
  "epub":         MimeType(name:   "application/epub+zip", suffix: "epub", fileType: .epub),
  "woff":         MimeType(name:   "application/font-woff", suffix: "woff", fileType: .woff),
  "javaArchive":  MimeType(name:   "application/java-archive", suffix: "javaArchive", fileType: .javaArchive),
  "json":         MimeType(name:   "application/json", suffix: "json", fileType: .json),
  "hqx":          MimeType(name:   "application/mac-binhex40", suffix: "hqx", fileType: .hqx),
  "doc":          MimeType(name:   "application/msword", suffix: "doc", fileType: .doc),
  "pdf":          MimeType(name:   "application/pdf", suffix: "pdf", fileType: .pdf),
  "eps":          MimeType(name:   "application/postscript", suffix: "eps", fileType: .eps),
  "rtf":          MimeType(name:   "application/rtf", suffix: "rtf", fileType: .rtf),
  "m3u8":         MimeType(name:   "application/vnd.apple.mpegurl", suffix: "m3u8", fileType: .m3u8),
  "xls":          MimeType(name:   "application/vnd.ms-excel", suffix: "xls", fileType: .xls),
  "eot":          MimeType(name:   "application/vnd.ms-fontobject", suffix: "eot", fileType: .eot),
  "ppt":          MimeType(name:   "application/vnd.ms-powerpoint", suffix: "ppt", fileType: .ppt),
  "wmlc":         MimeType(name:   "application/vnd.wap.wmlc", suffix: "wmlc", fileType: .wmlc),
  "kml":          MimeType(name:   "application/vnd.google-earth.kml+xml", suffix: "kml", fileType: .kml),
  "kmz":          MimeType(name:   "application/vnd.google-earth.kmz", suffix: "kmz", fileType: .kmz),
  "sevenZ":       MimeType(name:   "application/x-7z-compressed", suffix: "sevenZ", fileType: .sevenZ),
  "cco":          MimeType(name:   "application/x-cocoa", suffix: "cco", fileType: .cco),
  "jardiff":      MimeType(name:   "application/x-java-archive-diff", suffix: "jardiff", fileType: .jardiff),
  "jnlp":         MimeType(name:   "application/x-java-jnlp-file", suffix: "jnlp", fileType: .jnlp),
  "run":          MimeType(name:   "application/x-makeself", suffix: "run", fileType: .run),
  "pl":           MimeType(name:   "application/x-perl", suffix: "pl", fileType: .pl),
  "prc":          MimeType(name:   "application/x-pilot", suffix: "prc", fileType: .prc),
  "rar":          MimeType(name:   "application/x-rar-compressed", suffix: "rar", fileType: .rar),
  "rpm":          MimeType(name:   "application/x-redhat-package-manager", suffix: "rpm", fileType: .rpm),
  "sea":          MimeType(name:   "application/x-sea", suffix: "sea", fileType: .sea),
  "swf":          MimeType(name:   "application/x-shockwave-flash", suffix: "swf", fileType: .swf),
  "sit":          MimeType(name:   "application/x-stuffit", suffix: "sit", fileType: .sit),
  "tcl":          MimeType(name:   "application/x-tcl", suffix: "tcl", fileType: .tcl),
  "crt":          MimeType(name:   "application/x-x509-ca-cert", suffix: "crt", fileType: .crt),
  "xpi":          MimeType(name:   "application/x-xpinstall", suffix: "xpi", fileType: .xpi),
  "xhtml":        MimeType(name:   "application/xhtml+xml", suffix: "xhtml", fileType: .xhtml),
  "xspf":         MimeType(name:   "application/xspf+xml", suffix: "xspf", fileType: .xspf),
  "zip":          MimeType(name:   "application/zip", suffix: "zip", fileType: .zip),
  "tar":          MimeType(name:   "application/x-tar", suffix: "tar", fileType: .tar),
  "gz":           MimeType(name:   "application/gzip", suffix: "gz", fileType: .gz),
  "bz2":          MimeType(name:   "application/x-bzip2", suffix: "bz2", fileType: .bz2),
  "dmg":          MimeType(name:   "application/x-apple-diskimage", suffix: "dmg", fileType: .dmg),
  "bin":          MimeType(name:   "application/octet-stream", suffix: "bin", fileType: .bin),
  "nes":          MimeType(name:   "application/x-nintendo-nes-rom", suffix: "nes", fileType: .nes),
  "exe":          MimeType(name:   "application/x-msdownload", suffix: "exe", fileType: .exe),
  "crx":          MimeType(name:   "application/x-google-chrome-extension", suffix: "crx", fileType: .crx),
  "cab":          MimeType(name:   "application/vnd.ms-cab-compressed", suffix: "cab", fileType: .cab),
  "deb":          MimeType(name:   "application/x-deb", suffix: "deb", fileType: .deb),
  "ar":           MimeType(name:   "application/x-unix-archive", suffix: "ar", fileType: .ar),
  "docx":         MimeType(name:   "application/vnd.openxmlformats-officedocument.wordprocessingml.document", suffix: "docx", fileType: .docx),
  "xlsx":         MimeType(name:   "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", suffix: "xlsx", fileType: .xlsx),
  "pptx":         MimeType(name:   "application/vnd.openxmlformats-officedocument.presentationml.presentation", suffix: "pptx", fileType: .pptx),
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

public enum FileType: String {
  case amr         = "audio/amr"
  case midi        = "audio/midi"
  case mp3         = "audio/mpeg"
  case ogg         = "audio/ogg"
  case opus        = "audio/opus"
  case m4a         = "audio/x-m4a"
  case flac        = "audio/x-flac"
  case wav         = "audio/x-wav"
  case ra          = "audio/x-realaudio"
  case threegpp    = "video/3gpp"
  case ts          = "video/mp2t"
  case mp4         = "video/mp4"
  case mpg         = "video/mpeg"
  case mov         = "video/quicktime"
  case webm        = "video/webm"
  case mkv         = "video/x-matroska"
  case flv         = "video/x-flv"
  case m4v         = "video/x-m4v"
  case mng         = "video/x-mng"
  case asf         = "video/x-ms-asf"
  case wmv         = "video/x-ms-wmv"
  case avi         = "video/x-msvideo"
  case png         = "image/png"
  case jpg         = "image/jpeg"
  case gif         = "image/gif"
  case flif        = "image/flif"
  case tiff        = "image/tiff"
  case wbmp        = "image/vnd.wap.wbmp"
  case ico         = "image/x-icon"
  case jng         = "image/x-jng"
  case bmp         = "image/x-ms-bmp"
  case cr2         = "image/x-canon-cr2"
  case svg         = "image/svg+xml"
  case webp        = "image/webp"
  case psd         = "image/vnd.adobe.photoshop"
  case jxr         = "image/vnd.ms-photo"
  case html        = "text/html"
  case css         = "text/css"
  case xml         = "text/xml"
  case mml         = "text/mathml"
  case txt         = "text/plain"
  case jad         = "text/vnd.sun.j2me.app-descriptor"
  case wml         = "text/vnd.wap.wml"
  case htc         = "text/x-component"
  case js          = "application/javascript"
  case atom        = "application/atom+xml"
  case rss         = "application/rss+xml"
  case epub        = "application/epub+zip"
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
  case sevenZ      = "application/x-7z-compressed"
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
  case tar         = "application/x-tar"
  case gz          = "application/gzip"
  case bz2         = "application/x-bzip2"
  case dmg         = "application/x-apple-diskimage"
  case bin         = "application/octet-stream"
  case nes         = "application/x-nintendo-nes-rom"
  case exe         = "application/x-msdownload"
  case crx         = "application/x-google-chrome-extension"
  case cab         = "application/vnd.ms-cab-compressed"
  case deb         = "application/x-deb"
  case ar          = "application/x-unix-archive"
  case docx        = "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
  case xlsx        = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
  case pptx        = "application/vnd.openxmlformats-officedocument.presentationml.presentation"
  
  case unknown     = "unknown"
  
  public init(pathOrFileName: String) {
    if let fileExtension = pathOrFileName.fileExtension,
       let fileMimeType = mimeTypes[fileExtension] {
      self = FileType(stringLiteral: fileMimeType.name)
      return
    } else {
      self = .unknown
    }
  }
}

extension FileType: ExpressibleByStringLiteral {
  public init(stringLiteral value: String) {
    self = FileType(rawValue: value) ?? FileType.unknown
  }
}
