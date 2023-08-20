//
//  Now_WidgetVM.swift
//  Schedule (iOS)
//
//  Created by Rahim Malik on 1/25/21.
//  Copyright © 2021 Rahim Malik. All rights reserved.
//

import SwiftUI

func widgetModel(weekofyear: Int, currentDate: Date, sizebool: Bool) -> [NowClass] {
    
    //MARK: Monday
    _ = NowClass(startBlockDate: createDate(hour: 8, minute: 30), currentBlockName: "No Class",
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
    
    _ = NowClass(startBlockDate: createDate(hour: 9, minute: 45), currentBlockName: "Passing",
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
    
    _ = NowClass(startBlockDate: createDate(hour: 13, minute: 30), currentBlockName: "Passing",
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
    _ = NowClass(startBlockDate: createDate(hour: 8, minute: 30), currentBlockName: "No Class",
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
    
    _ = NowClass(startBlockDate: createDate(hour: 9, minute: 45), currentBlockName: "Passing",
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
    
    _ = NowClass(startBlockDate: createDate(hour: 13, minute: 30), currentBlockName: "Passing",
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
    _ = NowClass(startBlockDate: createDate(hour: 8, minute: 30), currentBlockName: "No Class",
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
    
    _ = NowClass(startBlockDate: createDate(hour: 9, minute: 30), currentBlockName: "Passing",
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
    
    _ = NowClass(startBlockDate: createDate(hour: 10, minute: 25), currentBlockName: "Passing",
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
    
    _ = NowClass(startBlockDate: createDate(hour: 13, minute: 15), currentBlockName: "Passing",
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
    
    _ = NowClass(startBlockDate: createDate(hour: 2, minute: 10), currentBlockName: "Passing",
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
    
    let FacCollab_W = NowClass(startBlockDate: createDate(hour: 2, minute: 15), currentBlockName: ("Faculty Collaboration"),
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
    _ = NowClass(startBlockDate: createDate(hour: 8, minute: 30), currentBlockName: "No Class",
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
    
    _ = NowClass(startBlockDate: createDate(hour: 9, minute: 45), currentBlockName: "Passing",
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
    
    _ = NowClass(startBlockDate: createDate(hour: 13, minute: 30), currentBlockName: "Passing",
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
    _ = NowClass(startBlockDate: createDate(hour: 8, minute: 30), currentBlockName: "No Class",
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
    
    _ = NowClass(startBlockDate: createDate(hour: 9, minute: 45), currentBlockName: "Passing",
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
    
    _ = NowClass(startBlockDate: createDate(hour: 13, minute: 30), currentBlockName: "Passing",
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
    _ = NowClass(startBlockDate: createDate(hour: 8, minute: 30), currentBlockName: "No Class",
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
    
    _ = NowClass(startBlockDate: createDate(hour: 9, minute: 40), currentBlockName: "Passing",
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
    
    _ = NowClass(startBlockDate: createDate(hour: 13, minute: 35), currentBlockName: "Passing",
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
    _ = NowClass(startBlockDate: createDate(hour: 8, minute: 30), currentBlockName: "No Class",
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
    
    _ = NowClass(startBlockDate: createDate(hour: 9, minute: 40), currentBlockName: "Passing",
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
    
    _ = NowClass(startBlockDate: createDate(hour: 13, minute: 35), currentBlockName: "Passing",
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
    _ = NowClass(startBlockDate: createDate(hour: 8, minute: 30), currentBlockName: "No Class",
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
    
    _ = NowClass(startBlockDate: createDate(hour: 9, minute: 40), currentBlockName: "Passing",
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
    
    _ = NowClass(startBlockDate: createDate(hour: 13, minute: 35), currentBlockName: "Passing",
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
    _ = NowClass(startBlockDate: createDate(hour: 8, minute: 30), currentBlockName: "No Class",
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
    
    _ = NowClass(startBlockDate: createDate(hour: 9, minute: 40), currentBlockName: "Passing",
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
    
    _ = NowClass(startBlockDate: createDate(hour: 13, minute: 35), currentBlockName: "Passing",
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
    
    _ = NowClass(startBlockDate: Date(), currentBlockName: "No Class", currentBlockTime: "", currentBlockDate: Date(), currentBlockColor: systemAbsence, currentBlockTeacher: "", currentBlockRoom: "", nextBlockName: "No Class", nextBlockTime: "", nextBlockDate: Date(), nextBlockColor: systemAbsence, nextBlockTeacher: "", nextBlockRoom: "")
    
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
                if sizebool {
                    if currentDate >= createDate(hour: 1, minute: 00) && currentDate < createDate(hour: 15, minute: 30) {
                        return([ABlock_M, BBlock_M, Assembly_M, Lunch_M, EBlock_M, FBlock_M, Open])
                    }
                    else {
                        return([])
                    }
                } else {
                    if currentDate >= createDate(hour: 1, minute: 00) && currentDate < createDate(hour: 11, minute: 45) {
                        return([ABlock_M, BBlock_M, Assembly_M, Lunch_M])
                    }
                    else if currentDate >= createDate(hour: 11, minute: 45) && currentDate < createDate(hour: 15, minute: 30) {
                        return([Lunch_M, EBlock_M, FBlock_M, Open])
                    }
                    else {
                        return([])
                    }
                }
            case .friday:
                if sizebool {
                    if currentDate >= createDate(hour: 1, minute: 00) && currentDate < createDate(hour: 15, minute: 30) {
                        return([CBlock_T, DBlock_T, Mtg, Lunch_T, GBlock_T, HBlock_T, Open])
                    }
                    else {
                        return([])
                    }
                } else {
                    if currentDate >= createDate(hour: 1, minute: 00) && currentDate < createDate(hour: 11, minute: 45) {
                        return([CBlock_T, DBlock_T, Mtg, Lunch_T])
                    }
                    else if currentDate >= createDate(hour: 11, minute: 45) && currentDate < createDate(hour: 15, minute: 30) {
                        return([Lunch_T, GBlock_T, HBlock_T, Open])
                    }
                    else {
                        return([])
                    }
                }
            default:
                return([])
        }
    }
    else if weekofyear == 4 || weekofyear == 8 {
        switch weekdayEnum {
            case .tuesday:
                if sizebool {
                    if currentDate >= createDate(hour: 1, minute: 00) && currentDate < createDate(hour: 15, minute: 30) {
                        return([ABlock_MS, BBlock_MS, Assembly_MS, Lunch_MS, EBlock_MS, FBlock_MS, Open])
                    }
                    else {
                        return([])
                    }
                } else {
                    if currentDate >= createDate(hour: 1, minute: 00) && currentDate < createDate(hour: 11, minute: 35) {
                        return([ABlock_MS, BBlock_MS, Assembly_MS, Lunch_MS])
                    }
                    else if currentDate >= createDate(hour: 11, minute: 35) && currentDate < createDate(hour: 15, minute: 30) {
                        return([Lunch_MS, EBlock_MS, FBlock_MS, Open])
                    }
                    else {
                        return([])
                    }
                }
            case .wednesday:
                if sizebool {
                    if currentDate >= createDate(hour: 1, minute: 00) && currentDate < createDate(hour: 15, minute: 30) {
                        return([CBlock_TS, DBlock_TS, Compass_TS, Lunch_TS, GBlock_TS, HBlock_TS, Open])
                    }
                    else {
                        return([])
                    }
                } else {
                    if currentDate >= createDate(hour: 1, minute: 00) && currentDate < createDate(hour: 11, minute: 55) {
                        return([CBlock_TS, DBlock_TS, Compass_TS, Lunch_TS])
                    }
                    else if currentDate >= createDate(hour: 11, minute: 55) && currentDate < createDate(hour: 15, minute: 30) {
                        return([Lunch_TS, GBlock_TS, HBlock_TS, Open])
                    }
                    else {
                        return([])
                    }
                }
            case .thursday:
                if sizebool {
                    if currentDate >= createDate(hour: 1, minute: 00) && currentDate < createDate(hour: 15, minute: 30) {
                        return([BBlock_RS, ABlock_RS, Mtg_RS, Lunch_RS, FBlock_RS, EBlock_RS, Open])
                    }
                    else {
                        return([])
                    }
                } else {
                    if currentDate >= createDate(hour: 1, minute: 00) && currentDate < createDate(hour: 11, minute: 35) {
                        return([BBlock_RS, ABlock_RS, Mtg_RS, Lunch_RS])
                    }
                    else if currentDate >= createDate(hour: 11, minute: 35) && currentDate < createDate(hour: 15, minute: 30) {
                        return([Lunch_RS, FBlock_RS, EBlock_RS, Open])
                    }
                    else {
                        return([])
                    }
                }
            case .friday:
                if sizebool {
                    if currentDate >= createDate(hour: 1, minute: 00) && currentDate < createDate(hour: 15, minute: 30) {
                        return([DBlock_FS, CBlock_FS, Advising_FS, Lunch_FS, HBlock_FS, GBlock_FS, Open])
                    }
                    else {
                        return([])
                    }
                } else {
                    if currentDate >= createDate(hour: 1, minute: 00) && currentDate < createDate(hour: 11, minute: 35) {
                        return([DBlock_FS, CBlock_FS, Advising_FS, Lunch_FS])
                    }
                    else if currentDate >= createDate(hour: 11, minute: 35) && currentDate < createDate(hour: 15, minute: 30) {
                        return([Lunch_FS, HBlock_FS, GBlock_FS, Open])
                    }
                    else {
                        return([])
                    }
                }
            default:
                return([])
        }
    }
    else if weekofyear == 5 {
        switch weekdayEnum {
            case .monday:
                if sizebool {
                    if currentDate >= createDate(hour: 1, minute: 00) && currentDate < createDate(hour: 15, minute: 30) {
                        return([ABlock_M, BBlock_M, Assembly_M, Lunch_M, EBlock_M, FBlock_M, Open])
                    }
                    else {
                        return([])
                    }
                } else {
                    if currentDate >= createDate(hour: 1, minute: 00) && currentDate < createDate(hour: 11, minute: 45) {
                        return([ABlock_M, BBlock_M, Assembly_M, Lunch_M])
                    }
                    else if currentDate >= createDate(hour: 11, minute: 45) && currentDate < createDate(hour: 15, minute: 30) {
                        return([Lunch_M, EBlock_M, FBlock_M, Open])
                    }
                    else {
                        return([])
                    }
                }
            case .tuesday:
                if sizebool {
                    if currentDate >= createDate(hour: 1, minute: 00) && currentDate < createDate(hour: 15, minute: 30) {
                        return([CBlock_T, DBlock_T, Mtg, Lunch_T, GBlock_T, HBlock_T, Open])
                    }
                    else {
                        return([])
                    }
                } else {
                    if currentDate >= createDate(hour: 1, minute: 00) && currentDate < createDate(hour: 11, minute: 45) {
                        return([CBlock_T, DBlock_T, Mtg, Lunch_T])
                    }
                    else if currentDate >= createDate(hour: 11, minute: 45) && currentDate < createDate(hour: 15, minute: 30) {
                        return([Lunch_T, GBlock_T, HBlock_T, Open])
                    }
                    else {
                        return([])
                    }
                }
            case .thursday:
                if sizebool {
                    if currentDate >= createDate(hour: 1, minute: 00) && currentDate < createDate(hour: 15, minute: 30) {
                        return([BBlock_R, ABlock_R, Mtg, Lunch_R, FBlock_R, EBlock_R, Open])
                    }
                    else {
                        return([])
                    }
                } else {
                    if currentDate >= createDate(hour: 1, minute: 00) && currentDate < createDate(hour: 11, minute: 45) {
                        return([BBlock_R, ABlock_R, Mtg, Lunch_R])
                    }
                    else if currentDate >= createDate(hour: 11, minute: 45) && currentDate < createDate(hour: 15, minute: 30) {
                        return([Lunch_R, FBlock_R, EBlock_R, Open])
                    }
                    else {
                        return([])
                    }
                }
            case .friday:
                if sizebool {
                    if currentDate >= createDate(hour: 1, minute: 00) && currentDate < createDate(hour: 15, minute: 30) {
                        return([BBlock_R, ABlock_R, Mtg, Lunch_R, FBlock_R, EBlock_R, Open])
                    }
                    else {
                        return([])
                    }
                } else {
                    if currentDate >= createDate(hour: 1, minute: 00) && currentDate < createDate(hour: 11, minute: 45) {
                        return([DBlock_F, CBlock_F, Mtg, Lunch_F])
                    }
                    else if currentDate >= createDate(hour: 11, minute: 45) && currentDate < createDate(hour: 15, minute: 30) {
                        return([Lunch_F, HBlock_F, GBlock_F, Open])
                    }
                    else {
                        return([])
                    }
                }
            default:
                return([])
        }
    }
    else if weekofyear == 12 || weekofyear == 22 {
        switch weekdayEnum {
            case .monday:
                if sizebool {
                    if currentDate >= createDate(hour: 1, minute: 00) && currentDate < createDate(hour: 15, minute: 30) {
                        return([ABlock_MS, BBlock_MS, Assembly_MS, Lunch_MS, EBlock_MS, FBlock_MS, Open])
                    }
                    else {
                        return([])
                    }
                } else {
                    if currentDate >= createDate(hour: 1, minute: 00) && currentDate < createDate(hour: 11, minute: 35) {
                        return([ABlock_MS, BBlock_MS, Assembly_MS, Lunch_MS])
                    }
                    else if currentDate >= createDate(hour: 11, minute: 35) && currentDate < createDate(hour: 15, minute: 30) {
                        return([Lunch_MS, EBlock_MS, FBlock_MS, Open])
                    }
                    else {
                        return([])
                    }
                }
            case .tuesday:
                if sizebool {
                    if currentDate >= createDate(hour: 1, minute: 00) && currentDate < createDate(hour: 15, minute: 30) {
                        return([CBlock_TS, DBlock_TS, Compass_TS, Lunch_TS, GBlock_TS, HBlock_TS, Open])
                    }
                    else {
                        return([])
                    }
                } else {
                    if currentDate >= createDate(hour: 1, minute: 00) && currentDate < createDate(hour: 11, minute: 55) {
                        return([CBlock_TS, DBlock_TS, Compass_TS, Lunch_TS])
                    }
                    else if currentDate >= createDate(hour: 11, minute: 55) && currentDate < createDate(hour: 15, minute: 30) {
                        return([Lunch_TS, GBlock_TS, HBlock_TS, Open])
                    }
                    else {
                        return([])
                    }
                }
            case .wednesday:
                if sizebool {
                    if currentDate >= createDate(hour: 1, minute: 00) && currentDate < createDate(hour: 15, minute: 30) {
                        return([BBlock_RS, ABlock_RS, Mtg_RS, Lunch_RS, FBlock_RS, EBlock_RS, Open])
                    }
                    else {
                        return([])
                    }
                } else {
                    if currentDate >= createDate(hour: 1, minute: 00) && currentDate < createDate(hour: 11, minute: 35) {
                        return([BBlock_RS, ABlock_RS, Mtg_RS, Lunch_RS])
                    }
                    else if currentDate >= createDate(hour: 11, minute: 35) && currentDate < createDate(hour: 15, minute: 30) {
                        return([Lunch_RS, FBlock_RS, EBlock_RS, Open])
                    }
                    else {
                        return([])
                    }
                }
            case .thursday:
                if sizebool {
                    if currentDate >= createDate(hour: 1, minute: 00) && currentDate < createDate(hour: 15, minute: 30) {
                        return([DBlock_FS, CBlock_FS, Advising_FS, Lunch_FS, HBlock_FS, GBlock_FS, Open])
                    }
                    else {
                        return([])
                    }
                } else {
                    if currentDate >= createDate(hour: 1, minute: 00) && currentDate < createDate(hour: 11, minute: 35) {
                        return([DBlock_FS, CBlock_FS, Advising_FS, Lunch_FS])
                    }
                    else if currentDate >= createDate(hour: 11, minute: 35) && currentDate < createDate(hour: 15, minute: 30) {
                        return([Lunch_FS, HBlock_FS, GBlock_FS, Open])
                    }
                    else {
                        return([])
                    }
                }
            default:
                return([])
        }
    }
    else if weekofyear == 10 || weekofyear == 15 || weekofyear > 22 {
        return([])
    }
    else {
        switch weekdayEnum {
            case .monday:
                if sizebool {
                    if currentDate >= createDate(hour: 1, minute: 00) && currentDate < createDate(hour: 15, minute: 30) {
                        return([ABlock_M, BBlock_M, Assembly_M, Lunch_M, EBlock_M, FBlock_M, Open])
                    }
                    else {
                        return([])
                    }
                } else {
                    if currentDate >= createDate(hour: 1, minute: 00) && currentDate < createDate(hour: 11, minute: 45) {
                        return([ABlock_M, BBlock_M, Assembly_M, Lunch_M])
                    }
                    else if currentDate >= createDate(hour: 11, minute: 45) && currentDate < createDate(hour: 15, minute: 30) {
                        return([Lunch_M, EBlock_M, FBlock_M, Open])
                    }
                    else {
                        return([])
                    }
                }
            case .tuesday:
                if sizebool {
                    if currentDate >= createDate(hour: 1, minute: 00) && currentDate < createDate(hour: 15, minute: 30) {
                        return([CBlock_T, DBlock_T, Mtg, Lunch_T, GBlock_T, HBlock_T, Open])
                    }
                    else {
                        return([])
                    }
                } else {
                    if currentDate >= createDate(hour: 1, minute: 00) && currentDate < createDate(hour: 11, minute: 45) {
                        return([CBlock_T, DBlock_T, Mtg, Lunch_T])
                    }
                    else if currentDate >= createDate(hour: 11, minute: 45) && currentDate < createDate(hour: 15, minute: 30) {
                        return([Lunch_T, GBlock_T, HBlock_T, Open])
                    }
                    else {
                        return([])
                    }
                }
            case .wednesday:
                if sizebool {
                    if currentDate >= createDate(hour: 1, minute: 00) && currentDate < createDate(hour: 15, minute: 30) {
                        return([Assessment1_W, Advising_W, Common_W, Lunch_W, Assessment2_W, Compass_W, FacCollab_W])
                    }
                    else {
                        return([])
                    }
                } else {
                    if currentDate >= createDate(hour: 1, minute: 00) && currentDate < createDate(hour: 11, minute: 45) {
                        return([Assessment1_W, Advising_W, Common_W, Lunch_W])
                    }
                    else if currentDate >= createDate(hour: 11, minute: 45) && currentDate < createDate(hour: 15, minute: 30) {
                        return([Lunch_T, Assessment2_W, Compass_W, FacCollab_W])
                    }
                    else {
                        return([])
                    }
                }
            case .thursday:
                if sizebool {
                    if currentDate >= createDate(hour: 1, minute: 00) && currentDate < createDate(hour: 15, minute: 30) {
                        return([BBlock_R, ABlock_R, Mtg, Lunch_R, FBlock_R, EBlock_R, Open])
                    }
                    else {
                        return([])
                    }
                } else {
                    if currentDate >= createDate(hour: 1, minute: 00) && currentDate < createDate(hour: 11, minute: 45) {
                        return([BBlock_R, ABlock_R, Mtg, Lunch_R])
                    }
                    else if currentDate >= createDate(hour: 11, minute: 45) && currentDate < createDate(hour: 15, minute: 30) {
                        return([Lunch_R, FBlock_R, EBlock_R, Open])
                    }
                    else {
                        return([])
                    }
                }
            case .friday:
                if sizebool {
                    if currentDate >= createDate(hour: 1, minute: 00) && currentDate < createDate(hour: 15, minute: 30) {
                        return([BBlock_R, ABlock_R, Mtg, Lunch_R, FBlock_R, EBlock_R, Open])
                    }
                    else {
                        return([])
                    }
                } else {
                    if currentDate >= createDate(hour: 1, minute: 00) && currentDate < createDate(hour: 11, minute: 45) {
                        return([DBlock_F, CBlock_F, Mtg, Lunch_F])
                    }
                    else if currentDate >= createDate(hour: 11, minute: 45) && currentDate < createDate(hour: 15, minute: 30) {
                        return([Lunch_F, HBlock_F, GBlock_F, Open])
                    }
                    else {
                        return([])
                    }
                }
            default:
                return([])
        }
    }
}
