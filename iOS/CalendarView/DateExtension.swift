//  DateExtension.swift
//  Schedule.app
//
//  Created by Rahim Malik on 7/11/20.
//  Copyright © 2020 Rahim Malik. All rights reserved.

import Foundation

extension Date {
    func startOfMonth() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.date(byAdding: .month, value: -3, to: Date()) ?? Date()))!
    }
//    func startOfNextMonth() -> Date {
//        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.date(byAdding: .month, value: 5, to: Date())!))!
//    }
    func endOfMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 8), to: self.startOfMonth())!
    }
//    func endOfNextMonth() -> Date {
//        return Calendar.current.date(byAdding: DateComponents(month: 5), to: self.startOfNextMonth())!
//    }
}
