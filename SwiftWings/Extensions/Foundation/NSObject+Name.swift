//
//  NSObject+Name.swift
//  SwiftWings
//
//  Created by leacode on 2020/1/3.
//  Copyright © 2020 Leacode. All rights reserved.
//

import Foundation

extension NSObject {
    /// return name of class
    public class var className: String {
        return "\(self)"
    }

    /// return name of self's class
    public var className: String {
        return "\(Self.self)"
    }
}
