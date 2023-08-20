//  ScheduleView.swift
//  Schedule.app
//
//  Created by Rahim Malik on 7/11/20.
//  Copyright © 2020 Rahim Malik. All rights reserved.

import SwiftUI
import Pages
import DynamicColor

let weekday = Calendar.current.component(.weekday, from: Date())

func changePage(date: Date) -> Int {
    switch Calendar.current.component(.weekday, from: date) {
    case 1: return(0)
    case 2: return(1)
    case 3: return(2)
    case 4: return(3)
    case 5: return(4)
    case 6: return(5)
    case 7: return(6)
    default: return(1)
    }
}

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

func getDatefromWeekofyear(weekofyear: Int, weekday: Int) -> Date {
    var components = DateComponents()
    components.weekOfYear = weekofyear
    components.weekday = weekday
    components.year = currentYear
    return(Calendar.current.date(from: components) ?? Date())
}

// MARK: Schedule Body
struct ScheduleViewBody: View {
    @State var currentWeekPage = 0
    @State var currentPage = weekday - 1
    @State var currentDay = currentWeekDay
    @State var weekofyear: Int = Calendar.current.component(.weekOfYear, from: Date())
    @State var sampledate: Date = Date()
    @Environment(\.verticalSizeClass) var vSizeClass
    @Environment(\.horizontalSizeClass) var hSizeClass
    @Binding var switchmodes: Bool
    @Binding var todayflag: Bool
    @Binding var array: [Entry]
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                DatePicker("Date", selection: $sampledate, in: setDate(hour: 0, minute: 0, day: 10, month: 1, year: 2021)...setDate(hour: 0, minute: 0, day: 29, month: 5, year: 2021), displayedComponents: .date)
                    .datePickerStyle(CompactDatePickerStyle())
                    .labelsHidden()
                    .padding(.top, 20)
                    .padding(.trailing)
                    .onChange(of: self.sampledate, perform: { value in
                        self.currentPage = changePage(date: self.sampledate)
                        self.weekofyear = Calendar.current.component(.weekOfYear, from: sampledate)
                        let impactHeavy = UIImpactFeedbackGenerator(style: .soft)
                        impactHeavy.impactOccurred()
                    })
                    .onChange(of: self.todayflag, perform: { value in
                        self.sampledate = Date()
                    })
                Image(systemName: "ellipsis.circle")
                    .font(.system(size: 24))
                    .opacity(0)
            }
            Spacer()
            if switchmodes {
                ScheduleViewScroll(scrollDirection: .horizontal, weekofyear: $weekofyear, date: $sampledate, array: $array)
                    .padding([.top,.bottom])
            } else {
                if (weekofyear == 52) {
                    Pages(currentPage: $currentPage, wrap: false, hasControl: false, pages: {
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 1, date: self.sampledate), reason: "No Classes")
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 2, date: self.sampledate), reason: "Finals Day 1: No Classes")
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 3, date: self.sampledate), reason: "Finals Day 2: No Classes")
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 4, date: self.sampledate), reason: "Winter Break: No Classes")
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 5, date: self.sampledate), reason: "Winter Break: No Classes")
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 6, date: self.sampledate), reason: "Winter Break: No Classes")
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 7, date: self.sampledate), reason: "No Classes")
                            .padding([.leading,.trailing])
                    }).padding([.top,.bottom])
                }
                else if (weekofyear == 53 || weekofyear == 1 || weekofyear == 2) {
                    Pages(currentPage: $currentPage, wrap: false, hasControl: false, pages: {
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 1, date: self.sampledate), reason: "No Classes")
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 2, date: self.sampledate), reason: "Winter Break: No Classes")
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 3, date: self.sampledate), reason: "Winter Break: No Classes")
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 4, date: self.sampledate), reason: "Winter Break: No Classes")
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 5, date: self.sampledate), reason: "Winter Break: No Classes")
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 6, date: self.sampledate), reason: "Winter Break: No Classes")
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 7, date: self.sampledate), reason: "No Classes")
                            .padding([.leading,.trailing])
                    }).padding([.top,.bottom])
                }
                else if (weekofyear == 3) {
                    Pages(currentPage: $currentPage, wrap: false, hasControl: false, pages: {
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 1, date: self.sampledate), reason: "No Classes")
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 2, date: self.sampledate), reason: "Winter Break: No Classes")
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 3, date: self.sampledate), reason: "Faculty Inservice: No Classes")
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 4, date: self.sampledate), reason: "Pick Up Supplies: No Classes")
                            .padding([.leading,.trailing])
                        ScheduleViewMon(whichDay: getdayofweek(mode: true, input: 5, date: self.sampledate), date: getDatefromWeekofyear(weekofyear: Calendar.current.component(.weekOfYear, from: sampledate), weekday: 5), array: $array)
                            .padding([.leading,.trailing])
                        ScheduleViewTue(whichDay: getdayofweek(mode: true, input: 6, date: self.sampledate), date: getDatefromWeekofyear(weekofyear: Calendar.current.component(.weekOfYear, from: sampledate), weekday: 6), array: $array)
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 7, date: self.sampledate), reason: "No Classes")
                            .padding([.leading,.trailing])
                    }).padding([.top,.bottom])
                }
                else if (weekofyear == 4) {
                    Pages(currentPage: $currentPage, wrap: false, hasControl: false, pages: {
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 1, date: self.sampledate), reason: "No Classes")
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 2, date: self.sampledate), reason: "Martin Luther King Jr. Day: No Classes")
                            .padding([.leading,.trailing])
                        ScheduleViewMonSpecial(whichDay: getdayofweek(mode: true, input: 3, date: self.sampledate), date: getDatefromWeekofyear(weekofyear: Calendar.current.component(.weekOfYear, from: sampledate), weekday: 3), array: $array)
                            .padding([.leading,.trailing])
                        ScheduleViewTueSpecial(whichDay: getdayofweek(mode: true, input: 4, date: self.sampledate), date: getDatefromWeekofyear(weekofyear: Calendar.current.component(.weekOfYear, from: sampledate), weekday: 4), array: $array)
                            .padding([.leading,.trailing])
                        ScheduleViewThuSpecial(whichDay: getdayofweek(mode: true, input: 5, date: self.sampledate), date: getDatefromWeekofyear(weekofyear: Calendar.current.component(.weekOfYear, from: sampledate), weekday: 5), array: $array)
                            .padding([.leading,.trailing])
                        ScheduleViewFriSpecial(whichDay: getdayofweek(mode: true, input: 6, date: self.sampledate), date: getDatefromWeekofyear(weekofyear: Calendar.current.component(.weekOfYear, from: sampledate), weekday: 6), array: $array)
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 7, date: self.sampledate), reason: "No Classes")
                            .padding([.leading,.trailing])
                    }).padding([.top,.bottom])
                }
                else if (weekofyear == 5) {
                    Pages(currentPage: $currentPage, wrap: false, hasControl: false, pages: {
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 1, date: self.sampledate), reason: "No Classes")
                            .padding([.leading,.trailing])
                        ScheduleViewMon(whichDay: getdayofweek(mode: true, input: 2, date: self.sampledate), date: getDatefromWeekofyear(weekofyear: Calendar.current.component(.weekOfYear, from: sampledate), weekday: 2), array: $array)
                            .padding([.leading,.trailing])
                        ScheduleViewTue(whichDay: getdayofweek(mode: true, input: 3, date: self.sampledate), date: getDatefromWeekofyear(weekofyear: Calendar.current.component(.weekOfYear, from: sampledate), weekday: 3), array: $array)
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 4, date: self.sampledate), reason: "CPS Day: No Classes")
                            .padding([.leading,.trailing])
                        ScheduleViewThu(whichDay: getdayofweek(mode: true, input: 5, date: self.sampledate), date: getDatefromWeekofyear(weekofyear: Calendar.current.component(.weekOfYear, from: sampledate), weekday: 5), array: $array)
                            .padding([.leading,.trailing])
                        ScheduleViewFri(whichDay: getdayofweek(mode: true, input: 6, date: self.sampledate), date: getDatefromWeekofyear(weekofyear: Calendar.current.component(.weekOfYear, from: sampledate), weekday: 6), array: $array)
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 7, date: self.sampledate), reason: "No Classes")
                            .padding([.leading,.trailing])
                    }).padding([.top,.bottom])
                }
                else if (weekofyear == 8) {
                    Pages(currentPage: $currentPage, wrap: false, hasControl: false, pages: {
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 1, date: self.sampledate), reason: "Happy Valentines Day")
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 2, date: self.sampledate), reason: "President's Day: No Classes")
                            .padding([.leading,.trailing])
                        ScheduleViewMonSpecial(whichDay: getdayofweek(mode: true, input: 3, date: self.sampledate), date: getDatefromWeekofyear(weekofyear: Calendar.current.component(.weekOfYear, from: sampledate), weekday: 3), array: $array)
                            .padding([.leading,.trailing])
                        ScheduleViewTueSpecial(whichDay: getdayofweek(mode: true, input: 4, date: self.sampledate), date: getDatefromWeekofyear(weekofyear: Calendar.current.component(.weekOfYear, from: sampledate), weekday: 4), array: $array)
                            .padding([.leading,.trailing])
                        ScheduleViewThuSpecial(whichDay: getdayofweek(mode: true, input: 5, date: self.sampledate), date: getDatefromWeekofyear(weekofyear: Calendar.current.component(.weekOfYear, from: sampledate), weekday: 5), array: $array)
                            .padding([.leading,.trailing])
                        ScheduleViewFriSpecial(whichDay: getdayofweek(mode: true, input: 6, date: self.sampledate), date: getDatefromWeekofyear(weekofyear: Calendar.current.component(.weekOfYear, from: sampledate), weekday: 6), array: $array)
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 7, date: self.sampledate), reason: "No Classes")
                            .padding([.leading,.trailing])
                    }).padding([.top,.bottom])
                }
                else if (weekofyear == 10) {
                    Pages(currentPage: $currentPage, wrap: false, hasControl: false, pages: {
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 1, date: self.sampledate), reason: "No Classes")
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 2, date: self.sampledate), reason: "Intraterm: No Classes")
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 3, date: self.sampledate), reason: "Intraterm: No Classes")
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 4, date: self.sampledate), reason: "Intraterm: No Classes")
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 5, date: self.sampledate), reason: "No Classes")
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 6, date: self.sampledate), reason: "No Classes")
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 7, date: self.sampledate), reason: "No Classes")
                            .padding([.leading,.trailing])
                    }).padding([.top,.bottom])
                }
                else if (weekofyear == 12) {
                    Pages(currentPage: $currentPage, wrap: false, hasControl: false, pages: {
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 1, date: self.sampledate), reason: "No Classes")
                            .padding([.leading,.trailing])
                        ScheduleViewMonSpecial(whichDay: getdayofweek(mode: true, input: 2, date: self.sampledate), date: getDatefromWeekofyear(weekofyear: Calendar.current.component(.weekOfYear, from: sampledate), weekday: 2), array: $array)
                            .padding([.leading,.trailing])
                        ScheduleViewTueSpecial(whichDay: getdayofweek(mode: true, input: 3, date: self.sampledate), date: getDatefromWeekofyear(weekofyear: Calendar.current.component(.weekOfYear, from: sampledate), weekday: 3), array: $array)
                            .padding([.leading,.trailing])
                        ScheduleViewThuSpecial(whichDay: getdayofweek(mode: true, input: 4, date: self.sampledate), date: getDatefromWeekofyear(weekofyear: Calendar.current.component(.weekOfYear, from: sampledate), weekday: 4), array: $array)
                            .padding([.leading,.trailing])
                        ScheduleViewFriSpecial(whichDay: getdayofweek(mode: true, input: 5, date: self.sampledate), date: getDatefromWeekofyear(weekofyear: Calendar.current.component(.weekOfYear, from: sampledate), weekday: 5), array: $array)
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 6, date: self.sampledate), reason: "Quarter Break: No Classes")
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 7, date: self.sampledate), reason: "No Classes")
                            .padding([.leading,.trailing])
                    }).padding([.top,.bottom])
                }
                else if (weekofyear == 15) {
                    Pages(currentPage: $currentPage, wrap: false, hasControl: false, pages: {
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 1, date: self.sampledate), reason: "No Classes")
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 2, date: self.sampledate), reason: "Spring Break: No Classes")
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 3, date: self.sampledate), reason: "Spring Break: No Classes")
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 4, date: self.sampledate), reason: "Spring Break: No Classes")
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 5, date: self.sampledate), reason: "Spring Break: No Classes")
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 6, date: self.sampledate), reason: "Spring Break: No Classes")
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 7, date: self.sampledate), reason: "No Classes")
                            .padding([.leading,.trailing])
                    }).padding([.top,.bottom])
                }
                else if (weekofyear == 22) {
                    Pages(currentPage: $currentPage, wrap: false, hasControl: false, pages: {
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 1, date: self.sampledate), reason: "No Classes")
                            .padding([.leading,.trailing])
                        ScheduleViewMonSpecial(whichDay: getdayofweek(mode: true, input: 2, date: self.sampledate), date: getDatefromWeekofyear(weekofyear: Calendar.current.component(.weekOfYear, from: sampledate), weekday: 2), array: $array)
                            .padding([.leading,.trailing])
                        ScheduleViewTueSpecial(whichDay: getdayofweek(mode: true, input: 3, date: self.sampledate), date: getDatefromWeekofyear(weekofyear: Calendar.current.component(.weekOfYear, from: sampledate), weekday: 3), array: $array)
                            .padding([.leading,.trailing])
                        ScheduleViewThuSpecial(whichDay: getdayofweek(mode: true, input: 4, date: self.sampledate), date: getDatefromWeekofyear(weekofyear: Calendar.current.component(.weekOfYear, from: sampledate), weekday: 4), array: $array)
                            .padding([.leading,.trailing])
                        ScheduleViewFriSpecial(whichDay: getdayofweek(mode: true, input: 5, date: self.sampledate), date: getDatefromWeekofyear(weekofyear: Calendar.current.component(.weekOfYear, from: sampledate), weekday: 5), array: $array)
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 6, date: self.sampledate), reason: "No Classes")
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 7, date: self.sampledate), reason: "No Classes")
                            .padding([.leading,.trailing])
                    }).padding([.top,.bottom])
                }
                else if (weekofyear < 23 && weekofyear > 2) {
                    Pages(currentPage: $currentPage, wrap: false, hasControl: false, pages: {
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 1, date: self.sampledate), reason: "No Classes")
                            .padding([.leading,.trailing])
                        ScheduleViewMon(whichDay: getdayofweek(mode: true, input: 2, date: self.sampledate), date: getDatefromWeekofyear(weekofyear: Calendar.current.component(.weekOfYear, from: sampledate), weekday: 2), array: $array)
                            .padding([.leading,.trailing])
                        ScheduleViewTue(whichDay: getdayofweek(mode: true, input: 3, date: self.sampledate), date: getDatefromWeekofyear(weekofyear: Calendar.current.component(.weekOfYear, from: sampledate), weekday: 3), array: $array)
                            .padding([.leading,.trailing])
                        ScheduleViewWed(whichDay: getdayofweek(mode: true, input: 4, date: self.sampledate), date: getDatefromWeekofyear(weekofyear: Calendar.current.component(.weekOfYear, from: sampledate), weekday: 4), array: $array)
                            .padding([.leading,.trailing])
                        ScheduleViewThu(whichDay: getdayofweek(mode: true, input: 5, date: self.sampledate), date: getDatefromWeekofyear(weekofyear: Calendar.current.component(.weekOfYear, from: sampledate), weekday: 5), array: $array)
                            .padding([.leading,.trailing])
                        ScheduleViewFri(whichDay: getdayofweek(mode: true, input: 6, date: self.sampledate), date: getDatefromWeekofyear(weekofyear: Calendar.current.component(.weekOfYear, from: sampledate), weekday: 6), array: $array)
                            .padding([.leading,.trailing])
                        ScheduleViewWeekend(whichWeekend: getdayofweek(mode: true, input: 7, date: self.sampledate), reason: "No Classes")
                            .padding([.leading,.trailing])
                    }).padding([.top,.bottom])
                }
            }
        }
    }
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

struct ScheduleViewScroll: View {
    var scrollDirection: Axis.Set
    @Binding var weekofyear: Int
    @Binding var date: Date
    let spacing = CGFloat(12)
    let frame = CGFloat(120)
    @Binding var array: [Entry]
    
    var body: some View {
        ScrollView (scrollDirection, showsIndicators: false) {
            if (weekofyear == 3) {
                HStack(spacing: spacing) {
                    ScheduleViewHoliday(whichWeekend: getdayofweek(mode: false, input: 2, date: date), reason: "Winter Break", date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 2), array: $array).frame(width: frame)
                    ScheduleViewHoliday(whichWeekend: getdayofweek(mode: false, input: 3, date: date), reason: "Faculty Inservice", date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 3), array: $array).frame(width: frame)
                    ScheduleViewHoliday(whichWeekend: getdayofweek(mode: false, input: 4, date: date), reason: "Pick Up Supplies", date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 4), array: $array).frame(width: frame)
                    ScheduleViewMon(whichDay: getdayofweek(mode: false, input: 5, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 5), array: $array).frame(width: frame)
                    ScheduleViewTue(whichDay: getdayofweek(mode: false, input: 6, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 6), array: $array).frame(width: frame)
                }
            }
            else if (weekofyear == 4) {
                HStack(spacing: spacing) {
                    ScheduleViewHoliday(whichWeekend: getdayofweek(mode: false, input: 2, date: date), reason: "Martin Luther King Jr. Day", date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 2), array: $array).frame(width: frame)
                    ScheduleViewMonSpecial(whichDay: getdayofweek(mode: false, input: 3, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 3), array: $array).frame(width: frame)
                    ScheduleViewTueSpecial(whichDay: getdayofweek(mode: false, input: 4, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 4), array: $array).frame(width: frame)
                    ScheduleViewThuSpecial(whichDay: getdayofweek(mode: false, input: 5, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 5), array: $array).frame(width: frame)
                    ScheduleViewFriSpecial(whichDay: getdayofweek(mode: false, input: 6, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 6), array: $array).frame(width: frame)
                }
            }
            else if (weekofyear == 5) {
                HStack(spacing: spacing) {
                    ScheduleViewMon(whichDay: getdayofweek(mode: false, input: 2, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 2), array: $array).frame(width: frame)
                    ScheduleViewTue(whichDay: getdayofweek(mode: false, input: 3, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 3), array: $array).frame(width: frame)
                    ScheduleViewHoliday(whichWeekend: getdayofweek(mode: false, input: 4, date: date), reason: "CPS Day", date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 4), array: $array).frame(width: frame)
                    ScheduleViewThu(whichDay: getdayofweek(mode: false, input: 5, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 5), array: $array).frame(width: frame)
                    ScheduleViewFri(whichDay: getdayofweek(mode: false, input: 6, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 6), array: $array).frame(width: frame)
                }
            }
            else if (weekofyear == 8) {
                HStack(spacing: spacing) {
                    ScheduleViewHoliday(whichWeekend: getdayofweek(mode: false, input: 2, date: date), reason: "President's Day", date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 2), array: $array).frame(width: frame)
                    ScheduleViewMonSpecial(whichDay: getdayofweek(mode: false, input: 3, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 3), array: $array).frame(width: frame)
                    ScheduleViewTueSpecial(whichDay: getdayofweek(mode: false, input: 4, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 4), array: $array).frame(width: frame)
                    ScheduleViewThuSpecial(whichDay: getdayofweek(mode: false, input: 5, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 5), array: $array).frame(width: frame)
                    ScheduleViewFriSpecial(whichDay: getdayofweek(mode: false, input: 6, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 6), array: $array).frame(width: frame)
                }
            }
            else if (weekofyear == 10) {
                HStack(spacing: spacing) {
                    ScheduleViewHoliday(whichWeekend: getdayofweek(mode: false, input: 2, date: date), reason: "Intraterm", date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 2), array: $array).frame(width: frame)
                    ScheduleViewHoliday(whichWeekend: getdayofweek(mode: false, input: 3, date: date), reason: "Intraterm", date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 3), array: $array).frame(width: frame)
                    ScheduleViewHoliday(whichWeekend: getdayofweek(mode: false, input: 4, date: date), reason: "Intraterm", date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 4), array: $array).frame(width: frame)
                    ScheduleViewHoliday(whichWeekend: getdayofweek(mode: false, input: 5, date: date), reason: "No Classes", date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 5), array: $array).frame(width: frame)
                    ScheduleViewHoliday(whichWeekend: getdayofweek(mode: false, input: 6, date: date), reason: "No Classes", date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 6), array: $array).frame(width: frame)
                }
            }
            else if (weekofyear == 12) {
                HStack(spacing: spacing) {
                    ScheduleViewMonSpecial(whichDay: getdayofweek(mode: false, input: 2, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 2), array: $array).frame(width: frame)
                    ScheduleViewTueSpecial(whichDay: getdayofweek(mode: false, input: 3, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 3), array: $array).frame(width: frame)
                    ScheduleViewThuSpecial(whichDay: getdayofweek(mode: false, input: 4, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 4), array: $array).frame(width: frame)
                    ScheduleViewFriSpecial(whichDay: getdayofweek(mode: false, input: 5, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 5), array: $array).frame(width: frame)
                    ScheduleViewHoliday(whichWeekend: getdayofweek(mode: false, input: 6, date: date), reason: "Quarter Break", date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 6), array: $array).frame(width: frame)
                }
            }
            else if (weekofyear == 15) {
                HStack(spacing: spacing) {
                    ScheduleViewHoliday(whichWeekend: getdayofweek(mode: false, input: 2, date: date), reason: "Spring Break", date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 2), array: $array).frame(width: frame)
                    ScheduleViewHoliday(whichWeekend: getdayofweek(mode: false, input: 3, date: date), reason: "Spring Break", date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 3), array: $array).frame(width: frame)
                    ScheduleViewHoliday(whichWeekend: getdayofweek(mode: false, input: 4, date: date), reason: "Spring Break", date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 4), array: $array).frame(width: frame)
                    ScheduleViewHoliday(whichWeekend: getdayofweek(mode: false, input: 5, date: date), reason: "Spring Break", date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 5), array: $array).frame(width: frame)
                    ScheduleViewHoliday(whichWeekend: getdayofweek(mode: false, input: 6, date: date), reason: "Spring Break", date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 6), array: $array).frame(width: frame)
                }
            }
            else if (weekofyear == 22) {
                HStack(spacing: spacing) {
                    ScheduleViewMonSpecial(whichDay: getdayofweek(mode: false, input: 2, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 2), array: $array).frame(width: frame)
                    ScheduleViewTueSpecial(whichDay: getdayofweek(mode: false, input: 3, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 3), array: $array).frame(width: frame)
                    ScheduleViewThuSpecial(whichDay: getdayofweek(mode: false, input: 4, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 4), array: $array).frame(width: frame)
                    ScheduleViewFriSpecial(whichDay: getdayofweek(mode: false, input: 5, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 5), array: $array).frame(width: frame)
                    ScheduleViewHoliday(whichWeekend: getdayofweek(mode: false, input: 6, date: date), reason: "No Classes", date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 6), array: $array).frame(width: frame)
                }
            }
            else if (weekofyear < 23 && weekofyear > 2) {
                HStack(spacing: spacing) {
                    ScheduleViewMon(whichDay: getdayofweek(mode: false, input: 2, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 2), array: $array).frame(width: frame)
                    ScheduleViewTue(whichDay: getdayofweek(mode: false, input: 3, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 3), array: $array).frame(width: frame)
                    ScheduleViewWed(whichDay: getdayofweek(mode: false, input: 4, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 4), array: $array).frame(width: frame)
                    ScheduleViewThu(whichDay: getdayofweek(mode: false, input: 5, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 5), array: $array).frame(width: frame)
                    ScheduleViewFri(whichDay: getdayofweek(mode: false, input: 6, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 6), array: $array).frame(width: frame)
                }.padding([.leading,.trailing])
            }
        }
    }
}

struct ScheduleViewFull: View {
    @Binding var weekofyear: Int
    @Binding var date: Date
    let spacing = CGFloat(15)
    var frame: CGFloat
    @Environment(\.colorScheme) var colorScheme
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
            else if (weekofyear < 23 && weekofyear > 2) {
                HStack(spacing: spacing) {
                    ScheduleViewMon(whichDay: getdayofweek(mode: false, input: 2, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 2), array: $array)
                    ScheduleViewTue(whichDay: getdayofweek(mode: false, input: 3, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 3), array: $array)
                    ScheduleViewWed(whichDay: getdayofweek(mode: false, input: 4, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 4), array: $array)
                    ScheduleViewThu(whichDay: getdayofweek(mode: false, input: 5, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 5), array: $array)
                    ScheduleViewFri(whichDay: getdayofweek(mode: false, input: 6, date: date), date: getDatefromWeekofyear(weekofyear: weekofyear, weekday: 6), array: $array)
                }
            }
        }
    }
}

struct ScheduleView: View {
    @State private var switchModes = false
    @Environment(\.verticalSizeClass) var vSizeClass
    @Environment(\.horizontalSizeClass) var hSizeClass
    @State var todayflag = false
    
    @State var datepopup = false
    @State var weekofyear: Int = Calendar.current.component(.weekOfYear, from: Date())
    @State var sampledate: Date = Date()
    
    @Binding var array: [Entry]
    @ObservedObject var options = QLFetcher()
    let timer = Timer.publish(every: 5, tolerance: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            if hSizeClass == .regular && vSizeClass == .regular {
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            self.todayflag.toggle()
                        }) {
                            Image(systemName: "calendar.badge.clock")
                                .font(.title2)
                        }
                        .keyboardShortcut(KeyEquivalent("t"), modifiers: [.option])
                        DatePicker("Date", selection: $sampledate, displayedComponents: .date)
                            .datePickerStyle(CompactDatePickerStyle())
                            .labelsHidden()
                            .onChange(of: self.sampledate, perform: { value in
                                self.weekofyear = Calendar.current.component(.weekOfYear, from: sampledate)
                                let impactHeavy = UIImpactFeedbackGenerator(style: .soft)
                                impactHeavy.impactOccurred()
                            })
                    }.padding(.bottom)
                    ScheduleViewFull(weekofyear: $weekofyear, date: $sampledate, frame: CGFloat(148), array: $array)
                        .onChange(of: self.todayflag, perform: { value in
                            self.sampledate = Date()
                            self.weekofyear = Calendar.current.component(.weekOfYear, from: sampledate)
                        })
                        .onReceive(timer, perform: { _ in
                            array = getQLData(input: options)
                        })
                        .navigationBarHidden(true)
                }
                .padding()
            }
            else {
                VStack {
                    HStack {
                        Text("Schedule")
                            .bold()
                            .font(.largeTitle)
                        Spacer()
                        Menu {
                            Button(action: {
                                self.todayflag.toggle()
                            }) {
                                Text("Today")
                            }
                            Divider()
                            Button(action: {
                                self.switchModes = false
                            }) {
                                if switchModes == false {
                                    Label("Day", systemImage: "checkmark")
                                } else {
                                    Text("Day")
                                }
                            }
                            Button(action: {
                                self.switchModes = true
                            }) {
                                if switchModes == true {
                                    Label("Week", systemImage: "checkmark")
                                } else {
                                    Text("Week")
                                }
                            }
                        } label: {
                            Image(systemName: "ellipsis.circle")
                                .font(.system(size: 24))
                        }
                    }.padding([.top, .leading, .trailing])
                    Spacer()
                }
                ScheduleViewBody(switchmodes: $switchModes, todayflag: $todayflag, array: $array)
                    .gesture(MagnificationGesture()
                                .onEnded { value in
                                    self.switchModes.toggle()
                                    let impactHeavy = UIImpactFeedbackGenerator(style: .light)
                                    impactHeavy.impactOccurred()
                                }
                    )
                Spacer()
            }
        }
    }
}
