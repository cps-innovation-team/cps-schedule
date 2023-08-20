//  CoursesUIView.swift
//  Schedule.app
//
//  Created by Rahim Malik on 7/11/20.
//  Copyright © 2020 Rahim Malik. All rights reserved.

import SwiftUI

func BlockReset() {
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "ANameKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "BNameKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "CNameKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "DNameKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "ENameKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "FNameKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "GNameKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "HNameKey")
    
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "ARoomKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "BRoomKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "CRoomKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "DRoomKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "ERoomKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "FRoomKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "GRoomKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "HRoomKey")
    
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "AFreeKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "BFreeKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "CFreeKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "DFreeKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "EFreeKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "FFreeKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "GFreeKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "HFreeKey")
    
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "AColorKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "BColorKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "CColorKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "DColorKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "EColorKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "FColorKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "GColorKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "HColorKey")
}

func SubjectReset() {
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "ScienceNameKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "HistoryNameKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "EnglishNameKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "MathNameKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "LanguageNameKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "ArtNameKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "DebateNameKey")
    
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "ScienceRoomKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "HistoryRoomKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "EnglishRoomKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "MathRoomKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "LanguageRoomKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "ArtRoomKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "DebateRoomKey")
    
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "ScienceFreeKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "HistoryFreeKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "EnglishFreeKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "MathFreeKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "LanguageFreeKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "ArtFreeKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "DebateFreeKey")
    
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "ScienceColorKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "HistoryColorKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "EnglishColorKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "MathColorKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "LanguageColorKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "ArtColorKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "DebateColorKey")
}

func OtherReset() {
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "AdvisingNameKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "AssemblyNameKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "XBlockNameKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "CompassNameKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "CommonNameKey")
    
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "AdvisingRoomKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "AssemblyRoomKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "XBlockRoomKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "CompassRoomKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "CommonRoomKey")
    
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "AdvisingColorKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "AssemblyColorKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "XBlockColorKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "CompassColorKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "CommonColorKey")
}
