//
//  Date+Extensions.swift
//  SwiftWings
//
//  Created by leacode on 2020/1/14.
//  Copyright © 2020 Leacode. All rights reserved.
//

import Foundation

public extension Date {
  
  static var currentTimeMillis: Int64 {
    Date().timeMillis
  }
  
  var timeMillis: Int64 {
    Int64(self.timeIntervalSince1970 * 1000)
  }
  
  var isToday: Bool {
    let calendar = Calendar.current
    let now = Date()
    
    let components: Set<Calendar.Component> = [
      .era,
      .year,
      .month,
      .day,
    ]
    
    let today = calendar.dateComponents(components, from: now)
    let day = calendar.dateComponents(components, from: self)
    
    return today == day
  }
  
  var isTomorrow: Bool {
    let calendar = Calendar.current
    let tomorrowDate = Date().addingTimeInterval(60 * 60 * 24)
    
    let components: Set<Calendar.Component> = [
      .era,
      .year,
      .month,
      .day,
    ]
    
    let tomorrow = calendar.dateComponents(components, from: tomorrowDate)
    let day = calendar.dateComponents(components, from: self)
    
    return tomorrow == day
  }
  
  var isInThisWeek: Bool {
    let calendar = Calendar.current
    let now = Date()
    
    let components: Set<Calendar.Component> = [
      .era,
      .year,
      .month,
      .weekOfMonth,
    ]
    
    let today = calendar.dateComponents(components, from: now)
    let day = calendar.dateComponents(components, from: self)
    
    return today == day
  }
  
  var isInNextWeek: Bool {
    let calendar = Calendar.current
    let now = Date().addingTimeInterval(60 * 60 * 24 * 7)
    
    let components: Set<Calendar.Component> = [
      .era,
      .year,
      .month,
      .weekOfMonth,
    ]
    
    let today = calendar.dateComponents(components, from: now)
    let day = calendar.dateComponents(components, from: self)
    
    return today == day
  }
  
  // MARK: -  Date before & Date after
  
  var lastMonday: Date {
    let dayOfWeek = Calendar.current.component(.weekday, from: self)
    
    var components = DateComponents()
    components.day = -(dayOfWeek + 6 - 1)
    
    return Calendar.current.date(byAdding: components, to: self)!
  }
  
  var lastTuesday: Date {
    let dayOfWeek = Calendar.current.component(.weekday, from: self)
    
    var components = DateComponents()
    components.day = -(dayOfWeek + 6 - 2)
    
    return Calendar.current.date(byAdding: components, to: self)!
  }
  
  var lastWednesday: Date {
    let dayOfWeek = Calendar.current.component(.weekday, from: self)
    
    var components = DateComponents()
    components.day = -(dayOfWeek + 6 - 3)
    
    return Calendar.current.date(byAdding: components, to: self)!
  }
  
  var lastThursday: Date {
    let dayOfWeek = Calendar.current.component(.weekday, from: self)
    
    var components = DateComponents()
    components.day = -(dayOfWeek + 6 - 4)
    
    return Calendar.current.date(byAdding: components, to: self)!
  }
  
  var lastFriday: Date {
    let dayOfWeek = Calendar.current.component(.weekday, from: self)
    
    var components = DateComponents()
    components.day = -(dayOfWeek + 6 - 5)
    
    return Calendar.current.date(byAdding: components, to: self)!
  }
  
  var lastSatuaday: Date {
    let dayOfWeek = Calendar.current.component(.weekday, from: self)
    
    var components = DateComponents()
    components.day = -(dayOfWeek + 6 - 6)
    
    return Calendar.current.date(byAdding: components, to: self)!
  }
  
  var lastSunday: Date {
    let dayOfWeek = Calendar.current.component(.weekday, from: self)
    
    var components = DateComponents()
    components.day = -(dayOfWeek + 6 - 7)
    
    return Calendar.current.date(byAdding: components, to: self)!
  }
  
  var lastDay: Date? {
    Calendar.current.date(byAdding: .day, value: -1, to: self)
  }
  
  var nextDay: Date? {
    Calendar.current.date(byAdding: .day, value: 1, to: self)
  }
  
  var lastMonth: Date? {
    Calendar.current.date(byAdding: .month, value: -1, to: self)
  }
  
  var nextMonth: Date? {
    Calendar.current.date(byAdding: .month, value: 1, to: self)
  }
  
  var lastYear: Date? {
    Calendar.current.date(byAdding: .year, value: -1, to: self)
  }
  
  var nextYear: Date? {
    Calendar.current.date(byAdding: .year, value: 1, to: self)
  }
  
}
