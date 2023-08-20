//  ScheduleUIView.swift
//  Schedule.app
//
//  Created by Rahim Malik on 7/11/20.
//  Copyright © 2020 Rahim Malik. All rights reserved.

import SwiftUI

let weekday = Calendar.current.component(.weekday, from: Date())

func setDate(hour: Int, minute: Int, day: Int, month: Int, year: Int) -> Date {
    var components = DateComponents()
    components.hour = hour
    components.minute = minute
    components.day = day
    components.month = month
    components.year = year
    let userCalendar = Calendar.current
    let someDateTime = userCalendar.date(from: components)
    return(someDateTime) ?? Date()
}

func arrowDate(input: Date, weekofyear: Int) -> Date {
    var components = DateComponents()
    components.hour = Calendar.current.component(.hour, from: input)
    components.minute = Calendar.current.component(.minute, from: input)
    components.day = Calendar.current.component(.day, from: input)
    components.weekOfYear = weekofyear
    components.year = Calendar.current.component(.year, from: input)
    let userCalendar = Calendar.current
    let someDateTime = userCalendar.date(from: components)
    return(someDateTime) ?? Date()
}

func getdayofweek(mode: Bool, input: Int, date: Date) -> String {
    let formatter = DateFormatter()
    let weeko = Calendar.current.component(.weekOfYear, from: date)
    let yearo = Calendar.current.component(.year, from: date)
    var components = DateComponents()
    components.weekday = input
    components.weekOfYear = weeko
    components.year = yearo
    if mode {
        let newdate = Calendar.current.date(from: components)
        formatter.dateFormat = "EEEE, MMMM d"
        let dateString = formatter.string(from: newdate ?? Date())
        return dateString
    } else {
        let newdate = Calendar.current.date(from: components)
        formatter.dateFormat = "EEE M/d"
        let dateString = formatter.string(from: newdate ?? Date())
        return dateString
    }
}

func getDatefromWeekofyear(weekofyear: Int, weekday: Int) -> Date {
    var components = DateComponents()
    components.weekOfYear = weekofyear
    components.weekday = weekday
    components.year = currentYear
    return(Calendar.current.date(from: components) ?? Date())
}

struct ScheduleViewFull: View {
    @Binding var weekofyear: Int
    @Binding var date: Date
    let spacing = CGFloat(15)
    var frame: CGFloat
    @Binding var array: [Entry]
    
    var body: some View {
        HStack {
            if (weekofyear == 3) {
                HStack(spacing: spacing) {
                    ScheduleViewHoliday(whichWeekend: getdayofweek(mode: false, input: 2, date: date), reason: "Winter Break", date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 2), array: $array)
                    ScheduleViewHoliday(whichWeekend: getdayofweek(mode: false, input: 3, date: date), reason: "Faculty Inservice", date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 3), array: $array)
                    ScheduleViewHoliday(whichWeekend: getdayofweek(mode: false, input: 4, date: date), reason: "Pick Up Supplies", date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 4), array: $array)
                    ScheduleViewMon(whichDay: getdayofweek(mode: false, input: 5, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 5), array: $array)
                    ScheduleViewTue(whichDay: getdayofweek(mode: false, input: 6, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 6), array: $array)
                }
            }
            else if (weekofyear == 4) {
                HStack(spacing: spacing) {
                    ScheduleViewHoliday(whichWeekend: getdayofweek(mode: false, input: 2, date: date), reason: "Martin Luther King Jr. Day", date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 2), array: $array)
                    ScheduleViewMonSpecial(whichDay: getdayofweek(mode: false, input: 3, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 3), array: $array)
                    ScheduleViewTueSpecial(whichDay: getdayofweek(mode: false, input: 4, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 4), array: $array)
                    ScheduleViewThuSpecial(whichDay: getdayofweek(mode: false, input: 5, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 5), array: $array)
                    ScheduleViewFriSpecial(whichDay: getdayofweek(mode: false, input: 6, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 6), array: $array)
                }
            }
            else if (weekofyear == 5) {
                HStack(spacing: spacing) {
                    ScheduleViewMon(whichDay: getdayofweek(mode: false, input: 2, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 2), array: $array)
                    ScheduleViewTue(whichDay: getdayofweek(mode: false, input: 3, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 3), array: $array)
                    ScheduleViewHoliday(whichWeekend: getdayofweek(mode: false, input: 4, date: date), reason: "CPS Day", date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 4), array: $array)
                    ScheduleViewThu(whichDay: getdayofweek(mode: false, input: 5, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 5), array: $array)
                    ScheduleViewFri(whichDay: getdayofweek(mode: false, input: 6, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 6), array: $array)
                }
            }
            else if (weekofyear == 8) {
                HStack(spacing: spacing) {
                    ScheduleViewHoliday(whichWeekend: getdayofweek(mode: false, input: 2, date: date), reason: "President's Day", date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 2), array: $array)
                    ScheduleViewMonSpecial(whichDay: getdayofweek(mode: false, input: 3, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 3), array: $array)
                    ScheduleViewTueSpecial(whichDay: getdayofweek(mode: false, input: 4, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 4), array: $array)
                    ScheduleViewThuSpecial(whichDay: getdayofweek(mode: false, input: 5, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 5), array: $array)
                    ScheduleViewFriSpecial(whichDay: getdayofweek(mode: false, input: 6, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 6), array: $array)
                }
            }
            else if (weekofyear == 10) {
                HStack(spacing: spacing) {
                    ScheduleViewHoliday(whichWeekend: getdayofweek(mode: false, input: 2, date: date), reason: "Intraterm", date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 2), array: $array)
                    ScheduleViewHoliday(whichWeekend: getdayofweek(mode: false, input: 3, date: date), reason: "Intraterm", date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 3), array: $array)
                    ScheduleViewHoliday(whichWeekend: getdayofweek(mode: false, input: 4, date: date), reason: "Intraterm", date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 4), array: $array)
                    ScheduleViewHoliday(whichWeekend: getdayofweek(mode: false, input: 5, date: date), reason: "No Classes", date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 5), array: $array)
                    ScheduleViewHoliday(whichWeekend: getdayofweek(mode: false, input: 6, date: date), reason: "No Classes", date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 6), array: $array)
                }
            }
            else if (weekofyear == 12) {
                HStack(spacing: spacing) {
                    ScheduleViewMonSpecial(whichDay: getdayofweek(mode: false, input: 2, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 2), array: $array)
                    ScheduleViewTueSpecial(whichDay: getdayofweek(mode: false, input: 3, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 3), array: $array)
                    ScheduleViewThuSpecial(whichDay: getdayofweek(mode: false, input: 4, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 4), array: $array)
                    ScheduleViewFriSpecial(whichDay: getdayofweek(mode: false, input: 5, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 5), array: $array)
                    ScheduleViewHoliday(whichWeekend: getdayofweek(mode: false, input: 6, date: date), reason: "Quarter Break", date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 6), array: $array)
                }
            }
            else if (weekofyear == 15) {
                HStack(spacing: spacing) {
                    ScheduleViewHoliday(whichWeekend: getdayofweek(mode: false, input: 2, date: date), reason: "Spring Break", date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 2), array: $array)
                    ScheduleViewHoliday(whichWeekend: getdayofweek(mode: false, input: 3, date: date), reason: "Spring Break", date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 3), array: $array)
                    ScheduleViewHoliday(whichWeekend: getdayofweek(mode: false, input: 4, date: date), reason: "Spring Break", date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 4), array: $array)
                    ScheduleViewHoliday(whichWeekend: getdayofweek(mode: false, input: 5, date: date), reason: "Spring Break", date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 5), array: $array)
                    ScheduleViewHoliday(whichWeekend: getdayofweek(mode: false, input: 6, date: date), reason: "Spring Break", date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 6), array: $array)
                }
            }
            else if (weekofyear == 22) {
                HStack(spacing: spacing) {
                    ScheduleViewMonSpecial(whichDay: getdayofweek(mode: false, input: 2, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 2), array: $array)
                    ScheduleViewTueSpecial(whichDay: getdayofweek(mode: false, input: 3, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 3), array: $array)
                    ScheduleViewThuSpecial(whichDay: getdayofweek(mode: false, input: 4, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 4), array: $array)
                    ScheduleViewFriSpecial(whichDay: getdayofweek(mode: false, input: 5, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 5), array: $array)
                    ScheduleViewHoliday(whichWeekend: getdayofweek(mode: false, input: 6, date: date), reason: "No Classes", date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 6), array: $array)
                }
            }
//            else if (weekofyear == 23) {
//                HStack(spacing: spacing) {
//                    ScheduleViewHoliday(whichWeekend: getdayofweek(mode: false, input: 2, date: date), reason: "Memorial Day", date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 2), array: $array)
//                    ScheduleViewFinals(whichDay: getdayofweek(mode: false, input: 3, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 3), array: $array)
//                    ScheduleViewFinals(whichDay: getdayofweek(mode: false, input: 4, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 4), array: $array)
//                    ScheduleViewFinals(whichDay: getdayofweek(mode: false, input: 5, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 5), array: $array)
//                    ScheduleViewHoliday(whichWeekend: getdayofweek(mode: false, input: 6, date: date), reason: "Last Day of School", date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 6), array: $array)
//                }
//            }
            else if (weekofyear < 23 && weekofyear > 2) {
                HStack(spacing: spacing) {
                    ScheduleViewMon(whichDay: getdayofweek(mode: false, input: 2, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 2), array: $array)
                    ScheduleViewTue(whichDay: getdayofweek(mode: false, input: 3, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 3), array: $array)
                    ScheduleViewWed(whichDay: getdayofweek(mode: false, input: 4, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 4), array: $array)
                    ScheduleViewThu(whichDay: getdayofweek(mode: false, input: 5, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 5), array: $array)
                    ScheduleViewFri(whichDay: getdayofweek(mode: false, input: 6, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 6), array: $array)
                }
            }
        }.padding([.leading,.trailing])
    }
}

struct ScheduleView: View {
    @State private var switchModes = false
    @State var datepopup = false
    @State var weekofyear: Int = Calendar.current.component(.weekOfYear, from: Date())
    @State var sampledate: Date = Date()
    @State var todayflag: Bool = false
    @State var binding: String = ""
    @Binding var array: [Entry]
    @ObservedObject var options = QLFetcher()
    let timer = Timer.publish(every: 5, tolerance: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            ScheduleViewFull(weekofyear: $weekofyear, date: $sampledate, frame: CGFloat(130), array: $array)
                .padding([.top,.bottom])
                .onChange(of: self.todayflag, perform: { value in
                    self.sampledate = Date()
                    self.weekofyear = Calendar.current.component(.weekOfYear, from: sampledate)
                })
                .onChange(of: self.sampledate, perform: { value in
                    self.weekofyear = Calendar.current.component(.weekOfYear, from: sampledate)
                })
                .onReceive(timer, perform: { _ in
                    array = getQLData(input: options)
                })
        }.toolbar {
            ToolbarItem(placement: .navigation) {
                HStack {
                Button(action: {
                    var dateComponent = DateComponents()
                    dateComponent.weekOfYear = -1
                    sampledate = Calendar.current.date(byAdding: dateComponent, to: sampledate) ?? sampledate
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color("SystemToolbar"))
                }
                .keyboardShortcut(KeyEquivalent.leftArrow, modifiers: [])
                Button(action: {
                    var dateComponent = DateComponents()
                    dateComponent.weekOfYear = 1
                    sampledate = Calendar.current.date(byAdding: dateComponent, to: sampledate) ?? sampledate
                }) {
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color("SystemToolbar"))
                }
                .keyboardShortcut(KeyEquivalent.rightArrow, modifiers: [])
                }
            }
            ToolbarItem(placement: .primaryAction) {
                HStack {
                    Button(action: {
                        self.todayflag.toggle()
                    }) {
                        Image(systemName: "calendar.badge.clock")
                            .foregroundColor(Color("SystemToolbar"))
                    }
                    .keyboardShortcut(KeyEquivalent("t"), modifiers: [])
                    Button(action: {
                        self.datepopup.toggle()
                    }) {
                        Text(sampledate, style: .date)
                            .foregroundColor(Color("SystemToolbar"))
                    }
                    .keyboardShortcut(KeyEquivalent("d"), modifiers: [])
                    .popover(isPresented: $datepopup, arrowEdge: .bottom) {
                        DatePicker("Date", selection: $sampledate, in: setDate(hour: 0, minute: 0, day: 10, month: 1, year: 2021)...setDate(hour: 0, minute: 0, day: 29, month: 5, year: 2021), displayedComponents: .date)
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .labelsHidden()
                            .onChange(of: self.sampledate, perform: { value in
                                self.weekofyear = Calendar.current.component(.weekOfYear, from: sampledate)
                            })
                            .padding()
                    }
                }
            }
        }
    }
}
