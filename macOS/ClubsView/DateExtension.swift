//  DateExtension.swift
//  Schedule.app
//
//  Created by Rahim Malik on 7/11/20.
//  Copyright © 2020 Rahim Malik. All rights reserved.

import Foundation

extension Date {
    func startOfMonth() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
    }
    func startOfNextMonth() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.date(byAdding: .month, value: 5, to: Calendar.current.startOfDay(for: self))!))!
    }
    func endOfMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 5, day: -1), to: self.startOfMonth())!
    }
    func endOfNextMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 5, day: -1), to: self.startOfNextMonth())!
    }
}
