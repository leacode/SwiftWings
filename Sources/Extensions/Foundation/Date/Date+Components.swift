//
//  Date+Components.swift
//  SwiftWings
//
//  Created by Chunyu Li on 2021/3/22.
//  Copyright © 2021 Leacode. All rights reserved.
//

import Foundation

extension Date {

  var era: Int { Calendar.current.component(.era, from: self) }

  var year: Int { Calendar.current.component(.year, from: self) }

  var month: Int { Calendar.current.component(.month, from: self) }

  var day: Int { Calendar.current.component(.day, from: self) }

  var hour: Int { Calendar.current.component(.hour, from: self) }

  var minute: Int { Calendar.current.component(.minute, from: self) }

  var second: Int { Calendar.current.component(.second, from: self) }

  var weekday: Int { Calendar.current.component(.weekday, from: self) }

  var weekdayOrdinal: Int { Calendar.current.component(.weekdayOrdinal, from: self) }

  var weekOfMonth: Int { Calendar.current.component(.weekOfMonth, from: self) }

  var weekOfYear: Int { Calendar.current.component(.weekOfYear, from: self) }

  var yearForWeekOfYear: Int { Calendar.current.component(.yearForWeekOfYear, from: self) }

  var nanosecond: Int { Calendar.current.component(.nanosecond, from: self) }

  var calendar: Int { Calendar.current.component(.calendar, from: self) }

  var timeZone: Int { Calendar.current.component(.timeZone, from: self) }
  
}
