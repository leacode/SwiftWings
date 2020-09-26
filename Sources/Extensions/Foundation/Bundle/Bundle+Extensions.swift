//
//  Bundle+Extensions.swift
//  SwiftWings
//
//  Created by leacode on 2020/9/3.
//  Copyright © 2020 Leacode. All rights reserved.
//

import Foundation

extension Bundle {
  
  var appVersion: String? {
    self.infoDictionary?["CFBundleShortVersionString"] as? String
  }
  
}
