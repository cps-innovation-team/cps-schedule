//  NowModel.swift
//  Schedule.app
//
//  Created by Rahim Malik on 7/2/20.
//  Copyright © 2020 Rahim Malik. All rights reserved.

import SwiftUI

let currentHour = Calendar.current.component(.hour, from: Date())
let currentMinute = Calendar.current.component(.minute, from: Date())
let currentWeekDay = Calendar.current.component(.weekday, from: Date())
let currentDay = Calendar.current.component(.day, from: Date())
let currentMonth = Calendar.current.component(.month, from: Date())
let currentYear = Calendar.current.component(.year, from: Date())
let currentWeekofMonth = Calendar.current.component(.weekOfMonth, from: Date())
let currentWeekofYear = Calendar.current.component(.weekOfYear, from: Date())

func createDate(hour: Int, minute: Int) -> Date {
    var components = DateComponents()
    components.hour = hour
    components.minute = minute
    components.day = currentDay
    components.month = currentMonth
    components.year = currentYear
    components.timeZone = TimeZone(abbreviation: "PDT")
    let userCalendar = Calendar.current
    let someDateTime = userCalendar.date(from: components)
    return(someDateTime) ?? Date()
}

class NowClass: Identifiable, Equatable {
    static func == (lhs: NowClass, rhs: NowClass) -> Bool {
        if lhs.currentBlockName == rhs.currentBlockName && lhs.currentBlockTime == rhs.currentBlockTime {
            return true
        } else { return false }
    }
    var startBlockDate: Date
    
    var currentBlockName: String
    var currentBlockTime: String
    var currentBlockDate: Date
    var currentBlockColor: NSColor
    var currentBlockTeacher: String
    var currentBlockRoom: String
    
    var nextBlockName: String
    var nextBlockTime: String
    var nextBlockDate: Date
    var nextBlockColor: NSColor
    var nextBlockTeacher: String
    var nextBlockRoom: String
    
    init(startBlockDate: Date, currentBlockName: String, currentBlockTime: String, currentBlockDate: Date, currentBlockColor: NSColor, currentBlockTeacher: String, currentBlockRoom: String, nextBlockName: String, nextBlockTime: String, nextBlockDate: Date, nextBlockColor: NSColor, nextBlockTeacher: String, nextBlockRoom: String) {
        self.startBlockDate = startBlockDate
        
        self.currentBlockName = currentBlockName
        self.currentBlockTime = currentBlockTime
        self.currentBlockDate = currentBlockDate
        self.currentBlockColor = currentBlockColor
        self.currentBlockTeacher = currentBlockTeacher
        self.currentBlockRoom = currentBlockRoom
        
        self.nextBlockName = nextBlockName
        self.nextBlockTime = nextBlockTime
        self.nextBlockDate = nextBlockDate
        self.nextBlockColor = nextBlockColor
        self.nextBlockTeacher = nextBlockTeacher
        self.nextBlockRoom = nextBlockRoom
    }
    
}

func nowModel(weekofyear: Int, currentDate: Date) -> NowClass {
    
    //MARK: Monday
    let Preclass_M = NowClass(startBlockDate: createDate(hour: 8, minute: 30), currentBlockName: "No Class",
                              currentBlockTime: "",
                              currentBlockDate: createDate(hour: 8, minute: 30),
                              currentBlockColor: systemAbsence,
                              currentBlockTeacher: "",
                              currentBlockRoom: "",
                              
                              nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ANameKey") ?? "A-Block"),
                              nextBlockTime: "8:30 - 9:45",
                              nextBlockDate: createDate(hour: 8, minute: 30),
                              nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AColorKey") ?? systemA),
                              nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ATeacherKey") ?? ""),
                              nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ARoomKey") ?? "")
    )
    
    let ABlock_M = NowClass(startBlockDate: createDate(hour: 8, minute: 30), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ANameKey") ?? "A-Block"),
                            currentBlockTime: "8:30 - 9:45",
                            currentBlockDate: createDate(hour: 9, minute: 45),
                            currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AColorKey") ?? systemA),
                            currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ATeacherKey") ?? ""),
                            currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ARoomKey") ?? ""),
                            
                            nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "BNameKey") ?? "B-Block"),
                            nextBlockTime: "10:00 - 11:15",
                            nextBlockDate: createDate(hour: 10, minute: 00),
                            nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "BColorKey") ?? systemB),
                            nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "BTeacherKey") ?? ""),
                            nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "BRoomKey") ?? "")
    )
    
    let Passing_AB_M = NowClass(startBlockDate: createDate(hour: 9, minute: 45), currentBlockName: "Passing",
                                currentBlockTime: "9:45 - 10:00",
                                currentBlockDate: createDate(hour: 10, minute: 00),
                                currentBlockColor: systemAbsence,
                                currentBlockTeacher: "",
                                currentBlockRoom: "",
                                
                                nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "BNameKey") ?? "B-Block"),
                                nextBlockTime: "10:00 - 11:15",
                                nextBlockDate: createDate(hour: 10, minute: 00),
                                nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "BColorKey") ?? systemB),
                                nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "BTeacherKey") ?? ""),
                                nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "BRoomKey") ?? "")
    )
    
    let BBlock_M = NowClass(startBlockDate: createDate(hour: 10, minute: 00), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "BNameKey") ?? "B-Block"),
                            currentBlockTime: "10:00 - 11:15",
                            currentBlockDate: createDate(hour: 11, minute: 15),
                            currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "BColorKey") ?? systemB),
                            currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "BTeacherKey") ?? ""),
                            currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "BRoomKey") ?? ""),
                            
                            nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "AssemblyNameKey") ?? "Assembly"),
                            nextBlockTime: "11:15 - 11:45",
                            nextBlockDate: createDate(hour: 11, minute: 15),
                            nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AssemblyColorKey") ?? systemTeal),
                            nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "AssemblyTeacherKey") ?? ""),
                            nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "AssemblyRoomKey") ?? "")
    )
    
    let Assembly_M = NowClass(startBlockDate: createDate(hour: 11, minute: 15), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "AssemblyNameKey") ?? "Assembly"),
                              currentBlockTime: "11:15 - 11:45",
                              currentBlockDate: createDate(hour: 11, minute: 45),
                              currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AssemblyColorKey") ?? systemTeal),
                              currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "AssemblyTeacherKey") ?? ""),
                              currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "AssemblyRoomKey") ?? ""),
                              
                              nextBlockName: ("Lunch"),
                              nextBlockTime: "11:45 - 12:15",
                              nextBlockDate: createDate(hour: 11, minute: 45),
                              nextBlockColor: (systemAbsence),
                              nextBlockTeacher: (""),
                              nextBlockRoom: ("")
    )
    
    let Lunch_M = NowClass(startBlockDate: createDate(hour: 11, minute: 45), currentBlockName: "Lunch",
                           currentBlockTime: "11:45 - 12:15",
                           currentBlockDate: createDate(hour: 12, minute: 15),
                           currentBlockColor: systemAbsence,
                           currentBlockTeacher: "",
                           currentBlockRoom: "",
                           
                           nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ENameKey") ?? "E-Block"),
                           nextBlockTime: "12:15 - 1:30",
                           nextBlockDate: createDate(hour: 12, minute: 15),
                           nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "EColorKey") ?? systemE),
                           nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ETeacherKey") ?? ""),
                           nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ERoomKey") ?? "")
    )
    
    let EBlock_M = NowClass(startBlockDate: createDate(hour: 12, minute: 15), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ENameKey") ?? "E-Block"),
                            currentBlockTime: "12:15 - 1:30",
                            currentBlockDate: createDate(hour: 13, minute: 30),
                            currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "EColorKey") ?? systemE),
                            currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ETeacherKey") ?? ""),
                            currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ERoomKey") ?? ""),
                            
                            nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "FNameKey") ?? "F-Block"),
                            nextBlockTime: "1:45 - 3:00",
                            nextBlockDate: createDate(hour: 13, minute: 45),
                            nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "FColorKey") ?? systemF),
                            nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "FTeacherKey") ?? ""),
                            nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "FRoomKey") ?? "")
    )
    
    let Passing_EF_M = NowClass(startBlockDate: createDate(hour: 13, minute: 30), currentBlockName: "Passing",
                                currentBlockTime: "1:30 - 1:45",
                                currentBlockDate: createDate(hour: 13, minute: 45),
                                currentBlockColor: systemAbsence,
                                currentBlockTeacher: "",
                                currentBlockRoom: "",
                                
                                nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "FNameKey") ?? "F-Block"),
                                nextBlockTime: "1:45 - 3:00",
                                nextBlockDate: createDate(hour: 13, minute: 45),
                                nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "FColorKey") ?? systemF),
                                nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "FTeacherKey") ?? ""),
                                nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "FRoomKey") ?? "")
    )
    
    let FBlock_M = NowClass(startBlockDate: createDate(hour: 13, minute: 45), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "FNameKey") ?? "F-Block"),
                            currentBlockTime: "1:45 - 3:00",
                            currentBlockDate: createDate(hour: 15, minute: 00),
                            currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "FColorKey") ?? systemF),
                            currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "FTeacherKey") ?? ""),
                            currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "FRoomKey") ?? ""),
                            
                            nextBlockName: ("Meeting/Open"),
                            nextBlockTime: "3:00 - 3:30",
                            nextBlockDate: createDate(hour: 15, minute: 00),
                            nextBlockColor: (systemAbsence),
                            nextBlockTeacher: (""),
                            nextBlockRoom: ("")
    )
    
    //MARK: Tuesday
    let Preclass_T = NowClass(startBlockDate: createDate(hour: 8, minute: 30), currentBlockName: "No Class",
                              currentBlockTime: "",
                              currentBlockDate: createDate(hour: 8, minute: 30),
                              currentBlockColor: systemAbsence,
                              currentBlockTeacher: "",
                              currentBlockRoom: "",
                              
                              nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CNameKey") ?? "C-Block"),
                              nextBlockTime: "8:30 - 9:45",
                              nextBlockDate: createDate(hour: 8, minute: 30),
                              nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CColorKey") ?? systemC),
                              nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CTeacherKey") ?? ""),
                              nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CRoomKey") ?? "")
    )
    
    let CBlock_T = NowClass(startBlockDate: createDate(hour: 8, minute: 30), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CNameKey") ?? "C-Block"),
                            currentBlockTime: "8:30 - 9:45",
                            currentBlockDate: createDate(hour: 9, minute: 45),
                            currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CColorKey") ?? systemC),
                            currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CTeacherKey") ?? ""),
                            currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CRoomKey") ?? ""),
                            
                            nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "DNameKey") ?? "D-Block"),
                            nextBlockTime: "10:00 - 11:15",
                            nextBlockDate: createDate(hour: 10, minute: 00),
                            nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "DColorKey") ?? systemD),
                            nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "DTeacherKey") ?? ""),
                            nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "DRoomKey") ?? "")
    )
    
    let Passing_CD_T = NowClass(startBlockDate: createDate(hour: 9, minute: 45), currentBlockName: "Passing",
                                currentBlockTime: "9:45 - 10:00",
                                currentBlockDate: createDate(hour: 10, minute: 00),
                                currentBlockColor: systemAbsence,
                                currentBlockTeacher: "",
                                currentBlockRoom: "",
                                
                                nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "DNameKey") ?? "D-Block"),
                                nextBlockTime: "10:00 - 11:15",
                                nextBlockDate: createDate(hour: 10, minute: 00),
                                nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "DColorKey") ?? systemD),
                                nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "DTeacherKey") ?? ""),
                                nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "DRoomKey") ?? "")
    )
    
    let DBlock_T = NowClass(startBlockDate: createDate(hour: 10, minute: 00), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "DNameKey") ?? "D-Block"),
                            currentBlockTime: "10:00 - 11:15",
                            currentBlockDate: createDate(hour: 11, minute: 15),
                            currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "DColorKey") ?? systemD),
                            currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "DTeacherKey") ?? ""),
                            currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "DRoomKey") ?? ""),
                            
                            nextBlockName: ("Meeting/Open"),
                            nextBlockTime: "11:15 - 11:45",
                            nextBlockDate: createDate(hour: 11, minute: 15),
                            nextBlockColor: (systemAbsence),
                            nextBlockTeacher: (""),
                            nextBlockRoom: ("")
    )
    
    let Lunch_T = NowClass(startBlockDate: createDate(hour: 11, minute: 45), currentBlockName: "Lunch",
                           currentBlockTime: "11:45 - 12:15",
                           currentBlockDate: createDate(hour: 12, minute: 15),
                           currentBlockColor: systemAbsence,
                           currentBlockTeacher: "",
                           currentBlockRoom: "",
                           
                           nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "GNameKey") ?? "G-Block"),
                           nextBlockTime: "12:15 - 1:30",
                           nextBlockDate: createDate(hour: 12, minute: 15),
                           nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "GColorKey") ?? systemG),
                           nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "GTeacherKey") ?? ""),
                           nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "GRoomKey") ?? "")
    )
    
    let GBlock_T = NowClass(startBlockDate: createDate(hour: 12, minute: 15), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "GNameKey") ?? "G-Block"),
                            currentBlockTime: "12:15 - 1:30",
                            currentBlockDate: createDate(hour: 13, minute: 30),
                            currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "GColorKey") ?? systemG),
                            currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "GTeacherKey") ?? ""),
                            currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "GRoomKey") ?? ""),
                            
                            nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "HNameKey") ?? "H-Block"),
                            nextBlockTime: "1:45 - 3:00",
                            nextBlockDate: createDate(hour: 13, minute: 45),
                            nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "HColorKey") ?? systemH),
                            nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "HTeacherKey") ?? ""),
                            nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "HRoomKey") ?? "")
    )
    
    let Passing_GH_T = NowClass(startBlockDate: createDate(hour: 13, minute: 30), currentBlockName: "Passing",
                                currentBlockTime: "1:30 - 1:45",
                                currentBlockDate: createDate(hour: 13, minute: 45),
                                currentBlockColor: systemAbsence,
                                currentBlockTeacher: "",
                                currentBlockRoom: "",
                                
                                nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "HNameKey") ?? "H-Block"),
                                nextBlockTime: "1:45 - 3:00",
                                nextBlockDate: createDate(hour: 13, minute: 45),
                                nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "HColorKey") ?? systemH),
                                nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "HTeacherKey") ?? ""),
                                nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "HRoomKey") ?? "")
    )
    
    let HBlock_T = NowClass(startBlockDate: createDate(hour: 13, minute: 45), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "HNameKey") ?? "H-Block"),
                            currentBlockTime: "1:45 - 3:00",
                            currentBlockDate: createDate(hour: 15, minute: 00),
                            currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "HColorKey") ?? systemH),
                            currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "HTeacherKey") ?? ""),
                            currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "HRoomKey") ?? ""),
                            
                            nextBlockName: ("Meeting/Open"),
                            nextBlockTime: "3:00 - 3:30",
                            nextBlockDate: createDate(hour: 15, minute: 00),
                            nextBlockColor: (systemAbsence),
                            nextBlockTeacher: (""),
                            nextBlockRoom: ("")
    )
    
    //MARK: Wednesday
    let Preclass_W = NowClass(startBlockDate: createDate(hour: 8, minute: 30), currentBlockName: "No Class",
                              currentBlockTime: "",
                              currentBlockDate: createDate(hour: 8, minute: 30),
                              currentBlockColor: systemAbsence,
                              currentBlockTeacher: "",
                              currentBlockRoom: "",
                              
                              nextBlockName: ("Meeting/Assessment"),
                              nextBlockTime: "8:30 - 9:30",
                              nextBlockDate: createDate(hour: 8, minute: 30),
                              nextBlockColor: (systemAbsence),
                              nextBlockTeacher: (""),
                              nextBlockRoom: ("")
    )
    
    let Assessment1_W = NowClass(startBlockDate: createDate(hour: 8, minute: 30), currentBlockName: ("Meeting/Assessment"),
                                 currentBlockTime: "8:30 - 9:30",
                                 currentBlockDate: createDate(hour: 9, minute: 30),
                                 currentBlockColor: (systemAbsence),
                                 currentBlockTeacher: (""),
                                 currentBlockRoom: (""),
                                 
                                 nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "AdvisingNameKey") ?? "Advising"),
                                 nextBlockTime: "9:35 - 10:25",
                                 nextBlockDate: createDate(hour: 9, minute: 35),
                                 nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AdvisingColorKey") ?? systemTeal),
                                 nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "AdvisingTeacherKey") ?? ""),
                                 nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "AdvisingRoomKey") ?? "")
    )
    
    let Passing_Assessment1Advising_W = NowClass(startBlockDate: createDate(hour: 9, minute: 30), currentBlockName: "Passing",
                                                 currentBlockTime: "9:30 - 9:35",
                                                 currentBlockDate: createDate(hour: 9, minute: 35),
                                                 currentBlockColor: systemAbsence,
                                                 currentBlockTeacher: "",
                                                 currentBlockRoom: "",
                                                 
                                                 nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "AdvisingNameKey") ?? "Advising"),
                                                 nextBlockTime: "9:35 - 10:25",
                                                 nextBlockDate: createDate(hour: 9, minute: 35),
                                                 nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AdvisingColorKey") ?? systemTeal),
                                                 nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "AdvisingTeacherKey") ?? ""),
                                                 nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "AdvisingRoomKey") ?? "")
    )
    
    let Advising_W = NowClass(startBlockDate: createDate(hour: 9, minute: 35), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "AdvisingNameKey") ?? "Advising"),
                              currentBlockTime: "9:35 - 10:25",
                              currentBlockDate: createDate(hour: 10, minute: 25),
                              currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AdvisingColorKey") ?? systemTeal),
                              currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "AdvisingTeacherKey") ?? ""),
                              currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "AdvisingRoomKey") ?? ""),
                              
                              nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CommonNameKey") ?? "Common Classroom"),
                              nextBlockTime: "10:30 - 11:20",
                              nextBlockDate: createDate(hour: 10, minute: 30),
                              nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CommonColorKey") ?? systemTeal),
                              nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CommonTeacherKey") ?? ""),
                              nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CommonRoomKey") ?? "")
    )
    
    let Passing_AdvisingCommon_W = NowClass(startBlockDate: createDate(hour: 10, minute: 25), currentBlockName: "Passing",
                                            currentBlockTime: "10:25 - 10:30",
                                            currentBlockDate: createDate(hour: 10, minute: 30),
                                            currentBlockColor: systemAbsence,
                                            currentBlockTeacher: "",
                                            currentBlockRoom: "",
                                            
                                            nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CommonNameKey") ?? "Common Classroom"),
                                            nextBlockTime: "10:30 - 11:20",
                                            nextBlockDate: createDate(hour: 10, minute: 30),
                                            nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CommonColorKey") ?? systemTeal),
                                            nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CommonTeacherKey") ?? ""),
                                            nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CommonRoomKey") ?? "")
    )
    
    let Common_W = NowClass(startBlockDate: createDate(hour: 10, minute: 30), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CommonNameKey") ?? "Common Classroom"),
                            currentBlockTime: "10:30 - 11:20",
                            currentBlockDate: createDate(hour: 11, minute: 20),
                            currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CommonColorKey") ?? systemTeal),
                            currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CommonTeacherKey") ?? ""),
                            currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CommonRoomKey") ?? ""),
                            
                            nextBlockName: ("Lunch"),
                            nextBlockTime: "11:20 - 12:15",
                            nextBlockDate: createDate(hour: 11, minute: 20),
                            nextBlockColor: (systemAbsence),
                            nextBlockTeacher: (""),
                            nextBlockRoom: ("")
    )
    
    let Lunch_W = NowClass(startBlockDate: createDate(hour: 11, minute: 20), currentBlockName: "Lunch",
                           currentBlockTime: "11:20 - 12:15",
                           currentBlockDate: createDate(hour: 12, minute: 15),
                           currentBlockColor: systemAbsence,
                           currentBlockTeacher: "",
                           currentBlockRoom: "",
                           
                           nextBlockName: ("Meeting/Assessment"),
                           nextBlockTime: "12:15 - 1:15",
                           nextBlockDate: createDate(hour: 12, minute: 15),
                           nextBlockColor: (systemAbsence),
                           nextBlockTeacher: (""),
                           nextBlockRoom: ("")
    )
    
    let Assessment2_W = NowClass(startBlockDate: createDate(hour: 12, minute: 15), currentBlockName: ("Meeting/Assessment"),
                                 currentBlockTime: "12:15 - 1:15",
                                 currentBlockDate: createDate(hour: 13, minute: 15),
                                 currentBlockColor: (systemAbsence),
                                 currentBlockTeacher: (""),
                                 currentBlockRoom: (""),
                                 
                                 nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CompassNameKey") ?? "Compass"),
                                 nextBlockTime: "1:20 - 2:10",
                                 nextBlockDate: createDate(hour: 13, minute: 20),
                                 nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CompassColorKey") ?? systemTeal),
                                 nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CompassTeacherKey") ?? ""),
                                 nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CompassRoomKey") ?? "")
    )
    
    let Passing_Assessment2Compass_W = NowClass(startBlockDate: createDate(hour: 13, minute: 15), currentBlockName: "Passing",
                                                currentBlockTime: "1:15 - 1:20",
                                                currentBlockDate: createDate(hour: 13, minute: 20),
                                                currentBlockColor: systemAbsence,
                                                currentBlockTeacher: "",
                                                currentBlockRoom: "",
                                                
                                                nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CompassNameKey") ?? "Compass"),
                                                nextBlockTime: "1:20 - 2:10",
                                                nextBlockDate: createDate(hour: 13, minute: 20),
                                                nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CompassColorKey") ?? systemTeal),
                                                nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CompassTeacherKey") ?? ""),
                                                nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CompassRoomKey") ?? "")
    )
    
    let Compass_W = NowClass(startBlockDate: createDate(hour: 13, minute: 20), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CompassNameKey") ?? "Compass"),
                             currentBlockTime: "1:20 - 2:10",
                             currentBlockDate: createDate(hour: 14, minute: 10),
                             currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CompassColorKey") ?? systemTeal),
                             currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CompassTeacherKey") ?? ""),
                             currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CompassRoomKey") ?? ""),
                             
                             nextBlockName: ("Faculty Collaboration"),
                             nextBlockTime: "2:15 - 3:30",
                             nextBlockDate: createDate(hour: 14, minute: 15),
                             nextBlockColor: (systemAbsence),
                             nextBlockTeacher: (""),
                             nextBlockRoom: ("")
    )
    
    let Passing_CompassFacCollab_W = NowClass(startBlockDate: createDate(hour: 14, minute: 10), currentBlockName: "Passing",
                                              currentBlockTime: "2:10 - 2:15",
                                              currentBlockDate: createDate(hour: 14, minute: 15),
                                              currentBlockColor: systemAbsence,
                                              currentBlockTeacher: "",
                                              currentBlockRoom: "",
                                              
                                              nextBlockName: ("Faculty Collaboration"),
                                              nextBlockTime: "2:15 - 3:30",
                                              nextBlockDate: createDate(hour: 14, minute: 15),
                                              nextBlockColor: (systemAbsence),
                                              nextBlockTeacher: (""),
                                              nextBlockRoom: ("")
    )
    
    let FacCollab_W = NowClass(startBlockDate: createDate(hour: 14, minute: 15), currentBlockName: ("Faculty Collaboration"),
                               currentBlockTime: "2:15 - 3:30",
                               currentBlockDate: createDate(hour: 15, minute: 30),
                               currentBlockColor: (systemAbsence),
                               currentBlockTeacher: (""),
                               currentBlockRoom: (""),
                               
                               nextBlockName: ("No Class"),
                               nextBlockTime: "",
                               nextBlockDate: createDate(hour: 15, minute: 30),
                               nextBlockColor: (systemAbsence),
                               nextBlockTeacher: (""),
                               nextBlockRoom: ("")
    )
    
    //MARK: Thursday
    let Preclass_R = NowClass(startBlockDate: createDate(hour: 8, minute: 30), currentBlockName: "No Class",
                              currentBlockTime: "",
                              currentBlockDate: createDate(hour: 8, minute: 30),
                              currentBlockColor: systemAbsence,
                              currentBlockTeacher: "",
                              currentBlockRoom: "",
                              
                              nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "BNameKey") ?? "B-Block"),
                              nextBlockTime: "8:30 - 9:45",
                              nextBlockDate: createDate(hour: 8, minute: 30),
                              nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "BColorKey") ?? systemB),
                              nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "BTeacherKey") ?? ""),
                              nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "BRoomKey") ?? "")
    )
    
    let BBlock_R = NowClass(startBlockDate: createDate(hour: 8, minute: 30), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "BNameKey") ?? "B-Block"),
                            currentBlockTime: "8:30 - 9:45",
                            currentBlockDate: createDate(hour: 9, minute: 45),
                            currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "BColorKey") ?? systemB),
                            currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "BTeacherKey") ?? ""),
                            currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "BRoomKey") ?? ""),
                            
                            nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ANameKey") ?? "A-Block"),
                            nextBlockTime: "10:00 - 11:15",
                            nextBlockDate: createDate(hour: 10, minute: 00),
                            nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AColorKey") ?? systemA),
                            nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ATeacherKey") ?? ""),
                            nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ARoomKey") ?? "")
    )
    
    let Passing_BA_R = NowClass(startBlockDate: createDate(hour: 9, minute: 45), currentBlockName: "Passing",
                                currentBlockTime: "9:45 - 10:00",
                                currentBlockDate: createDate(hour: 10, minute: 00),
                                currentBlockColor: systemAbsence,
                                currentBlockTeacher: "",
                                currentBlockRoom: "",
                                
                                nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ANameKey") ?? "A-Block"),
                                nextBlockTime: "10:00 - 11:15",
                                nextBlockDate: createDate(hour: 10, minute: 00),
                                nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AColorKey") ?? systemA),
                                nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ATeacherKey") ?? ""),
                                nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ARoomKey") ?? "")
    )
    
    let ABlock_R = NowClass(startBlockDate: createDate(hour: 10, minute: 00), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ANameKey") ?? "A-Block"),
                            currentBlockTime: "10:00 - 11:15",
                            currentBlockDate: createDate(hour: 11, minute: 15),
                            currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AColorKey") ?? systemA),
                            currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ATeacherKey") ?? ""),
                            currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ARoomKey") ?? ""),
                            
                            nextBlockName: ("Meeting/Open"),
                            nextBlockTime: "11:15 - 11:45",
                            nextBlockDate: createDate(hour: 11, minute: 15),
                            nextBlockColor: (systemAbsence),
                            nextBlockTeacher: (""),
                            nextBlockRoom: ("")
    )
    
    let Lunch_R = NowClass(startBlockDate: createDate(hour: 11, minute: 45), currentBlockName: "Lunch",
                           currentBlockTime: "11:45 - 12:15",
                           currentBlockDate: createDate(hour: 12, minute: 15),
                           currentBlockColor: systemAbsence,
                           currentBlockTeacher: "",
                           currentBlockRoom: "",
                           
                           nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "FNameKey") ?? "F-Block"),
                           nextBlockTime: "12:15 - 1:30",
                           nextBlockDate: createDate(hour: 12, minute: 15),
                           nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "FColorKey") ?? systemF),
                           nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "FTeacherKey") ?? ""),
                           nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "FRoomKey") ?? "")
    )
    
    let FBlock_R = NowClass(startBlockDate: createDate(hour: 12, minute: 15), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "FNameKey") ?? "F-Block"),
                            currentBlockTime: "12:15 - 1:30",
                            currentBlockDate: createDate(hour: 13, minute: 30),
                            currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "FColorKey") ?? systemF),
                            currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "FTeacherKey") ?? ""),
                            currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "FRoomKey") ?? ""),
                            
                            nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ENameKey") ?? "E-Block"),
                            nextBlockTime: "1:45 - 3:00",
                            nextBlockDate: createDate(hour: 13, minute: 45),
                            nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "EColorKey") ?? systemE),
                            nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ETeacherKey") ?? ""),
                            nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ERoomKey") ?? "")
    )
    
    let Passing_FE_R = NowClass(startBlockDate: createDate(hour: 13, minute: 30), currentBlockName: "Passing",
                                currentBlockTime: "1:30 - 1:45",
                                currentBlockDate: createDate(hour: 13, minute: 45),
                                currentBlockColor: systemAbsence,
                                currentBlockTeacher: "",
                                currentBlockRoom: "",
                                
                                nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ENameKey") ?? "E-Block"),
                                nextBlockTime: "1:45 - 3:00",
                                nextBlockDate: createDate(hour: 13, minute: 45),
                                nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "EColorKey") ?? systemE),
                                nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ETeacherKey") ?? ""),
                                nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ERoomKey") ?? "")
    )
    
    let EBlock_R = NowClass(startBlockDate: createDate(hour: 13, minute: 45), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ENameKey") ?? "E-Block"),
                            currentBlockTime: "1:45 - 3:00",
                            currentBlockDate: createDate(hour: 15, minute: 00),
                            currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "EColorKey") ?? systemE),
                            currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ETeacherKey") ?? ""),
                            currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ERoomKey") ?? ""),
                            
                            nextBlockName: ("Meeting/Open"),
                            nextBlockTime: "3:00 - 3:30",
                            nextBlockDate: createDate(hour: 15, minute: 00),
                            nextBlockColor: (systemAbsence),
                            nextBlockTeacher: (""),
                            nextBlockRoom: ("")
    )
    
    //MARK: Friday
    let Preclass_F = NowClass(startBlockDate: createDate(hour: 8, minute: 30), currentBlockName: "No Class",
                              currentBlockTime: "",
                              currentBlockDate: createDate(hour: 8, minute: 30),
                              currentBlockColor: systemAbsence,
                              currentBlockTeacher: "",
                              currentBlockRoom: "",
                              
                              nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "DNameKey") ?? "D-Block"),
                              nextBlockTime: "8:30 - 9:45",
                              nextBlockDate: createDate(hour: 8, minute: 30),
                              nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "DColorKey") ?? systemD),
                              nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "DTeacherKey") ?? ""),
                              nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "DRoomKey") ?? "")
    )
    
    let DBlock_F = NowClass(startBlockDate: createDate(hour: 8, minute: 30), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "DNameKey") ?? "D-Block"),
                            currentBlockTime: "8:30 - 9:45",
                            currentBlockDate: createDate(hour: 9, minute: 45),
                            currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "DColorKey") ?? systemD),
                            currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "DTeacherKey") ?? ""),
                            currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "DRoomKey") ?? ""),
                            
                            nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CNameKey") ?? "C-Block"),
                            nextBlockTime: "10:00 - 11:15",
                            nextBlockDate: createDate(hour: 10, minute: 00),
                            nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CColorKey") ?? systemC),
                            nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CTeacherKey") ?? ""),
                            nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CRoomKey") ?? "")
    )
    
    let Passing_DC_F = NowClass(startBlockDate: createDate(hour: 9, minute: 45), currentBlockName: "Passing",
                                currentBlockTime: "9:45 - 10:00",
                                currentBlockDate: createDate(hour: 10, minute: 00),
                                currentBlockColor: systemAbsence,
                                currentBlockTeacher: "",
                                currentBlockRoom: "",
                                
                                nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CNameKey") ?? "C-Block"),
                                nextBlockTime: "10:00 - 11:15",
                                nextBlockDate: createDate(hour: 10, minute: 00),
                                nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CColorKey") ?? systemC),
                                nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CTeacherKey") ?? ""),
                                nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CRoomKey") ?? "")
    )
    
    let CBlock_F = NowClass(startBlockDate: createDate(hour: 10, minute: 00), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CNameKey") ?? "C-Block"),
                            currentBlockTime: "10:00 - 11:15",
                            currentBlockDate: createDate(hour: 11, minute: 15),
                            currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CColorKey") ?? systemC),
                            currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CTeacherKey") ?? ""),
                            currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CRoomKey") ?? ""),
                            
                            nextBlockName: ("Meeting/Open"),
                            nextBlockTime: "11:15 - 11:45",
                            nextBlockDate: createDate(hour: 11, minute: 15),
                            nextBlockColor: (systemAbsence),
                            nextBlockTeacher: (""),
                            nextBlockRoom: ("")
    )
    
    let Lunch_F = NowClass(startBlockDate: createDate(hour: 11, minute: 45), currentBlockName: "Lunch",
                           currentBlockTime: "11:45 - 12:15",
                           currentBlockDate: createDate(hour: 12, minute: 15),
                           currentBlockColor: systemAbsence,
                           currentBlockTeacher: "",
                           currentBlockRoom: "",
                           
                           nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "HNameKey") ?? "H-Block"),
                           nextBlockTime: "12:15 - 1:30",
                           nextBlockDate: createDate(hour: 12, minute: 15),
                           nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "HColorKey") ?? systemH),
                           nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "HTeacherKey") ?? ""),
                           nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "HRoomKey") ?? "")
    )
    
    let HBlock_F = NowClass(startBlockDate: createDate(hour: 12, minute: 15), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "HNameKey") ?? "H-Block"),
                            currentBlockTime: "12:15 - 1:30",
                            currentBlockDate: createDate(hour: 13, minute: 30),
                            currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "HColorKey") ?? systemH),
                            currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "HTeacherKey") ?? ""),
                            currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "HRoomKey") ?? ""),
                            
                            nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "GNameKey") ?? "G-Block"),
                            nextBlockTime: "1:45 - 3:00",
                            nextBlockDate: createDate(hour: 13, minute: 45),
                            nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "GColorKey") ?? systemG),
                            nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "GTeacherKey") ?? ""),
                            nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "GRoomKey") ?? "")
    )
    
    let Passing_HG_F = NowClass(startBlockDate: createDate(hour: 13, minute: 30), currentBlockName: "Passing",
                                currentBlockTime: "1:30 - 1:45",
                                currentBlockDate: createDate(hour: 13, minute: 45),
                                currentBlockColor: systemAbsence,
                                currentBlockTeacher: "",
                                currentBlockRoom: "",
                                
                                nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "GNameKey") ?? "G-Block"),
                                nextBlockTime: "1:45 - 3:00",
                                nextBlockDate: createDate(hour: 13, minute: 45),
                                nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "GColorKey") ?? systemG),
                                nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "GTeacherKey") ?? ""),
                                nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "GRoomKey") ?? "")
    )
    
    let GBlock_F = NowClass(startBlockDate: createDate(hour: 13, minute: 45), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "GNameKey") ?? "G-Block"),
                            currentBlockTime: "1:45 - 3:00",
                            currentBlockDate: createDate(hour: 15, minute: 00),
                            currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "GColorKey") ?? systemG),
                            currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "GTeacherKey") ?? ""),
                            currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "GRoomKey") ?? ""),
                            
                            nextBlockName: ("Meeting/Open"),
                            nextBlockTime: "3:00 - 3:30",
                            nextBlockDate: createDate(hour: 15, minute: 00),
                            nextBlockColor: (systemAbsence),
                            nextBlockTeacher: (""),
                            nextBlockRoom: ("")
    )
    
    //MARK: Not Day Specific
    let Open = NowClass(startBlockDate: createDate(hour: 15, minute: 00), currentBlockName: ("Meeting/Open"),
                        currentBlockTime: "3:00 - 3:30",
                        currentBlockDate: createDate(hour: 15, minute: 30),
                        currentBlockColor: (systemAbsence),
                        currentBlockTeacher: (""),
                        currentBlockRoom: (""),
                        
                        nextBlockName: ("No Class"),
                        nextBlockTime: "",
                        nextBlockDate: createDate(hour: 15, minute: 30),
                        nextBlockColor: (systemAbsence),
                        nextBlockTeacher: (""),
                        nextBlockRoom: ("")
    )
    
    let Mtg = NowClass(startBlockDate: createDate(hour: 11, minute: 15), currentBlockName: "Meeting/Open",
                       currentBlockTime: "11:15 - 11:45",
                       currentBlockDate: createDate(hour: 11, minute: 45),
                       currentBlockColor: (systemAbsence),
                       currentBlockTeacher: (""),
                       currentBlockRoom: (""),
                       
                       nextBlockName: ("Lunch"),
                       nextBlockTime: "11:45 - 12:15",
                       nextBlockDate: createDate(hour: 11, minute: 45),
                       nextBlockColor: (systemAbsence),
                       nextBlockTeacher: (""),
                       nextBlockRoom: ("")
    )
    
    //MARK: Monday Special
    let Preclass_MS = NowClass(startBlockDate: createDate(hour: 8, minute: 30), currentBlockName: "No Class",
                               currentBlockTime: "",
                               currentBlockDate: createDate(hour: 8, minute: 30),
                               currentBlockColor: systemAbsence,
                               currentBlockTeacher: "",
                               currentBlockRoom: "",
                               
                               nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ANameKey") ?? "A-Block"),
                               nextBlockTime: "8:30 - 9:40",
                               nextBlockDate: createDate(hour: 8, minute: 30),
                               nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AColorKey") ?? systemA),
                               nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ATeacherKey") ?? ""),
                               nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ARoomKey") ?? "")
    )
    
    let ABlock_MS = NowClass(startBlockDate: createDate(hour: 8, minute: 30), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ANameKey") ?? "A-Block"),
                             currentBlockTime: "8:30 - 9:40",
                             currentBlockDate: createDate(hour: 9, minute: 40),
                             currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AColorKey") ?? systemA),
                             currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ATeacherKey") ?? ""),
                             currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ARoomKey") ?? ""),
                             
                             nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "BNameKey") ?? "B-Block"),
                             nextBlockTime: "9:55 - 11:05",
                             nextBlockDate: createDate(hour: 9, minute: 55),
                             nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "BColorKey") ?? systemB),
                             nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "BTeacherKey") ?? ""),
                             nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "BRoomKey") ?? "")
    )
    
    let Passing_AB_MS = NowClass(startBlockDate: createDate(hour: 9, minute: 40), currentBlockName: "Passing",
                                 currentBlockTime: "9:40 - 9:55",
                                 currentBlockDate: createDate(hour: 9, minute: 55),
                                 currentBlockColor: systemAbsence,
                                 currentBlockTeacher: "",
                                 currentBlockRoom: "",
                                 
                                 nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "BNameKey") ?? "B-Block"),
                                 nextBlockTime: "9:55 - 11:05",
                                 nextBlockDate: createDate(hour: 9, minute: 55),
                                 nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "BColorKey") ?? systemB),
                                 nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "BTeacherKey") ?? ""),
                                 nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "BRoomKey") ?? "")
    )
    
    let BBlock_MS = NowClass(startBlockDate: createDate(hour: 9, minute: 55), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "BNameKey") ?? "B-Block"),
                             currentBlockTime: "9:55 - 11:05",
                             currentBlockDate: createDate(hour: 11, minute: 05),
                             currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "BColorKey") ?? systemB),
                             currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "BTeacherKey") ?? ""),
                             currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "BRoomKey") ?? ""),
                             
                             nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "AssemblyNameKey") ?? "Assembly"),
                             nextBlockTime: "11:05 - 11:35",
                             nextBlockDate: createDate(hour: 11, minute: 05),
                             nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AssemblyColorKey") ?? systemTeal),
                             nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "AssemblyTeacherKey") ?? ""),
                             nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "AssemblyRoomKey") ?? "")
    )
    
    let Assembly_MS = NowClass(startBlockDate: createDate(hour: 11, minute: 05), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "AssemblyNameKey") ?? "Assembly"),
                               currentBlockTime: "11:05 - 11:35",
                               currentBlockDate: createDate(hour: 11, minute: 35),
                               currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AssemblyColorKey") ?? systemTeal),
                               currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "AssemblyTeacherKey") ?? ""),
                               currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "AssemblyRoomKey") ?? ""),
                               
                               nextBlockName: ("Lunch"),
                               nextBlockTime: "11:35 - 12:25",
                               nextBlockDate: createDate(hour: 11, minute: 35),
                               nextBlockColor: (systemAbsence),
                               nextBlockTeacher: (""),
                               nextBlockRoom: ("")
    )
    
    let Lunch_MS = NowClass(startBlockDate: createDate(hour: 11, minute: 35), currentBlockName: "Lunch",
                            currentBlockTime: "11:35 - 12:25",
                            currentBlockDate: createDate(hour: 12, minute: 25),
                            currentBlockColor: systemAbsence,
                            currentBlockTeacher: "",
                            currentBlockRoom: "",
                            
                            nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ENameKey") ?? "E-Block"),
                            nextBlockTime: "12:25 - 1:35",
                            nextBlockDate: createDate(hour: 12, minute: 25),
                            nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "EColorKey") ?? systemE),
                            nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ETeacherKey") ?? ""),
                            nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ERoomKey") ?? "")
    )
    
    let EBlock_MS = NowClass(startBlockDate: createDate(hour: 12, minute: 25), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ENameKey") ?? "E-Block"),
                             currentBlockTime: "12:25 - 1:35",
                             currentBlockDate: createDate(hour: 13, minute: 35),
                             currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "EColorKey") ?? systemE),
                             currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ETeacherKey") ?? ""),
                             currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ERoomKey") ?? ""),
                             
                             nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "FNameKey") ?? "F-Block"),
                             nextBlockTime: "1:50 - 3:00",
                             nextBlockDate: createDate(hour: 13, minute: 50),
                             nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "FColorKey") ?? systemF),
                             nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "FTeacherKey") ?? ""),
                             nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "FRoomKey") ?? "")
    )
    
    let Passing_EF_MS = NowClass(startBlockDate: createDate(hour: 13, minute: 35), currentBlockName: "Passing",
                                 currentBlockTime: "1:35 - 1:50",
                                 currentBlockDate: createDate(hour: 13, minute: 50),
                                 currentBlockColor: systemAbsence,
                                 currentBlockTeacher: "",
                                 currentBlockRoom: "",
                                 
                                 nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "FNameKey") ?? "F-Block"),
                                 nextBlockTime: "1:50 - 3:00",
                                 nextBlockDate: createDate(hour: 13, minute: 50),
                                 nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "FColorKey") ?? systemF),
                                 nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "FTeacherKey") ?? ""),
                                 nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "FRoomKey") ?? "")
    )
    
    let FBlock_MS = NowClass(startBlockDate: createDate(hour: 13, minute: 50), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "FNameKey") ?? "F-Block"),
                             currentBlockTime: "1:50 - 3:00",
                             currentBlockDate: createDate(hour: 15, minute: 00),
                             currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "FColorKey") ?? systemF),
                             currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "FTeacherKey") ?? ""),
                             currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "FRoomKey") ?? ""),
                             
                             nextBlockName: ("Meeting/Open"),
                             nextBlockTime: "3:00 - 3:30",
                             nextBlockDate: createDate(hour: 15, minute: 00),
                             nextBlockColor: (systemAbsence),
                             nextBlockTeacher: (""),
                             nextBlockRoom: ("")
    )
    
    //MARK: Tuesday Special
    let Preclass_TS = NowClass(startBlockDate: createDate(hour: 8, minute: 30), currentBlockName: "No Class",
                               currentBlockTime: "",
                               currentBlockDate: createDate(hour: 8, minute: 30),
                               currentBlockColor: systemAbsence,
                               currentBlockTeacher: "",
                               currentBlockRoom: "",
                               
                               nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CNameKey") ?? "C-Block"),
                               nextBlockTime: "8:30 - 9:40",
                               nextBlockDate: createDate(hour: 8, minute: 30),
                               nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CColorKey") ?? systemC),
                               nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CTeacherKey") ?? ""),
                               nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CRoomKey") ?? "")
    )
    
    let CBlock_TS = NowClass(startBlockDate: createDate(hour: 8, minute: 30), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CNameKey") ?? "C-Block"),
                             currentBlockTime: "8:30 - 9:40",
                             currentBlockDate: createDate(hour: 9, minute: 40),
                             currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CColorKey") ?? systemC),
                             currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CTeacherKey") ?? ""),
                             currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CRoomKey") ?? ""),
                             
                             nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "DNameKey") ?? "D-Block"),
                             nextBlockTime: "9:55 - 11:05",
                             nextBlockDate: createDate(hour: 9, minute: 55),
                             nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "DColorKey") ?? systemD),
                             nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "DTeacherKey") ?? ""),
                             nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "DRoomKey") ?? "")
    )
    
    let Passing_CD_TS = NowClass(startBlockDate: createDate(hour: 9, minute: 40), currentBlockName: "Passing",
                                 currentBlockTime: "9:40 - 9:55",
                                 currentBlockDate: createDate(hour: 9, minute: 55),
                                 currentBlockColor: systemAbsence,
                                 currentBlockTeacher: "",
                                 currentBlockRoom: "",
                                 
                                 nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "DNameKey") ?? "D-Block"),
                                 nextBlockTime: "9:55 - 11:05",
                                 nextBlockDate: createDate(hour: 9, minute: 55),
                                 nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "DColorKey") ?? systemD),
                                 nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "DTeacherKey") ?? ""),
                                 nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "DRoomKey") ?? "")
    )
    
    let DBlock_TS = NowClass(startBlockDate: createDate(hour: 9, minute: 55), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "DNameKey") ?? "D-Block"),
                             currentBlockTime: "9:55 - 11:05",
                             currentBlockDate: createDate(hour: 11, minute: 05),
                             currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "DColorKey") ?? systemB),
                             currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "DTeacherKey") ?? ""),
                             currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "DRoomKey") ?? ""),
                             
                             nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CompassNameKey") ?? "Compass"),
                             nextBlockTime: "11:05 - 11:55",
                             nextBlockDate: createDate(hour: 11, minute: 05),
                             nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CompassColorKey") ?? systemTeal),
                             nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CompassTeacherKey") ?? ""),
                             nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CompassRoomKey") ?? "")
    )
    
    let Compass_TS = NowClass(startBlockDate: createDate(hour: 11, minute: 05), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CompassNameKey") ?? "Compass"),
                              currentBlockTime: "11:05 - 11:55",
                              currentBlockDate: createDate(hour: 11, minute: 55),
                              currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CompassColorKey") ?? systemTeal),
                              currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CompassTeacherKey") ?? ""),
                              currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CompassRoomKey") ?? ""),
                              
                              nextBlockName: ("Lunch"),
                              nextBlockTime: "11:55 - 12:25",
                              nextBlockDate: createDate(hour: 11, minute: 55),
                              nextBlockColor: (systemAbsence),
                              nextBlockTeacher: (""),
                              nextBlockRoom: ("")
    )
    
    let Lunch_TS = NowClass(startBlockDate: createDate(hour: 11, minute: 55), currentBlockName: "Lunch",
                            currentBlockTime: "11:55 - 12:25",
                            currentBlockDate: createDate(hour: 12, minute: 25),
                            currentBlockColor: systemAbsence,
                            currentBlockTeacher: "",
                            currentBlockRoom: "",
                            
                            nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "GNameKey") ?? "G-Block"),
                            nextBlockTime: "12:25 - 1:35",
                            nextBlockDate: createDate(hour: 12, minute: 25),
                            nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "GColorKey") ?? systemG),
                            nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "GTeacherKey") ?? ""),
                            nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "GRoomKey") ?? "")
    )
    
    let GBlock_TS = NowClass(startBlockDate: createDate(hour: 12, minute: 25), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "GNameKey") ?? "G-Block"),
                             currentBlockTime: "12:25 - 1:35",
                             currentBlockDate: createDate(hour: 13, minute: 35),
                             currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "GColorKey") ?? systemG),
                             currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "GTeacherKey") ?? ""),
                             currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "GRoomKey") ?? ""),
                             
                             nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "HNameKey") ?? "H-Block"),
                             nextBlockTime: "1:50 - 3:00",
                             nextBlockDate: createDate(hour: 13, minute: 50),
                             nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "HColorKey") ?? systemH),
                             nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "HTeacherKey") ?? ""),
                             nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "HRoomKey") ?? "")
    )
    
    let Passing_GH_TS = NowClass(startBlockDate: createDate(hour: 13, minute: 35), currentBlockName: "Passing",
                                 currentBlockTime: "1:35 - 1:50",
                                 currentBlockDate: createDate(hour: 13, minute: 50),
                                 currentBlockColor: systemAbsence,
                                 currentBlockTeacher: "",
                                 currentBlockRoom: "",
                                 
                                 nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "HNameKey") ?? "H-Block"),
                                 nextBlockTime: "1:50 - 3:00",
                                 nextBlockDate: createDate(hour: 13, minute: 50),
                                 nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "HColorKey") ?? systemH),
                                 nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "HTeacherKey") ?? ""),
                                 nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "HRoomKey") ?? "")
    )
    
    let HBlock_TS = NowClass(startBlockDate: createDate(hour: 13, minute: 50), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "HNameKey") ?? "H-Block"),
                             currentBlockTime: "1:50 - 3:00",
                             currentBlockDate: createDate(hour: 15, minute: 00),
                             currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "HColorKey") ?? systemH),
                             currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "HTeacherKey") ?? ""),
                             currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "HRoomKey") ?? ""),
                             
                             nextBlockName: ("Meeting/Open"),
                             nextBlockTime: "3:00 - 3:30",
                             nextBlockDate: createDate(hour: 15, minute: 00),
                             nextBlockColor: (systemAbsence),
                             nextBlockTeacher: (""),
                             nextBlockRoom: ("")
    )
    
    //MARK: Thursday Special
    let Preclass_RS = NowClass(startBlockDate: createDate(hour: 8, minute: 30), currentBlockName: "No Class",
                               currentBlockTime: "",
                               currentBlockDate: createDate(hour: 8, minute: 30),
                               currentBlockColor: systemAbsence,
                               currentBlockTeacher: "",
                               currentBlockRoom: "",
                               
                               nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "BNameKey") ?? "B-Block"),
                               nextBlockTime: "8:30 - 9:40",
                               nextBlockDate: createDate(hour: 8, minute: 30),
                               nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "BColorKey") ?? systemB),
                               nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "BTeacherKey") ?? ""),
                               nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "BRoomKey") ?? "")
    )
    
    let BBlock_RS = NowClass(startBlockDate: createDate(hour: 8, minute: 30), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "BNameKey") ?? "B-Block"),
                             currentBlockTime: "8:30 - 9:40",
                             currentBlockDate: createDate(hour: 9, minute: 40),
                             currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "BColorKey") ?? systemB),
                             currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "BTeacherKey") ?? ""),
                             currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "BRoomKey") ?? ""),
                             
                             nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ANameKey") ?? "A-Block"),
                             nextBlockTime: "9:55 - 11:05",
                             nextBlockDate: createDate(hour: 9, minute: 55),
                             nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AColorKey") ?? systemA),
                             nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ATeacherKey") ?? ""),
                             nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ARoomKey") ?? "")
    )
    
    let Passing_BA_RS = NowClass(startBlockDate: createDate(hour: 9, minute: 40), currentBlockName: "Passing",
                                 currentBlockTime: "9:40 - 9:55",
                                 currentBlockDate: createDate(hour: 9, minute: 55),
                                 currentBlockColor: systemAbsence,
                                 currentBlockTeacher: "",
                                 currentBlockRoom: "",
                                 
                                 nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ANameKey") ?? "A-Block"),
                                 nextBlockTime: "9:55 - 11:05",
                                 nextBlockDate: createDate(hour: 9, minute: 55),
                                 nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AColorKey") ?? systemA),
                                 nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ATeacherKey") ?? ""),
                                 nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ARoomKey") ?? "")
    )
    
    let ABlock_RS = NowClass(startBlockDate: createDate(hour: 9, minute: 55), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ANameKey") ?? "A-Block"),
                             currentBlockTime: "9:55 - 11:05",
                             currentBlockDate: createDate(hour: 11, minute: 05),
                             currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AColorKey") ?? systemA),
                             currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ATeacherKey") ?? ""),
                             currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ARoomKey") ?? ""),
                             
                             nextBlockName: ("Meeting/Open"),
                             nextBlockTime: "11:05 - 11:35",
                             nextBlockDate: createDate(hour: 11, minute: 05),
                             nextBlockColor: (systemAbsence),
                             nextBlockTeacher: (""),
                             nextBlockRoom: ("")
    )
    
    let Mtg_RS = NowClass(startBlockDate: createDate(hour: 11, minute: 05), currentBlockName: ("Meeting/Open"),
                          currentBlockTime: "11:05 - 11:35",
                          currentBlockDate: createDate(hour: 11, minute: 35),
                          currentBlockColor: (systemAbsence),
                          currentBlockTeacher: (""),
                          currentBlockRoom: (""),
                          
                          nextBlockName: ("Lunch"),
                          nextBlockTime: "11:35 - 12:25",
                          nextBlockDate: createDate(hour: 11, minute: 35),
                          nextBlockColor: (systemAbsence),
                          nextBlockTeacher: (""),
                          nextBlockRoom: ("")
    )
    
    let Lunch_RS = NowClass(startBlockDate: createDate(hour: 11, minute: 35), currentBlockName: "Lunch",
                            currentBlockTime: "11:35 - 12:25",
                            currentBlockDate: createDate(hour: 12, minute: 25),
                            currentBlockColor: systemAbsence,
                            currentBlockTeacher: "",
                            currentBlockRoom: "",
                            
                            nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "FNameKey") ?? "F-Block"),
                            nextBlockTime: "12:25 - 1:35",
                            nextBlockDate: createDate(hour: 12, minute: 25),
                            nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "FColorKey") ?? systemF),
                            nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "FTeacherKey") ?? ""),
                            nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "FRoomKey") ?? "")
    )
    
    let FBlock_RS = NowClass(startBlockDate: createDate(hour: 12, minute: 25), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "FNameKey") ?? "F-Block"),
                             currentBlockTime: "12:25 - 1:35",
                             currentBlockDate: createDate(hour: 13, minute: 35),
                             currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "FColorKey") ?? systemF),
                             currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "FTeacherKey") ?? ""),
                             currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "FRoomKey") ?? ""),
                             
                             nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ENameKey") ?? "E-Block"),
                             nextBlockTime: "1:50 - 3:00",
                             nextBlockDate: createDate(hour: 13, minute: 50),
                             nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "EColorKey") ?? systemE),
                             nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ETeacherKey") ?? ""),
                             nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ERoomKey") ?? "")
    )
    
    let Passing_FE_RS = NowClass(startBlockDate: createDate(hour: 13, minute: 35), currentBlockName: "Passing",
                                 currentBlockTime: "1:35 - 1:50",
                                 currentBlockDate: createDate(hour: 13, minute: 50),
                                 currentBlockColor: systemAbsence,
                                 currentBlockTeacher: "",
                                 currentBlockRoom: "",
                                 
                                 nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ENameKey") ?? "E-Block"),
                                 nextBlockTime: "1:50 - 3:00",
                                 nextBlockDate: createDate(hour: 13, minute: 50),
                                 nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "EColorKey") ?? systemE),
                                 nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ETeacherKey") ?? ""),
                                 nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ERoomKey") ?? "")
    )
    
    let EBlock_RS = NowClass(startBlockDate: createDate(hour: 13, minute: 50), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ENameKey") ?? "E-Block"),
                             currentBlockTime: "1:50 - 3:00",
                             currentBlockDate: createDate(hour: 15, minute: 00),
                             currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "EColorKey") ?? systemE),
                             currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ETeacherKey") ?? ""),
                             currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "ERoomKey") ?? ""),
                             
                             nextBlockName: ("Meeting/Open"),
                             nextBlockTime: "3:00 - 3:30",
                             nextBlockDate: createDate(hour: 15, minute: 00),
                             nextBlockColor: (systemAbsence),
                             nextBlockTeacher: (""),
                             nextBlockRoom: ("")
    )
    
    //MARK: Friday Special
    let Preclass_FS = NowClass(startBlockDate: createDate(hour: 8, minute: 30), currentBlockName: "No Class",
                               currentBlockTime: "",
                               currentBlockDate: createDate(hour: 8, minute: 30),
                               currentBlockColor: systemAbsence,
                               currentBlockTeacher: "",
                               currentBlockRoom: "",
                               
                               nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "DNameKey") ?? "D-Block"),
                               nextBlockTime: "8:30 - 9:40",
                               nextBlockDate: createDate(hour: 8, minute: 30),
                               nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "DColorKey") ?? systemD),
                               nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "DTeacherKey") ?? ""),
                               nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "DRoomKey") ?? "")
    )
    
    let DBlock_FS = NowClass(startBlockDate: createDate(hour: 8, minute: 30), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "DNameKey") ?? "D-Block"),
                             currentBlockTime: "8:30 - 9:40",
                             currentBlockDate: createDate(hour: 9, minute: 40),
                             currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "DColorKey") ?? systemD),
                             currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "DTeacherKey") ?? ""),
                             currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "DRoomKey") ?? ""),
                             
                             nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CNameKey") ?? "C-Block"),
                             nextBlockTime: "9:55 - 11:05",
                             nextBlockDate: createDate(hour: 9, minute: 55),
                             nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CColorKey") ?? systemC),
                             nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CTeacherKey") ?? ""),
                             nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CRoomKey") ?? "")
    )
    
    let Passing_DC_FS = NowClass(startBlockDate: createDate(hour: 9, minute: 40), currentBlockName: "Passing",
                                 currentBlockTime: "9:40 - 9:55",
                                 currentBlockDate: createDate(hour: 9, minute: 55),
                                 currentBlockColor: systemAbsence,
                                 currentBlockTeacher: "",
                                 currentBlockRoom: "",
                                 
                                 nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CNameKey") ?? "C-Block"),
                                 nextBlockTime: "9:55 - 11:05",
                                 nextBlockDate: createDate(hour: 9, minute: 55),
                                 nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CColorKey") ?? systemC),
                                 nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CTeacherKey") ?? ""),
                                 nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CRoomKey") ?? "")
    )
    
    let CBlock_FS = NowClass(startBlockDate: createDate(hour: 9, minute: 55), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CNameKey") ?? "C-Block"),
                             currentBlockTime: "9:55 - 11:05",
                             currentBlockDate: createDate(hour: 11, minute: 05),
                             currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CColorKey") ?? systemC),
                             currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CTeacherKey") ?? ""),
                             currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "CRoomKey") ?? ""),
                             
                             nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "AdvisingNameKey") ?? "Advising"),
                             nextBlockTime: "11:05 - 11:35",
                             nextBlockDate: createDate(hour: 11, minute: 05),
                             nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AdvisingColorKey") ?? systemTeal),
                             nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "AdvisingTeacherKey") ?? ""),
                             nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "AdvisingRoomKey") ?? "")
    )
    
    let Advising_FS = NowClass(startBlockDate: createDate(hour: 11, minute: 05), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "AdvisingNameKey") ?? "Advising"),
                               currentBlockTime: "11:05 - 11:35",
                               currentBlockDate: createDate(hour: 11, minute: 35),
                               currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AdvisingColorKey") ?? systemTeal),
                               currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "AdvisingTeacherKey") ?? ""),
                               currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "AdvisingRoomKey") ?? ""),
                               
                               nextBlockName: ("Lunch"),
                               nextBlockTime: "11:35 - 12:25",
                               nextBlockDate: createDate(hour: 11, minute: 35),
                               nextBlockColor: (systemAbsence),
                               nextBlockTeacher: (""),
                               nextBlockRoom: ("")
    )
    
    let Lunch_FS = NowClass(startBlockDate: createDate(hour: 11, minute: 35), currentBlockName: "Lunch",
                            currentBlockTime: "11:35 - 12:25",
                            currentBlockDate: createDate(hour: 12, minute: 25),
                            currentBlockColor: systemAbsence,
                            currentBlockTeacher: "",
                            currentBlockRoom: "",
                            
                            nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "HNameKey") ?? "H-Block"),
                            nextBlockTime: "12:25 - 1:35",
                            nextBlockDate: createDate(hour: 12, minute: 25),
                            nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "HColorKey") ?? systemH),
                            nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "HTeacherKey") ?? ""),
                            nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "HRoomKey") ?? "")
    )
    
    let HBlock_FS = NowClass(startBlockDate: createDate(hour: 12, minute: 25), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "HNameKey") ?? "H-Block"),
                             currentBlockTime: "12:25 - 1:35",
                             currentBlockDate: createDate(hour: 13, minute: 35),
                             currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "HColorKey") ?? systemH),
                             currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "HTeacherKey") ?? ""),
                             currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "HRoomKey") ?? ""),
                             
                             nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "GNameKey") ?? "G-Block"),
                             nextBlockTime: "1:50 - 3:00",
                             nextBlockDate: createDate(hour: 13, minute: 50),
                             nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "GColorKey") ?? systemG),
                             nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "GTeacherKey") ?? ""),
                             nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "GRoomKey") ?? "")
    )
    
    let Passing_HG_FS = NowClass(startBlockDate: createDate(hour: 13, minute: 35), currentBlockName: "Passing",
                                 currentBlockTime: "1:35 - 1:50",
                                 currentBlockDate: createDate(hour: 13, minute: 50),
                                 currentBlockColor: systemAbsence,
                                 currentBlockTeacher: "",
                                 currentBlockRoom: "",
                                 
                                 nextBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "GNameKey") ?? "G-Block"),
                                 nextBlockTime: "1:50 - 3:00",
                                 nextBlockDate: createDate(hour: 13, minute: 50),
                                 nextBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "GColorKey") ?? systemG),
                                 nextBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "GTeacherKey") ?? ""),
                                 nextBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "GRoomKey") ?? "")
    )
    
    let GBlock_FS = NowClass(startBlockDate: createDate(hour: 13, minute: 50), currentBlockName: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "GNameKey") ?? "G-Block"),
                             currentBlockTime: "1:50 - 3:00",
                             currentBlockDate: createDate(hour: 15, minute: 00),
                             currentBlockColor: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "GColorKey") ?? systemG),
                             currentBlockTeacher: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "GTeacherKey") ?? ""),
                             currentBlockRoom: (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.string(forKey: "GRoomKey") ?? ""),
                             
                             nextBlockName: ("Meeting/Open"),
                             nextBlockTime: "3:00 - 3:30",
                             nextBlockDate: createDate(hour: 15, minute: 00),
                             nextBlockColor: (systemAbsence),
                             nextBlockTeacher: (""),
                             nextBlockRoom: ("")
    )
    
    let Pre_Finals = NowClass(startBlockDate: createDate(hour: 8, minute: 05), currentBlockName: "No Finals",
                               currentBlockTime: "",
                               currentBlockDate: createDate(hour: 8, minute: 05),
                               currentBlockColor: systemAbsence,
                               currentBlockTeacher: "",
                               currentBlockRoom: "",
                               
                               nextBlockName: "Finals Session 1",
                               nextBlockTime: "8:05 - 10:05",
                               nextBlockDate: createDate(hour: 8, minute: 05),
                               nextBlockColor: accentTeal,
                               nextBlockTeacher: "",
                               nextBlockRoom: ""
    )
    
    let Finals1 = NowClass(startBlockDate: createDate(hour: 8, minute: 05), currentBlockName: "Finals Session 1",
                             currentBlockTime: "8:05 - 10:05",
                             currentBlockDate: createDate(hour: 10, minute: 05),
                             currentBlockColor: accentTeal,
                             currentBlockTeacher: "",
                             currentBlockRoom: "",
                             
                             nextBlockName: ("Finals Session 2"),
                             nextBlockTime: "10:35 - 12:35",
                             nextBlockDate: createDate(hour: 10, minute: 35),
                             nextBlockColor: (accentTeal),
                             nextBlockTeacher: (""),
                             nextBlockRoom: ("")
    )
    
    let FinalsBreak1to2 = NowClass(startBlockDate: createDate(hour: 10, minute: 05), currentBlockName: "Break",
                           currentBlockTime: "10:05 - 10:35",
                           currentBlockDate: createDate(hour: 10, minute: 35),
                           currentBlockColor: systemAbsence,
                           currentBlockTeacher: "",
                           currentBlockRoom: "",
                           
                           nextBlockName: ("Finals Session 2"),
                           nextBlockTime: "10:35 - 12:35",
                           nextBlockDate: createDate(hour: 10, minute: 35),
                           nextBlockColor: (accentTeal),
                           nextBlockTeacher: (""),
                           nextBlockRoom: ("")
    )
    
    let Finals2 = NowClass(startBlockDate: createDate(hour: 10, minute: 35), currentBlockName: "Finals Session 2",
                           currentBlockTime: "10:35 - 12:35",
                           currentBlockDate: createDate(hour: 12, minute: 35),
                           currentBlockColor: accentTeal,
                           currentBlockTeacher: "",
                           currentBlockRoom: "",
                           
                           nextBlockName: ("Finals Session 3"),
                           nextBlockTime: "1:15 - 3:15",
                           nextBlockDate: createDate(hour: 10, minute: 35),
                           nextBlockColor: (accentTeal),
                           nextBlockTeacher: (""),
                           nextBlockRoom: ("")
    )
    
    let NoClass = NowClass(startBlockDate: Date(), currentBlockName: "No Class", currentBlockTime: "", currentBlockDate: Date(), currentBlockColor: systemAbsence, currentBlockTeacher: "", currentBlockRoom: "", nextBlockName: "No Class", nextBlockTime: "", nextBlockDate: Date(), nextBlockColor: systemAbsence, nextBlockTeacher: "", nextBlockRoom: "")
    
    enum dayOfWeek : Int {
        case sunday = 1
        case monday = 2
        case tuesday = 3
        case wednesday = 4
        case thursday = 5
        case friday = 6
        case saturday = 7
    }
    let weekdayEnum = dayOfWeek(rawValue: currentWeekDay)
    if weekofyear == 3 {
        switch weekdayEnum {
            case .thursday:
                if currentDate >= createDate(hour: 07, minute: 00) && currentDate < createDate(hour: 08, minute: 30) {
                    return(Preclass_M)
                }
                else if currentDate >= createDate(hour: 08, minute: 30) && currentDate < createDate(hour: 09, minute: 45) {
                    return(ABlock_M)
                }
                else if currentDate >= createDate(hour: 09, minute: 45) && currentDate < createDate(hour: 10, minute: 00) {
                    return(Passing_AB_M)
                }
                else if currentDate >= createDate(hour: 10, minute: 00) && currentDate < createDate(hour: 11, minute: 15) {
                    return(BBlock_M)
                }
                else if currentDate >= createDate(hour: 11, minute: 15) && currentDate < createDate(hour: 11, minute: 45) {
                    return(Assembly_M)
                }
                else if currentDate >= createDate(hour: 11, minute: 45) && currentDate < createDate(hour: 12, minute: 15) {
                    return(Lunch_M)
                }
                else if currentDate >= createDate(hour: 12, minute: 15) && currentDate < createDate(hour: 13, minute: 30) {
                    return(EBlock_M)
                }
                else if currentDate >= createDate(hour: 13, minute: 30) && currentDate < createDate(hour: 13, minute: 45) {
                    return(Passing_EF_M)
                }
                else if currentDate >= createDate(hour: 13, minute: 45) && currentDate < createDate(hour: 15, minute: 00) {
                    return(FBlock_M)
                }
                else if currentDate >= createDate(hour: 15, minute: 00) && currentDate < createDate(hour: 15, minute: 30) {
                    return(Open)
                }
                else {
                    return(NoClass)
                }
            case .friday:
                if currentDate >= createDate(hour: 07, minute: 00) && currentDate < createDate(hour: 08, minute: 30) {
                    return(Preclass_T)
                }
                else if currentDate >= createDate(hour: 08, minute: 30) && currentDate < createDate(hour: 09, minute: 45) {
                    return(CBlock_T)
                }
                else if currentDate >= createDate(hour: 09, minute: 45) && currentDate < createDate(hour: 10, minute: 00) {
                    return(Passing_CD_T)
                }
                else if currentDate >= createDate(hour: 10, minute: 00) && currentDate < createDate(hour: 11, minute: 15) {
                    return(DBlock_T)
                }
                else if currentDate >= createDate(hour: 11, minute: 15) && currentDate < createDate(hour: 11, minute: 45) {
                    return(Mtg)
                }
                else if currentDate >= createDate(hour: 11, minute: 45) && currentDate < createDate(hour: 12, minute: 15) {
                    return(Lunch_T)
                }
                else if currentDate >= createDate(hour: 12, minute: 15) && currentDate < createDate(hour: 13, minute: 30) {
                    return(GBlock_T)
                }
                else if currentDate >= createDate(hour: 13, minute: 30) && currentDate < createDate(hour: 13, minute: 45) {
                    return(Passing_GH_T)
                }
                else if currentDate >= createDate(hour: 13, minute: 45) && currentDate < createDate(hour: 15, minute: 00) {
                    return(HBlock_T)
                }
                else if currentDate >= createDate(hour: 15, minute: 00) && currentDate < createDate(hour: 15, minute: 30) {
                    return(Open)
                }
                else {
                    return(NoClass)
                }
            default:
                return(NoClass)
        }
    }
    else if weekofyear == 4 || weekofyear == 8 {
        switch weekdayEnum {
            case .tuesday:
                if currentDate >= createDate(hour: 07, minute: 00) && currentDate < createDate(hour: 08, minute: 30) {
                    return(Preclass_MS)
                }
                else if currentDate >= createDate(hour: 08, minute: 30) && currentDate < createDate(hour: 09, minute: 40) {
                    return(ABlock_MS)
                }
                else if currentDate >= createDate(hour: 09, minute: 40) && currentDate < createDate(hour: 9, minute: 55) {
                    return(Passing_AB_MS)
                }
                else if currentDate >= createDate(hour: 9, minute: 55) && currentDate < createDate(hour: 11, minute: 05) {
                    return(BBlock_MS)
                }
                else if currentDate >= createDate(hour: 11, minute: 05) && currentDate < createDate(hour: 11, minute: 35) {
                    return(Assembly_MS)
                }
                else if currentDate >= createDate(hour: 11, minute: 35) && currentDate < createDate(hour: 12, minute: 25) {
                    return(Lunch_MS)
                }
                else if currentDate >= createDate(hour: 12, minute: 25) && currentDate < createDate(hour: 13, minute: 35) {
                    return(EBlock_MS)
                }
                else if currentDate >= createDate(hour: 13, minute: 35) && currentDate < createDate(hour: 13, minute: 50) {
                    return(Passing_EF_MS)
                }
                else if currentDate >= createDate(hour: 13, minute: 50) && currentDate < createDate(hour: 15, minute: 00) {
                    return(FBlock_MS)
                }
                else if currentDate >= createDate(hour: 15, minute: 00) && currentDate < createDate(hour: 15, minute: 30) {
                    return(Open)
                }
                else {
                    return(NoClass)
                }
            case .wednesday:
                if currentDate >= createDate(hour: 07, minute: 00) && currentDate < createDate(hour: 08, minute: 30) {
                    return(Preclass_TS)
                }
                else if currentDate >= createDate(hour: 08, minute: 30) && currentDate < createDate(hour: 09, minute: 40) {
                    return(CBlock_TS)
                }
                else if currentDate >= createDate(hour: 09, minute: 40) && currentDate < createDate(hour: 9, minute: 55) {
                    return(Passing_CD_TS)
                }
                else if currentDate >= createDate(hour: 9, minute: 55) && currentDate < createDate(hour: 11, minute: 05) {
                    return(DBlock_TS)
                }
                else if currentDate >= createDate(hour: 11, minute: 05) && currentDate < createDate(hour: 11, minute: 55) {
                    return(Compass_TS)
                }
                else if currentDate >= createDate(hour: 11, minute: 55) && currentDate < createDate(hour: 12, minute: 25) {
                    return(Lunch_TS)
                }
                else if currentDate >= createDate(hour: 12, minute: 25) && currentDate < createDate(hour: 13, minute: 35) {
                    return(GBlock_TS)
                }
                else if currentDate >= createDate(hour: 13, minute: 35) && currentDate < createDate(hour: 13, minute: 50) {
                    return(Passing_GH_TS)
                }
                else if currentDate >= createDate(hour: 13, minute: 50) && currentDate < createDate(hour: 15, minute: 00) {
                    return(HBlock_TS)
                }
                else if currentDate >= createDate(hour: 15, minute: 00) && currentDate < createDate(hour: 15, minute: 30) {
                    return(Open)
                }
                else {
                    return(NoClass)
                }
            case .thursday:
                if currentDate >= createDate(hour: 07, minute: 00) && currentDate < createDate(hour: 08, minute: 30) {
                    return(Preclass_RS)
                }
                else if currentDate >= createDate(hour: 08, minute: 30) && currentDate < createDate(hour: 09, minute: 40) {
                    return(BBlock_RS)
                }
                else if currentDate >= createDate(hour: 09, minute: 40) && currentDate < createDate(hour: 9, minute: 55) {
                    return(Passing_BA_RS)
                }
                else if currentDate >= createDate(hour: 9, minute: 55) && currentDate < createDate(hour: 11, minute: 05) {
                    return(ABlock_RS)
                }
                else if currentDate >= createDate(hour: 11, minute: 05) && currentDate < createDate(hour: 11, minute: 35) {
                    return(Mtg_RS)
                }
                else if currentDate >= createDate(hour: 11, minute: 35) && currentDate < createDate(hour: 12, minute: 25) {
                    return(Lunch_RS)
                }
                else if currentDate >= createDate(hour: 12, minute: 25) && currentDate < createDate(hour: 13, minute: 35) {
                    return(FBlock_RS)
                }
                else if currentDate >= createDate(hour: 13, minute: 35) && currentDate < createDate(hour: 13, minute: 50) {
                    return(Passing_FE_RS)
                }
                else if currentDate >= createDate(hour: 13, minute: 50) && currentDate < createDate(hour: 15, minute: 00) {
                    return(EBlock_RS)
                }
                else if currentDate >= createDate(hour: 15, minute: 00) && currentDate < createDate(hour: 15, minute: 30) {
                    return(Open)
                }
                else {
                    return(NoClass)
                }
            case .friday:
                if currentDate >= createDate(hour: 07, minute: 00) && currentDate < createDate(hour: 08, minute: 30) {
                    return(Preclass_FS)
                }
                else if currentDate >= createDate(hour: 08, minute: 30) && currentDate < createDate(hour: 09, minute: 40) {
                    return(DBlock_FS)
                }
                else if currentDate >= createDate(hour: 09, minute: 40) && currentDate < createDate(hour: 9, minute: 55) {
                    return(Passing_DC_FS)
                }
                else if currentDate >= createDate(hour: 9, minute: 55) && currentDate < createDate(hour: 11, minute: 05) {
                    return(CBlock_FS)
                }
                else if currentDate >= createDate(hour: 11, minute: 05) && currentDate < createDate(hour: 11, minute: 35) {
                    return(Advising_FS)
                }
                else if currentDate >= createDate(hour: 11, minute: 35) && currentDate < createDate(hour: 12, minute: 25) {
                    return(Lunch_FS)
                }
                else if currentDate >= createDate(hour: 12, minute: 25) && currentDate < createDate(hour: 13, minute: 35) {
                    return(HBlock_FS)
                }
                else if currentDate >= createDate(hour: 13, minute: 35) && currentDate < createDate(hour: 13, minute: 50) {
                    return(Passing_HG_FS)
                }
                else if currentDate >= createDate(hour: 13, minute: 50) && currentDate < createDate(hour: 15, minute: 00) {
                    return(GBlock_FS)
                }
                else if currentDate >= createDate(hour: 15, minute: 00) && currentDate < createDate(hour: 15, minute: 30) {
                    return(Open)
                }
                else {
                    return(NoClass)
                }
            default:
                return(NoClass)
        }
    }
    else if weekofyear == 5 {
        switch weekdayEnum {
            case .monday:
                if currentDate >= createDate(hour: 07, minute: 00) && currentDate < createDate(hour: 08, minute: 30) {
                    return(Preclass_M)
                }
                else if currentDate >= createDate(hour: 08, minute: 30) && currentDate < createDate(hour: 09, minute: 45) {
                    return(ABlock_M)
                }
                else if currentDate >= createDate(hour: 09, minute: 45) && currentDate < createDate(hour: 10, minute: 00) {
                    return(Passing_AB_M)
                }
                else if currentDate >= createDate(hour: 10, minute: 00) && currentDate < createDate(hour: 11, minute: 15) {
                    return(BBlock_M)
                }
                else if currentDate >= createDate(hour: 11, minute: 15) && currentDate < createDate(hour: 11, minute: 45) {
                    return(Assembly_M)
                }
                else if currentDate >= createDate(hour: 11, minute: 45) && currentDate < createDate(hour: 12, minute: 15) {
                    return(Lunch_M)
                }
                else if currentDate >= createDate(hour: 12, minute: 15) && currentDate < createDate(hour: 13, minute: 30) {
                    return(EBlock_M)
                }
                else if currentDate >= createDate(hour: 13, minute: 30) && currentDate < createDate(hour: 13, minute: 45) {
                    return(Passing_EF_M)
                }
                else if currentDate >= createDate(hour: 13, minute: 45) && currentDate < createDate(hour: 15, minute: 00) {
                    return(FBlock_M)
                }
                else if currentDate >= createDate(hour: 15, minute: 00) && currentDate < createDate(hour: 15, minute: 30) {
                    return(Open)
                }
                else {
                    return(NoClass)
                }
            case .tuesday:
                if currentDate >= createDate(hour: 07, minute: 00) && currentDate < createDate(hour: 08, minute: 30) {
                    return(Preclass_T)
                }
                else if currentDate >= createDate(hour: 08, minute: 30) && currentDate < createDate(hour: 09, minute: 45) {
                    return(CBlock_T)
                }
                else if currentDate >= createDate(hour: 09, minute: 45) && currentDate < createDate(hour: 10, minute: 00) {
                    return(Passing_CD_T)
                }
                else if currentDate >= createDate(hour: 10, minute: 00) && currentDate < createDate(hour: 11, minute: 15) {
                    return(DBlock_T)
                }
                else if currentDate >= createDate(hour: 11, minute: 15) && currentDate < createDate(hour: 11, minute: 45) {
                    return(Mtg)
                }
                else if currentDate >= createDate(hour: 11, minute: 45) && currentDate < createDate(hour: 12, minute: 15) {
                    return(Lunch_T)
                }
                else if currentDate >= createDate(hour: 12, minute: 15) && currentDate < createDate(hour: 13, minute: 30) {
                    return(GBlock_T)
                }
                else if currentDate >= createDate(hour: 13, minute: 30) && currentDate < createDate(hour: 13, minute: 45) {
                    return(Passing_GH_T)
                }
                else if currentDate >= createDate(hour: 13, minute: 45) && currentDate < createDate(hour: 15, minute: 00) {
                    return(HBlock_T)
                }
                else if currentDate >= createDate(hour: 15, minute: 00) && currentDate < createDate(hour: 15, minute: 30) {
                    return(Open)
                }
                else {
                    return(NoClass)
                }
            case .thursday:
                if currentDate >= createDate(hour: 07, minute: 00) && currentDate < createDate(hour: 08, minute: 30) {
                    return(Preclass_R)
                }
                else if currentDate >= createDate(hour: 08, minute: 30) && currentDate < createDate(hour: 09, minute: 45) {
                    return(BBlock_R)
                }
                else if currentDate >= createDate(hour: 09, minute: 45) && currentDate < createDate(hour: 10, minute: 00) {
                    return(Passing_BA_R)
                }
                else if currentDate >= createDate(hour: 10, minute: 00) && currentDate < createDate(hour: 11, minute: 15) {
                    return(ABlock_R)
                }
                else if currentDate >= createDate(hour: 11, minute: 15) && currentDate < createDate(hour: 11, minute: 45) {
                    return(Mtg)
                }
                else if currentDate >= createDate(hour: 11, minute: 45) && currentDate < createDate(hour: 12, minute: 15) {
                    return(Lunch_R)
                }
                else if currentDate >= createDate(hour: 12, minute: 15) && currentDate < createDate(hour: 13, minute: 30) {
                    return(FBlock_R)
                }
                else if currentDate >= createDate(hour: 13, minute: 30) && currentDate < createDate(hour: 13, minute: 45) {
                    return(Passing_FE_R)
                }
                else if currentDate >= createDate(hour: 13, minute: 45) && currentDate < createDate(hour: 15, minute: 00) {
                    return(EBlock_R)
                }
                else if currentDate >= createDate(hour: 15, minute: 00) && currentDate < createDate(hour: 15, minute: 30) {
                    return(Open)
                }
                else {
                    return(NoClass)
                }
            case .friday:
                if currentDate >= createDate(hour: 07, minute: 00) && currentDate < createDate(hour: 08, minute: 30) {
                    return(Preclass_F)
                }
                else if currentDate >= createDate(hour: 08, minute: 30) && currentDate < createDate(hour: 09, minute: 45) {
                    return(DBlock_F)
                }
                else if currentDate >= createDate(hour: 09, minute: 45) && currentDate < createDate(hour: 10, minute: 00) {
                    return(Passing_DC_F)
                }
                else if currentDate >= createDate(hour: 10, minute: 00) && currentDate < createDate(hour: 11, minute: 15) {
                    return(CBlock_F)
                }
                else if currentDate >= createDate(hour: 11, minute: 15) && currentDate < createDate(hour: 11, minute: 45) {
                    return(Mtg)
                }
                else if currentDate >= createDate(hour: 11, minute: 45) && currentDate < createDate(hour: 12, minute: 15) {
                    return(Lunch_F)
                }
                else if currentDate >= createDate(hour: 12, minute: 15) && currentDate < createDate(hour: 13, minute: 30) {
                    return(HBlock_F)
                }
                else if currentDate >= createDate(hour: 13, minute: 30) && currentDate < createDate(hour: 13, minute: 45) {
                    return(Passing_HG_F)
                }
                else if currentDate >= createDate(hour: 13, minute: 45) && currentDate < createDate(hour: 15, minute: 00) {
                    return(GBlock_F)
                }
                else if currentDate >= createDate(hour: 15, minute: 00) && currentDate < createDate(hour: 15, minute: 30) {
                    return(Open)
                }
                else {
                    return(NoClass)
                }
            default:
                return(NoClass)
        }
    }
    else if weekofyear == 12 || weekofyear == 22 {
        switch weekdayEnum {
            case .monday:
                if currentDate >= createDate(hour: 07, minute: 00) && currentDate < createDate(hour: 08, minute: 30) {
                    return(Preclass_MS)
                }
                else if currentDate >= createDate(hour: 08, minute: 30) && currentDate < createDate(hour: 09, minute: 40) {
                    return(ABlock_MS)
                }
                else if currentDate >= createDate(hour: 09, minute: 40) && currentDate < createDate(hour: 9, minute: 55) {
                    return(Passing_AB_MS)
                }
                else if currentDate >= createDate(hour: 9, minute: 55) && currentDate < createDate(hour: 11, minute: 05) {
                    return(BBlock_MS)
                }
                else if currentDate >= createDate(hour: 11, minute: 05) && currentDate < createDate(hour: 11, minute: 35) {
                    return(Assembly_MS)
                }
                else if currentDate >= createDate(hour: 11, minute: 35) && currentDate < createDate(hour: 12, minute: 25) {
                    return(Lunch_MS)
                }
                else if currentDate >= createDate(hour: 12, minute: 25) && currentDate < createDate(hour: 13, minute: 35) {
                    return(EBlock_MS)
                }
                else if currentDate >= createDate(hour: 13, minute: 35) && currentDate < createDate(hour: 13, minute: 50) {
                    return(Passing_EF_MS)
                }
                else if currentDate >= createDate(hour: 13, minute: 50) && currentDate < createDate(hour: 15, minute: 00) {
                    return(FBlock_MS)
                }
                else if currentDate >= createDate(hour: 15, minute: 00) && currentDate < createDate(hour: 15, minute: 30) {
                    return(Open)
                }
                else {
                    return(NoClass)
                }
            case .tuesday:
                if currentDate >= createDate(hour: 07, minute: 00) && currentDate < createDate(hour: 08, minute: 30) {
                    return(Preclass_TS)
                }
                else if currentDate >= createDate(hour: 08, minute: 30) && currentDate < createDate(hour: 09, minute: 40) {
                    return(CBlock_TS)
                }
                else if currentDate >= createDate(hour: 09, minute: 40) && currentDate < createDate(hour: 9, minute: 55) {
                    return(Passing_CD_TS)
                }
                else if currentDate >= createDate(hour: 9, minute: 55) && currentDate < createDate(hour: 11, minute: 05) {
                    return(DBlock_TS)
                }
                else if currentDate >= createDate(hour: 11, minute: 05) && currentDate < createDate(hour: 11, minute: 55) {
                    return(Compass_TS)
                }
                else if currentDate >= createDate(hour: 11, minute: 55) && currentDate < createDate(hour: 12, minute: 25) {
                    return(Lunch_TS)
                }
                else if currentDate >= createDate(hour: 12, minute: 25) && currentDate < createDate(hour: 13, minute: 35) {
                    return(GBlock_TS)
                }
                else if currentDate >= createDate(hour: 13, minute: 35) && currentDate < createDate(hour: 13, minute: 50) {
                    return(Passing_GH_TS)
                }
                else if currentDate >= createDate(hour: 13, minute: 50) && currentDate < createDate(hour: 15, minute: 00) {
                    return(HBlock_TS)
                }
                else if currentDate >= createDate(hour: 15, minute: 00) && currentDate < createDate(hour: 15, minute: 30) {
                    return(Open)
                }
                else {
                    return(NoClass)
                }
            case .wednesday:
                if currentDate >= createDate(hour: 07, minute: 00) && currentDate < createDate(hour: 08, minute: 30) {
                    return(Preclass_RS)
                }
                else if currentDate >= createDate(hour: 08, minute: 30) && currentDate < createDate(hour: 09, minute: 40) {
                    return(BBlock_RS)
                }
                else if currentDate >= createDate(hour: 09, minute: 40) && currentDate < createDate(hour: 9, minute: 55) {
                    return(Passing_BA_RS)
                }
                else if currentDate >= createDate(hour: 9, minute: 55) && currentDate < createDate(hour: 11, minute: 05) {
                    return(ABlock_RS)
                }
                else if currentDate >= createDate(hour: 11, minute: 05) && currentDate < createDate(hour: 11, minute: 35) {
                    return(Mtg_RS)
                }
                else if currentDate >= createDate(hour: 11, minute: 35) && currentDate < createDate(hour: 12, minute: 25) {
                    return(Lunch_RS)
                }
                else if currentDate >= createDate(hour: 12, minute: 25) && currentDate < createDate(hour: 13, minute: 35) {
                    return(FBlock_RS)
                }
                else if currentDate >= createDate(hour: 13, minute: 35) && currentDate < createDate(hour: 13, minute: 50) {
                    return(Passing_FE_RS)
                }
                else if currentDate >= createDate(hour: 13, minute: 50) && currentDate < createDate(hour: 15, minute: 00) {
                    return(EBlock_RS)
                }
                else if currentDate >= createDate(hour: 15, minute: 00) && currentDate < createDate(hour: 15, minute: 30) {
                    return(Open)
                }
                else {
                    return(NoClass)
                }
            case .thursday:
                if currentDate >= createDate(hour: 07, minute: 00) && currentDate < createDate(hour: 08, minute: 30) {
                    return(Preclass_FS)
                }
                else if currentDate >= createDate(hour: 08, minute: 30) && currentDate < createDate(hour: 09, minute: 40) {
                    return(DBlock_FS)
                }
                else if currentDate >= createDate(hour: 09, minute: 40) && currentDate < createDate(hour: 9, minute: 55) {
                    return(Passing_DC_FS)
                }
                else if currentDate >= createDate(hour: 9, minute: 55) && currentDate < createDate(hour: 11, minute: 05) {
                    return(CBlock_FS)
                }
                else if currentDate >= createDate(hour: 11, minute: 05) && currentDate < createDate(hour: 11, minute: 35) {
                    return(Advising_FS)
                }
                else if currentDate >= createDate(hour: 11, minute: 35) && currentDate < createDate(hour: 12, minute: 25) {
                    return(Lunch_FS)
                }
                else if currentDate >= createDate(hour: 12, minute: 25) && currentDate < createDate(hour: 13, minute: 35) {
                    return(HBlock_FS)
                }
                else if currentDate >= createDate(hour: 13, minute: 35) && currentDate < createDate(hour: 13, minute: 50) {
                    return(Passing_HG_FS)
                }
                else if currentDate >= createDate(hour: 13, minute: 50) && currentDate < createDate(hour: 15, minute: 00) {
                    return(GBlock_FS)
                }
                else if currentDate >= createDate(hour: 15, minute: 00) && currentDate < createDate(hour: 15, minute: 30) {
                    return(Open)
                }
                else {
                    return(NoClass)
                }
            default:
                return(NoClass)
        }
    }
    else if weekofyear == 10 || weekofyear == 15 || weekofyear > 22 || weekofyear < 2 {
        return(NoClass)
    }
    else {
        switch weekdayEnum {
            case .monday:
                if currentDate >= createDate(hour: 07, minute: 00) && currentDate < createDate(hour: 08, minute: 30) {
                    return(Preclass_M)
                }
                else if currentDate >= createDate(hour: 08, minute: 30) && currentDate < createDate(hour: 09, minute: 45) {
                    return(ABlock_M)
                }
                else if currentDate >= createDate(hour: 09, minute: 45) && currentDate < createDate(hour: 10, minute: 00) {
                    return(Passing_AB_M)
                }
                else if currentDate >= createDate(hour: 10, minute: 00) && currentDate < createDate(hour: 11, minute: 15) {
                    return(BBlock_M)
                }
                else if currentDate >= createDate(hour: 11, minute: 15) && currentDate < createDate(hour: 11, minute: 45) {
                    return(Assembly_M)
                }
                else if currentDate >= createDate(hour: 11, minute: 45) && currentDate < createDate(hour: 12, minute: 15) {
                    return(Lunch_M)
                }
                else if currentDate >= createDate(hour: 12, minute: 15) && currentDate < createDate(hour: 13, minute: 30) {
                    return(EBlock_M)
                }
                else if currentDate >= createDate(hour: 13, minute: 30) && currentDate < createDate(hour: 13, minute: 45) {
                    return(Passing_EF_M)
                }
                else if currentDate >= createDate(hour: 13, minute: 45) && currentDate < createDate(hour: 15, minute: 00) {
                    return(FBlock_M)
                }
                else if currentDate >= createDate(hour: 15, minute: 00) && currentDate < createDate(hour: 15, minute: 30) {
                    return(Open)
                }
                else {
                    return(NoClass)
                }
            case .tuesday:
                if currentDate >= createDate(hour: 07, minute: 00) && currentDate < createDate(hour: 08, minute: 30) {
                    return(Preclass_T)
                }
                else if currentDate >= createDate(hour: 08, minute: 30) && currentDate < createDate(hour: 09, minute: 45) {
                    return(CBlock_T)
                }
                else if currentDate >= createDate(hour: 09, minute: 45) && currentDate < createDate(hour: 10, minute: 00) {
                    return(Passing_CD_T)
                }
                else if currentDate >= createDate(hour: 10, minute: 00) && currentDate < createDate(hour: 11, minute: 15) {
                    return(DBlock_T)
                }
                else if currentDate >= createDate(hour: 11, minute: 15) && currentDate < createDate(hour: 11, minute: 45) {
                    return(Mtg)
                }
                else if currentDate >= createDate(hour: 11, minute: 45) && currentDate < createDate(hour: 12, minute: 15) {
                    return(Lunch_T)
                }
                else if currentDate >= createDate(hour: 12, minute: 15) && currentDate < createDate(hour: 13, minute: 30) {
                    return(GBlock_T)
                }
                else if currentDate >= createDate(hour: 13, minute: 30) && currentDate < createDate(hour: 13, minute: 45) {
                    return(Passing_GH_T)
                }
                else if currentDate >= createDate(hour: 13, minute: 45) && currentDate < createDate(hour: 15, minute: 00) {
                    return(HBlock_T)
                }
                else if currentDate >= createDate(hour: 15, minute: 00) && currentDate < createDate(hour: 15, minute: 30) {
                    return(Open)
                }
                else {
                    return(NoClass)
                }
            case .wednesday:
                if currentDate >= createDate(hour: 07, minute: 00) && currentDate < createDate(hour: 08, minute: 30) {
                    return(Preclass_W)
                }
                else if currentDate >= createDate(hour: 08, minute: 30) && currentDate < createDate(hour: 09, minute: 30) {
                    return(Assessment1_W)
                }
                else if currentDate >= createDate(hour: 09, minute: 30) && currentDate < createDate(hour: 9, minute: 35) {
                    return(Passing_Assessment1Advising_W)
                }
                else if currentDate >= createDate(hour: 09, minute: 35) && currentDate < createDate(hour: 10, minute: 25) {
                    return(Advising_W)
                }
                else if currentDate >= createDate(hour: 10, minute: 25) && currentDate < createDate(hour: 10, minute: 30) {
                    return(Passing_AdvisingCommon_W)
                }
                else if currentDate >= createDate(hour: 10, minute: 30) && currentDate < createDate(hour: 11, minute: 20) {
                    return(Common_W)
                }
                else if currentDate >= createDate(hour: 11, minute: 20) && currentDate < createDate(hour: 12, minute: 15) {
                    return(Lunch_W)
                }
                else if currentDate >= createDate(hour: 12, minute: 15) && currentDate < createDate(hour: 13, minute: 15) {
                    return(Assessment2_W)
                }
                else if currentDate >= createDate(hour: 13, minute: 15) && currentDate < createDate(hour: 13, minute: 20) {
                    return(Passing_Assessment2Compass_W)
                }
                else if currentDate >= createDate(hour: 13, minute: 20) && currentDate < createDate(hour: 14, minute: 10) {
                    return(Compass_W)
                }
                else if currentDate >= createDate(hour: 14, minute: 10) && currentDate < createDate(hour: 14, minute: 15) {
                    return(Passing_CompassFacCollab_W)
                }
                else if currentDate >= createDate(hour: 14, minute: 15) && currentDate < createDate(hour: 15, minute: 30) {
                    return(FacCollab_W)
                }
                else {
                    return(NoClass)
                }
            case .thursday:
                if currentDate >= createDate(hour: 07, minute: 00) && currentDate < createDate(hour: 08, minute: 30) {
                    return(Preclass_R)
                }
                else if currentDate >= createDate(hour: 08, minute: 30) && currentDate < createDate(hour: 09, minute: 45) {
                    return(BBlock_R)
                }
                else if currentDate >= createDate(hour: 09, minute: 45) && currentDate < createDate(hour: 10, minute: 00) {
                    return(Passing_BA_R)
                }
                else if currentDate >= createDate(hour: 10, minute: 00) && currentDate < createDate(hour: 11, minute: 15) {
                    return(ABlock_R)
                }
                else if currentDate >= createDate(hour: 11, minute: 15) && currentDate < createDate(hour: 11, minute: 45) {
                    return(Mtg)
                }
                else if currentDate >= createDate(hour: 11, minute: 45) && currentDate < createDate(hour: 12, minute: 15) {
                    return(Lunch_R)
                }
                else if currentDate >= createDate(hour: 12, minute: 15) && currentDate < createDate(hour: 13, minute: 30) {
                    return(FBlock_R)
                }
                else if currentDate >= createDate(hour: 13, minute: 30) && currentDate < createDate(hour: 13, minute: 45) {
                    return(Passing_FE_R)
                }
                else if currentDate >= createDate(hour: 13, minute: 45) && currentDate < createDate(hour: 15, minute: 00) {
                    return(EBlock_R)
                }
                else if currentDate >= createDate(hour: 15, minute: 00) && currentDate < createDate(hour: 15, minute: 30) {
                    return(Open)
                }
                else {
                    return(NoClass)
                }
            case .friday:
                if currentDate >= createDate(hour: 07, minute: 00) && currentDate < createDate(hour: 08, minute: 30) {
                    return(Preclass_F)
                }
                else if currentDate >= createDate(hour: 08, minute: 30) && currentDate < createDate(hour: 09, minute: 45) {
                    return(DBlock_F)
                }
                else if currentDate >= createDate(hour: 09, minute: 45) && currentDate < createDate(hour: 10, minute: 00) {
                    return(Passing_DC_F)
                }
                else if currentDate >= createDate(hour: 10, minute: 00) && currentDate < createDate(hour: 11, minute: 15) {
                    return(CBlock_F)
                }
                else if currentDate >= createDate(hour: 11, minute: 15) && currentDate < createDate(hour: 11, minute: 45) {
                    return(Mtg)
                }
                else if currentDate >= createDate(hour: 11, minute: 45) && currentDate < createDate(hour: 12, minute: 15) {
                    return(Lunch_F)
                }
                else if currentDate >= createDate(hour: 12, minute: 15) && currentDate < createDate(hour: 13, minute: 30) {
                    return(HBlock_F)
                }
                else if currentDate >= createDate(hour: 13, minute: 30) && currentDate < createDate(hour: 13, minute: 45) {
                    return(Passing_HG_F)
                }
                else if currentDate >= createDate(hour: 13, minute: 45) && currentDate < createDate(hour: 15, minute: 00) {
                    return(GBlock_F)
                }
                else if currentDate >= createDate(hour: 15, minute: 00) && currentDate < createDate(hour: 15, minute: 30) {
                    return(Open)
                }
                else {
                    return(NoClass)
                }
            default:
                return(NoClass)
        }
    }
}
