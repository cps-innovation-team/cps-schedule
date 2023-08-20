//  ScheduleVM.swift
//  Schedule.app
//
//  Created by Rahim Malik on 7/11/20.
//  Copyright © 2020 Rahim Malik. All rights reserved.

import SwiftUI
import DynamicColor

struct ScheduleViewHoliday: View {
    var whichWeekend : String
    var reason : String
    let date: Date
    @Environment(\.colorScheme) var colorScheme
    @Binding var array: [Entry]
    var body: some View {
        VStack {
            HStack{
                Text(whichWeekend)
                    .foregroundColor(colorScheme == .light ? Color(accentTeal.shaded(amount: 0.25)) : Color(accentTeal.tinted(amount: 0.25)))
                    .fontWeight(.medium)
                    .font(.system(size: 16))
                    .textCase(.uppercase)
                    .multilineTextAlignment(.center)
                Spacer()
            }
            universalBlock(boolValue: true, height: fullLength, color: systemAdaptive, name: reason, timeRange: "", date: date, array: $array)
        }
    }
}

struct ScheduleViewFinals: View {
    var whichDay : String
    let date: Date
    @Environment(\.colorScheme) var colorScheme
    @Binding var array: [Entry]
    var body: some View {
        VStack {
            HStack{
                Text(whichDay)
                    .foregroundColor(colorScheme == .light ? Color(accentTeal.shaded(amount: 0.25)) : Color(accentTeal.tinted(amount: 0.25)))
                    .fontWeight(.medium)
                    .textCase(.uppercase)
                    .font(.system(size: 16))
                Spacer()
            }
            universalBlock(boolValue: false, height: fullLength, color: accentTeal, name: "Finals Session 1", timeRange: "8:05 - 10:05", date: date, array: $array)
            universalBlock(boolValue: false, height: fullLength, color: accentTeal, name: "Finals Session 2", timeRange: "10:35 - 12:35", date: date, array: $array)
            universalBlock(boolValue: false, height: fullLength, color: accentTeal, name: "Finals Session 3", timeRange: "1:15 - 3:15", date: date, array: $array)
        }
    }
}

// MARK: Monday View
struct ScheduleViewMon: View {
    let total = CGFloat(420+8*5)
    let spacing = CGFloat(5)
    var whichDay : String
    let date: Date
    @Environment(\.colorScheme) var colorScheme
    @Binding var array: [Entry]
    var body: some View {
        VStack {
            HStack{
                Text(whichDay)
                    .foregroundColor(colorScheme == .light ? Color(accentTeal.shaded(amount: 0.25)) : Color(accentTeal.tinted(amount: 0.25)))
                    .fontWeight(.medium)
                    .textCase(.uppercase)
                    .font(.system(size: 16))
                Spacer()
            }
            GeometryReader { metrics in
                VStack(spacing: 0) {
                    VStack(spacing: 0) {
                        universalBlock(boolValue: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.bool(forKey: "AFreeKey") ?? false,height: longBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AColorKey") ?? systemA, name:  UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ANameKey") ?? "A-Block", timeRange: "8:30 - 9:45", block: "A", date: date, array: $array)
                            .frame(height: metrics.size.height * (75/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        passingBlockScheduleView()
                            .frame(height: metrics.size.height * (15/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        universalBlock(boolValue: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.bool(forKey: "BFreeKey") ?? false ,height: longBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "BColorKey") ?? systemB, name: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "BNameKey") ?? "B-Block", timeRange: "10:00 - 11:15", block: "B", date: date, array: $array)
                            .frame(height: metrics.size.height * (75/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                    }
                    VStack(spacing: 0) {
                        universalBlock(boolValue: false, height: mediumBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AssemblyColorKey") ?? systemTeal, name: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "AssemblyNameKey") ?? "Assembly", timeRange: "11:15 - 11:45", block: "Assembly", date: date, array: $array)
                            .frame(height: metrics.size.height * (30/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        universalBlock(boolValue: true, height: lunchBlock, color: systemGray, name: "Lunch", timeRange: "11:45 - 12:15", block: "Lunch", date: date, array: $array)
                            .frame(height: metrics.size.height * (30/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                    }
                    VStack(spacing: 0) {
                        universalBlock(boolValue: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.bool(forKey: "EFreeKey") ?? false , height: longBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "EColorKey") ?? systemE, name: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ENameKey") ?? "E-Block", timeRange: "12:15 - 1:30", block: "E", date: date, array: $array)
                            .frame(height: metrics.size.height * (75/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        passingBlockScheduleView()
                            .frame(height: metrics.size.height * (15/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        universalBlock(boolValue: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.bool(forKey: "FFreeKey") ?? false ,height: longBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "FColorKey") ?? systemF, name: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "FNameKey") ?? "F-Block", timeRange: "1:45 - 3:00", block: "F", date: date, array: $array)
                            .frame(height: metrics.size.height * (75/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        universalBlock(boolValue: true, height: lunchBlock, color: systemGray, name: "Open", timeRange: "3:00 - 3:30", block: "Afternoon Open", date: date, array: $array)
                            .frame(height: metrics.size.height * (30/total))
                    }
                }
            }
        }
    }
}

// MARK: Special Monday View
struct ScheduleViewMonSpecial: View {
    let total = CGFloat(420+8*5)
    let spacing = CGFloat(5)
    var whichDay : String
    let date: Date
    @Environment(\.colorScheme) var colorScheme
    @Binding var array: [Entry]
    var body: some View {
        VStack {
            HStack{
                Text(whichDay)
                    .foregroundColor(colorScheme == .light ? Color(accentTeal.shaded(amount: 0.25)) : Color(accentTeal.tinted(amount: 0.25)))
                    .fontWeight(.medium)
                    .textCase(.uppercase)
                    .font(.system(size: 16))
                Spacer()
            }
            GeometryReader { metrics in
                VStack(spacing: 0) {
                    VStack(spacing: 0) {
                        universalBlock(boolValue: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.bool(forKey: "AFreeKey") ?? false,height: longBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AColorKey") ?? systemA, name:  UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ANameKey") ?? "A-Block", timeRange: "8:30 - 9:40", block: "A", date: date, array: $array)
                            .frame(height: metrics.size.height * (70/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        passingBlockScheduleView()
                            .frame(height: metrics.size.height * (15/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        universalBlock(boolValue: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.bool(forKey: "BFreeKey") ?? false ,height: longBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "BColorKey") ?? systemB, name: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "BNameKey") ?? "B-Block", timeRange: "9:55 - 11:05", block: "B", date: date, array: $array)
                            .frame(height: metrics.size.height * (70/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                    }
                    VStack(spacing: 0) {
                        universalBlock(boolValue: false, height: mediumBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AssemblyColorKey") ?? systemTeal, name: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "AssemblyNameKey") ?? "Assembly", timeRange: "11:05 - 11:35", block: "Assembly", date: date, array: $array)
                            .frame(height: metrics.size.height * (30/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        universalBlock(boolValue: true, height: lunchBlock, color: systemGray, name: "Lunch", timeRange: "11:35 - 12:25", block: "Lunch", date: date, array: $array)
                            .frame(height: metrics.size.height * (50/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                    }
                    VStack(spacing: 0) {
                        universalBlock(boolValue: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.bool(forKey: "EFreeKey") ?? false , height: longBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "EColorKey") ?? systemE, name: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ENameKey") ?? "E-Block", timeRange: "12:25 - 1:35", block: "E", date: date, array: $array)
                            .frame(height: metrics.size.height * (70/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        passingBlockScheduleView()
                            .frame(height: metrics.size.height * (15/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        universalBlock(boolValue: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.bool(forKey: "FFreeKey") ?? false ,height: longBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "FColorKey") ?? systemF, name: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "FNameKey") ?? "F-Block", timeRange: "1:50 - 3:00", block: "F", date: date, array: $array)
                            .frame(height: metrics.size.height * (70/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        universalBlock(boolValue: true, height: lunchBlock, color: systemGray, name: "Open", timeRange: "3:00 - 3:30", block: "Afternoon Open", date: date, array: $array)
                            .frame(height: metrics.size.height * (30/total))
                    }
                }
            }
        }
    }
}

// MARK: Tuesday View
struct ScheduleViewTue: View {
    let total = CGFloat(420+8*5)
    let spacing = CGFloat(5)
    var whichDay : String
    let date: Date
    @Environment(\.colorScheme) var colorScheme
    @Binding var array: [Entry]
    var body: some View {
        VStack {
            HStack{
                Text(whichDay)
                    .foregroundColor(colorScheme == .light ? Color(accentTeal.shaded(amount: 0.25)) : Color(accentTeal.tinted(amount: 0.25)))
                    .fontWeight(.medium)
                    .textCase(.uppercase)
                    .font(.system(size: 16))
                Spacer()
            }
            GeometryReader { metrics in
                VStack(spacing: 0) {
                    VStack(spacing: 0) {
                        universalBlock(boolValue: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.bool(forKey: "CFreeKey") ?? false , height: longBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CColorKey") ?? systemC, name: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CNameKey") ?? "C-Block", timeRange: "8:30 - 9:45", block: "C", date: date, array: $array)
                            .frame(height: metrics.size.height * (75/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        passingBlockScheduleView()
                            .frame(height: metrics.size.height * (15/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        universalBlock(boolValue: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.bool(forKey: "DFreeKey") ?? false , height: longBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "DColorKey") ?? systemD, name: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "DNameKey") ?? "D-Block", timeRange: "10:00 - 11:15", block: "D", date: date, array: $array)
                            .frame(height: metrics.size.height * (75/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                    }
                    VStack(spacing: 0) {
                        universalBlock(boolValue: true, height: lunchBlock, color: systemGray, name: "Open", timeRange: "11:15 - 11:45", block: "Morning Open", date: date, array: $array)
                            .frame(height: metrics.size.height * (30/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        universalBlock(boolValue: true, height: lunchBlock, color: systemGray, name: "Lunch", timeRange: "11:45 - 12:15", block: "Lunch", date: date, array: $array)
                            .frame(height: metrics.size.height * (30/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                    }
                    VStack(spacing: 0) {
                        universalBlock(boolValue: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.bool(forKey: "GFreeKey") ?? false , height: longBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "GColorKey") ?? systemG, name: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "GNameKey") ?? "G-Block", timeRange: "12:15 - 1:30", block: "G", date: date, array: $array)
                            .frame(height: metrics.size.height * (75/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        passingBlockScheduleView()
                            .frame(height: metrics.size.height * (15/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        universalBlock(boolValue: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.bool(forKey: "HFreeKey") ?? false , height: longBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "HColorKey") ?? systemH, name: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "HNameKey") ?? "H-Block", timeRange: "1:45 - 3:00", block: "H", date: date, array: $array)
                            .frame(height: metrics.size.height * (75/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        universalBlock(boolValue: true, height: lunchBlock, color: systemGray, name: "Open", timeRange: "3:00 - 3:30", block: "Afternoon Open", date: date, array: $array)
                            .frame(height: metrics.size.height * (30/total))
                    }
                }
            }
        }
    }
}

// MARK: Special Tuesday View
struct ScheduleViewTueSpecial: View {
    let total = CGFloat(420+8*5)
    let spacing = CGFloat(5)
    var whichDay : String
    let date: Date
    @Environment(\.colorScheme) var colorScheme
    @Binding var array: [Entry]
    var body: some View {
        VStack {
            HStack{
                Text(whichDay)
                    .foregroundColor(colorScheme == .light ? Color(accentTeal.shaded(amount: 0.25)) : Color(accentTeal.tinted(amount: 0.25)))
                    .fontWeight(.medium)
                    .textCase(.uppercase)
                    .font(.system(size: 16))
                Spacer()
            }
            GeometryReader { metrics in
                VStack(spacing: 0) {
                    VStack(spacing: 0) {
                        universalBlock(boolValue: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.bool(forKey: "CFreeKey") ?? false,height: longBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CColorKey") ?? systemC, name:  UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CNameKey") ?? "C-Block", timeRange: "8:30 - 9:40", block: "C", date: date, array: $array)
                            .frame(height: metrics.size.height * (70/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        passingBlockScheduleView()
                            .frame(height: metrics.size.height * (15/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        universalBlock(boolValue: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.bool(forKey: "DFreeKey") ?? false ,height: longBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "DColorKey") ?? systemD, name: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "DNameKey") ?? "D-Block", timeRange: "9:55 - 11:05", block: "D", date: date, array: $array)
                            .frame(height: metrics.size.height * (70/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                    }
                    VStack(spacing: 0) {
                        universalBlock(boolValue: false, height: mediumBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CompassColorKey") ?? systemTeal, name: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CompassNameKey") ?? "Compass", timeRange: "11:05 - 11:55", block: "Compass", date: date, array: $array)
                            .frame(height: metrics.size.height * (50/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        universalBlock(boolValue: true, height: lunchBlock, color: systemGray, name: "Lunch", timeRange: "11:55 - 12:25", block: "Lunch", date: date, array: $array)
                            .frame(height: metrics.size.height * (30/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                    }
                    VStack(spacing: 0) {
                        universalBlock(boolValue: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.bool(forKey: "GFreeKey") ?? false , height: longBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "GColorKey") ?? systemG, name: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "GNameKey") ?? "G-Block", timeRange: "12:25 - 1:35", block: "G", date: date, array: $array)
                            .frame(height: metrics.size.height * (70/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        passingBlockScheduleView()
                            .frame(height: metrics.size.height * (15/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        universalBlock(boolValue: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.bool(forKey: "HFreeKey") ?? false ,height: longBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "HColorKey") ?? systemH, name: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "HNameKey") ?? "H-Block", timeRange: "1:50 - 3:00", block: "H", date: date, array: $array)
                            .frame(height: metrics.size.height * (70/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        universalBlock(boolValue: true, height: lunchBlock, color: systemGray, name: "Open", timeRange: "3:00 - 3:30", block: "Afternoon Open", date: date, array: $array)
                            .frame(height: metrics.size.height * (30/total))
                    }
                }
            }
        }
    }
}

// MARK: Wednesday View
struct ScheduleViewWed: View {
    let total = CGFloat(420+10*5)
    let spacing = CGFloat(5)
    var whichDay : String
    let date: Date
    @Environment(\.colorScheme) var colorScheme
    @Binding var array: [Entry]
    var body: some View {
        VStack {
            HStack{
                Text(whichDay)
                    .foregroundColor(colorScheme == .light ? Color(accentTeal.shaded(amount: 0.25)) : Color(accentTeal.tinted(amount: 0.25)))
                    .fontWeight(.medium)
                    .textCase(.uppercase)
                    .font(.system(size: 16))
                Spacer()
            }
            GeometryReader { metrics in
                VStack(spacing: 0) {
                    VStack(spacing: 0) {
                        universalBlock(boolValue: true, height: lunchBlock, color: systemGray, name: "Assessment", timeRange: "8:30 - 9:30", block: "Morning Assessment", date: date, array: $array)
                            .frame(height: metrics.size.height * (60/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        passingBlockScheduleView()
                            .frame(height: metrics.size.height * (5/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        universalBlock(boolValue: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.bool(forKey: "AdvisingFreeKey") ?? false , height: longBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AdvisingColorKey") ?? systemTeal, name: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "AdvisingNameKey") ?? "Advising", timeRange: "9:35 - 10:25", block: "Advising", date: date, array: $array)
                            .frame(height: metrics.size.height * (50/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        passingBlockScheduleView()
                            .frame(height: metrics.size.height * (5/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        universalBlock(boolValue: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.bool(forKey: "CommonFreeKey") ?? false , height: longBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CommonColorKey") ?? systemTeal, name: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CommonNameKey") ?? "Common Classroom", timeRange: "10:30 - 11:20", block: "Common Classroom", date: date, array: $array)
                            .frame(height: metrics.size.height * (50/total))
                    }
                    VStack(spacing: 0) {
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        universalBlock(boolValue: true, height: lunchBlock, color: systemGray, name: "Lunch", timeRange: "11:20 - 12:15", block: "Lunch", date: date, array: $array)
                            .frame(height: metrics.size.height * (55/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                    }
                    VStack(spacing: 0) {
                        universalBlock(boolValue: true, height: lunchBlock, color: systemGray, name: "Assessment", timeRange: "12:15 - 1:15", block: "Afternoon Assessment", date: date, array: $array)
                            .frame(height: metrics.size.height * (60/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        passingBlockScheduleView()
                            .frame(height: metrics.size.height * (5/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        universalBlock(boolValue: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.bool(forKey: "CompassFreeKey") ?? false , height: longBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CompassColorKey") ?? systemTeal, name: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CompassNameKey") ?? "Compass", timeRange: "1:20 - 2:10", block: "Compass", date: date, array: $array)
                            .frame(height: metrics.size.height * (50/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        passingBlockScheduleView()
                            .frame(height: metrics.size.height * (5/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        universalBlock(boolValue: true, height: lunchBlock, color: systemGray, name: "Faculty Collab", timeRange: "2:15 - 3:30", block: "Faculty Collaboration", date: date, array: $array)
                            .frame(height: metrics.size.height * (75/total))
                    }
                }
            }
        }
    }
}


// MARK: Thursday View
struct ScheduleViewThu: View {
    let total = CGFloat(420+8*5)
    let spacing = CGFloat(5)
    var whichDay : String
    let date: Date
    @Environment(\.colorScheme) var colorScheme
    @Binding var array: [Entry]
    var body: some View {
        VStack {
            HStack{
                Text(whichDay)
                    .foregroundColor(colorScheme == .light ? Color(accentTeal.shaded(amount: 0.25)) : Color(accentTeal.tinted(amount: 0.25)))
                    .fontWeight(.medium)
                    .textCase(.uppercase)
                    .font(.system(size: 16))
                Spacer()
            }
            GeometryReader { metrics in
                VStack(spacing: 0) {
                    VStack(spacing: 0) {
                        universalBlock(boolValue: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.bool(forKey: "BFreeKey") ?? false , height: longBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "BColorKey") ?? systemB, name: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "BNameKey") ?? "B-Block", timeRange: "8:30 - 9:45", block: "B", date: date, array: $array)
                            .frame(height: metrics.size.height * (75/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        passingBlockScheduleView()
                            .frame(height: metrics.size.height * (15/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        universalBlock(boolValue: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.bool(forKey: "AFreeKey") ?? false , height: longBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AColorKey") ?? systemA, name: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ANameKey") ?? "A-Block", timeRange: "10:00 - 11:15", block: "A", date: date, array: $array)
                            .frame(height: metrics.size.height * (75/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                    }
                    VStack(spacing: 0) {
                        universalBlock(boolValue: true, height: lunchBlock, color: systemGray, name: "Open", timeRange: "11:15 - 11:45", block: "Morning Open", date: date, array: $array)
                            .frame(height: metrics.size.height * (30/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        universalBlock(boolValue: true, height: lunchBlock, color: systemGray, name: "Lunch", timeRange: "11:45 - 12:15", block: "Lunch", date: date, array: $array)
                            .frame(height: metrics.size.height * (30/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                    }
                    VStack(spacing: 0) {
                        universalBlock(boolValue: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.bool(forKey: "FFreeKey") ?? false , height: longBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "FColorKey") ?? systemF, name: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "FNameKey") ?? "F-Block", timeRange: "12:15 - 1:30", block: "F", date: date, array: $array)
                            .frame(height: metrics.size.height * (75/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        passingBlockScheduleView()
                            .frame(height: metrics.size.height * (15/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        universalBlock(boolValue: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.bool(forKey: "EFreeKey") ?? false , height: longBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "EColorKey") ?? systemE, name: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ENameKey") ?? "E-Block", timeRange: "1:45 - 3:00", block: "E", date: date, array: $array)
                            .frame(height: metrics.size.height * (75/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        universalBlock(boolValue: true, height: lunchBlock, color: systemGray, name: "Open", timeRange: "3:00 - 3:30", block: "Afternoon Open", date: date, array: $array)
                            .frame(height: metrics.size.height * (30/total))
                    }
                }
            }
        }
    }
}

// MARK: Special Thursday View
struct ScheduleViewThuSpecial: View {
    let total = CGFloat(420+8*5)
    let spacing = CGFloat(5)
    var whichDay : String
    let date: Date
    @Environment(\.colorScheme) var colorScheme
    @Binding var array: [Entry]
    var body: some View {
        VStack {
            HStack{
                Text(whichDay)
                    .foregroundColor(colorScheme == .light ? Color(accentTeal.shaded(amount: 0.25)) : Color(accentTeal.tinted(amount: 0.25)))
                    .fontWeight(.medium)
                    .textCase(.uppercase)
                    .font(.system(size: 16))
                Spacer()
            }
            GeometryReader { metrics in
                VStack(spacing: 0) {
                    VStack(spacing: 0) {
                        universalBlock(boolValue: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.bool(forKey: "BFreeKey") ?? false,height: longBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "BColorKey") ?? systemB, name:  UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "BNameKey") ?? "B-Block", timeRange: "8:30 - 9:40", block: "B", date: date, array: $array)
                            .frame(height: metrics.size.height * (70/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        passingBlockScheduleView()
                            .frame(height: metrics.size.height * (15/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        universalBlock(boolValue: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.bool(forKey: "AFreeKey") ?? false ,height: longBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AColorKey") ?? systemA, name: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ANameKey") ?? "A-Block", timeRange: "9:55 - 11:05", block: "A", date: date, array: $array)
                            .frame(height: metrics.size.height * (70/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                    }
                    VStack(spacing: 0) {
                        universalBlock(boolValue: true, height: lunchBlock, color: systemGray, name: "Open", timeRange: "11:05 - 11:35", block: "Morning Open", date: date, array: $array)
                            .frame(height: metrics.size.height * (30/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        universalBlock(boolValue: true, height: lunchBlock, color: systemGray, name: "Lunch", timeRange: "11:35 - 12:25", block: "Lunch", date: date, array: $array)
                            .frame(height: metrics.size.height * (50/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                    }
                    VStack(spacing: 0) {
                        universalBlock(boolValue: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.bool(forKey: "FFreeKey") ?? false , height: longBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "FColorKey") ?? systemF, name: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "FNameKey") ?? "F-Block", timeRange: "12:25 - 1:35", block: "F", date: date, array: $array)
                            .frame(height: metrics.size.height * (70/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        passingBlockScheduleView()
                            .frame(height: metrics.size.height * (15/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        universalBlock(boolValue: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.bool(forKey: "EFreeKey") ?? false ,height: longBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "EColorKey") ?? systemE, name: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ENameKey") ?? "E-Block", timeRange: "1:50 - 3:00", block: "E", date: date, array: $array)
                            .frame(height: metrics.size.height * (70/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        universalBlock(boolValue: true, height: lunchBlock, color: systemGray, name: "Open", timeRange: "3:00 - 3:30", block: "Afternoon Open", date: date, array: $array)
                            .frame(height: metrics.size.height * (30/total))
                    }
                }
            }
        }
    }
}

// MARK: Friday View
struct ScheduleViewFri: View {
    let total = CGFloat(420+8*5)
    let spacing = CGFloat(5)
    var whichDay : String
    let date: Date
    @Environment(\.colorScheme) var colorScheme
    @Binding var array: [Entry]
    var body: some View {
        VStack {
            HStack{
                Text(whichDay)
                    .foregroundColor(colorScheme == .light ? Color(accentTeal.shaded(amount: 0.25)) : Color(accentTeal.tinted(amount: 0.25)))
                    .fontWeight(.medium)
                    .textCase(.uppercase)
                    .font(.system(size: 16))
                Spacer()
            }
            GeometryReader { metrics in
                VStack(spacing: 0) {
                    VStack(spacing: 0) {
                        universalBlock(boolValue: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.bool(forKey: "DFreeKey") ?? false , height: longBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "DColorKey") ?? systemD, name: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "DNameKey") ?? "D-Block", timeRange: "8:30 - 9:45", block: "D", date: date, array: $array)
                            .frame(height: metrics.size.height * (75/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        passingBlockScheduleView()
                            .frame(height: metrics.size.height * (15/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        universalBlock(boolValue: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.bool(forKey: "CFreeKey") ?? false , height: longBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CColorKey") ?? systemC, name: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CNameKey") ?? "C-Block", timeRange: "10:00 - 11:15", block: "C", date: date, array: $array)
                            .frame(height: metrics.size.height * (75/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                    }
                    VStack(spacing: 0) {
                        universalBlock(boolValue: true, height: lunchBlock, color: systemGray, name: "Open", timeRange: "11:15 - 11:45", block: "Morning Open", date: date, array: $array)
                            .frame(height: metrics.size.height * (30/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        universalBlock(boolValue: true, height: lunchBlock, color: systemGray, name: "Lunch", timeRange: "11:45 - 12:15", block: "Lunch", date: date, array: $array)
                            .frame(height: metrics.size.height * (30/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                    }
                    VStack(spacing: 0) {
                        universalBlock(boolValue: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.bool(forKey: "HFreeKey") ?? false , height: longBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "HColorKey") ?? systemH, name: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "HNameKey") ?? "H-Block", timeRange: "12:15 - 1:30", block: "H", date: date, array: $array)
                            .frame(height: metrics.size.height * (75/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        passingBlockScheduleView()
                            .frame(height: metrics.size.height * (15/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        universalBlock(boolValue: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.bool(forKey: "GFreeKey") ?? false , height: longBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "GColorKey") ?? systemG, name: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "GNameKey") ?? "G-Block", timeRange: "1:45 - 3:00", block: "G", date: date, array: $array)
                            .frame(height: metrics.size.height * (75/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        universalBlock(boolValue: true, height: lunchBlock, color: systemGray, name: "Open", timeRange: "3:00 - 3:30", block: "Afternoon Open", date: date, array: $array)
                            .frame(height: metrics.size.height * (30/total))
                    }
                }
            }
        }
    }
}

// MARK: Special Friday View
struct ScheduleViewFriSpecial: View {
    let total = CGFloat(420+8*5)
    let spacing = CGFloat(5)
    var whichDay : String
    let date: Date
    @Environment(\.colorScheme) var colorScheme
    @Binding var array: [Entry]
    var body: some View {
        VStack {
            HStack{
                Text(whichDay)
                    .foregroundColor(colorScheme == .light ? Color(accentTeal.shaded(amount: 0.25)) : Color(accentTeal.tinted(amount: 0.25)))
                    .fontWeight(.medium)
                    .textCase(.uppercase)
                    .font(.system(size: 16))
                Spacer()
            }
            GeometryReader { metrics in
                VStack(spacing: 0) {
                    VStack(spacing: 0) {
                        universalBlock(boolValue: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.bool(forKey: "DFreeKey") ?? false,height: longBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "DColorKey") ?? systemD, name:  UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "DNameKey") ?? "D-Block", timeRange: "8:30 - 9:40", block: "D", date: date, array: $array)
                            .frame(height: metrics.size.height * (70/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        passingBlockScheduleView()
                            .frame(height: metrics.size.height * (15/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        universalBlock(boolValue: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.bool(forKey: "CFreeKey") ?? false ,height: longBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CColorKey") ?? systemC, name: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CNameKey") ?? "C-Block", timeRange: "9:55 - 11:05", block: "C", date: date, array: $array)
                            .frame(height: metrics.size.height * (70/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                    }
                    VStack(spacing: 0) {
                        universalBlock(boolValue: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.bool(forKey: "AdvisingFreeKey") ?? false ,height: longBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AdvisingColorKey") ?? systemTeal, name: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "AdvisingNameKey") ?? "Advising", timeRange: "11:05 - 11:35", block: "Advising", date: date, array: $array)
                            .frame(height: metrics.size.height * (30/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        universalBlock(boolValue: true, height: lunchBlock, color: systemGray, name: "Lunch", timeRange: "11:35 - 12:25", block: "Lunch", date: date, array: $array)
                            .frame(height: metrics.size.height * (50/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                    }
                    VStack(spacing: 0) {
                        universalBlock(boolValue: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.bool(forKey: "HFreeKey") ?? false , height: longBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "HColorKey") ?? systemH, name: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "HNameKey") ?? "H-Block", timeRange: "12:25 - 1:35", block: "H", date: date, array: $array)
                            .frame(height: metrics.size.height * (70/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        passingBlockScheduleView()
                            .frame(height: metrics.size.height * (15/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        universalBlock(boolValue: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.bool(forKey: "GFreeKey") ?? false ,height: longBlock, color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "GColorKey") ?? systemG, name: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "GNameKey") ?? "G-Block", timeRange: "1:50 - 3:00", block: "G", date: date, array: $array)
                            .frame(height: metrics.size.height * (70/total))
                        Spacer().frame(height: metrics.size.height * (spacing/total))
                        universalBlock(boolValue: true, height: lunchBlock, color: systemGray, name: "Open", timeRange: "3:00 - 3:30", block: "Afternoon Open", date: date, array: $array)
                            .frame(height: metrics.size.height * (30/total))
                    }
                }
            }
        }
    }
}
