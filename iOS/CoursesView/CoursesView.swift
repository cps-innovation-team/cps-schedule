//  CoursesView.swift
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
    
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "ATeacherKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "BTeacherKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "CTeacherKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "DTeacherKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "ETeacherKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "FTeacherKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "GTeacherKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "HTeacherKey")
    
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

func OtherReset() {
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "AdvisorTeacherKey")
    
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "AdvisingNameKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "AssemblyNameKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "CompassNameKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "CommonNameKey")
    
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "AdvisingRoomKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "AssemblyRoomKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "CompassRoomKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "CommonRoomKey")
    
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "AdvisingColorKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "AssemblyColorKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "CompassColorKey")
    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.removeObject(forKey: "CommonColorKey")
}

struct BlockResetRow: View {
    @State private var showingAlert = false
    var ipados: Bool
    
    var body: some View {
        Button(action: {
            self.showingAlert = true
        }) {
            if ipados {
                Label {
                    Text("Reset Blocks")
                        .foregroundColor(.red)
                } icon: {
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                }
            } else {
                Label {
                    Text("Reset Blocks")
                        .foregroundColor(.red)
                } icon: {
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                }
            }
        }
        .alert(isPresented:$showingAlert) {
            Alert(title: Text("Reset Blocks"), message: Text("All customized course blocks will be reset."), primaryButton: .destructive(Text("Reset")) {
                BlockReset()
            }, secondaryButton: .cancel(Text("Cancel")))
        }
    }
}

struct OtherResetRow: View {
    @State private var showingAlert = false
    var ipados: Bool
    
    var body: some View {
        Button(action: {
            self.showingAlert = true
        }) {
            if ipados {
                Label {
                    Text("Reset Community")
                        .foregroundColor(.red)
                } icon: {
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                }
            } else {
                Label {
                    Text("Reset Community")
                        .foregroundColor(.red)
                } icon: {
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                }
            }
        }
        .alert(isPresented:$showingAlert) {
            Alert(title: Text("Reset Community"), message: Text("All customized community blocks will be reset."), primaryButton: .destructive(Text("Reset")) {
                OtherReset()
            }, secondaryButton: .cancel(Text("Cancel")))
        }
    }
}

struct CourseView: View {
    
    @Binding var authenticated: Bool
    @Binding var clubsArray: [EventCalModel.Item]
    @Binding var sportsArray: [EventCalModel.Item]
    @Binding var qlArray: [Entry]
    
    @State var AColorKey = Color(UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AColorKey") ?? systemA)
    @AppStorage("ANameKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var ANameKey: String = "A-Block"
    @AppStorage("ARoomKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var ARoomKey: String = ""
    @AppStorage("ATeacherKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var ATeacherKey: String = ""
    @AppStorage("AFreeKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var AFreeKey: Bool = false
    @State var Apickervalue = mainPickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AColorKey") ?? systemGray)
    @State var Acolorvalue = pickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AColorKey") ?? systemA)
    
    @State var BColorKey = Color(UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "BColorKey") ?? systemB)
    @AppStorage("BNameKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var BNameKey: String = "B-Block"
    @AppStorage("BRoomKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var BRoomKey: String = ""
    @AppStorage("BTeacherKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var BTeacherKey: String = ""
    @AppStorage("BFreeKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var BFreeKey: Bool = false
    @State var Bpickervalue = mainPickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "BColorKey") ?? systemGray)
    @State var Bcolorvalue = pickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "BColorKey") ?? systemB)
    
    @State var CColorKey = Color(UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CColorKey") ?? systemC)
    @AppStorage("CNameKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var CNameKey: String = "C-Block"
    @AppStorage("CRoomKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var CRoomKey: String = ""
    @AppStorage("CTeacherKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var CTeacherKey: String = ""
    @AppStorage("CFreeKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var CFreeKey: Bool = false
    @State var Cpickervalue = mainPickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CColorKey") ?? systemGray)
    @State var Ccolorvalue = pickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CColorKey") ?? systemC)
    
    @State var DColorKey = Color(UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "DColorKey") ?? systemD)
    @AppStorage("DNameKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var DNameKey: String = "D-Block"
    @AppStorage("DRoomKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var DRoomKey: String = ""
    @AppStorage("DTeacherKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var DTeacherKey: String = ""
    @AppStorage("DFreeKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var DFreeKey: Bool = false
    @State var Dpickervalue = mainPickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "DColorKey") ?? systemGray)
    @State var Dcolorvalue = pickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "DColorKey") ?? systemD)
    
    @State var EColorKey = Color(UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "EColorKey") ?? systemE)
    @AppStorage("ENameKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var ENameKey: String = "E-Block"
    @AppStorage("ERoomKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var ERoomKey: String = ""
    @AppStorage("ETeacherKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var ETeacherKey: String = ""
    @AppStorage("EFreeKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var EFreeKey: Bool = false
    @State var Epickervalue = mainPickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "EColorKey") ?? systemGray)
    @State var Ecolorvalue = pickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "EColorKey") ?? systemE)
    
    @State var FColorKey = Color(UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "FColorKey") ?? systemF)
    @AppStorage("FNameKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var FNameKey: String = "F-Block"
    @AppStorage("FRoomKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var FRoomKey: String = ""
    @AppStorage("FTeacherKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var FTeacherKey: String = ""
    @AppStorage("FFreeKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var FFreeKey: Bool = false
    @State var Fpickervalue = mainPickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "FColorKey") ?? systemGray)
    @State var Fcolorvalue = pickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "FColorKey") ?? systemF)
    
    @State var GColorKey = Color(UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "GColorKey") ?? systemG)
    @AppStorage("GNameKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var GNameKey: String = "G-Block"
    @AppStorage("GRoomKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var GRoomKey: String = ""
    @AppStorage("GTeacherKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var GTeacherKey: String = ""
    @AppStorage("GFreeKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var GFreeKey: Bool = false
    @State var Gpickervalue = mainPickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "GColorKey") ?? systemGray)
    @State var Gcolorvalue = pickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "GColorKey") ?? systemG)
    
    @State var HColorKey = Color(UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "HColorKey") ?? systemH)
    @AppStorage("HNameKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var HNameKey: String = "H-Block"
    @AppStorage("HRoomKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var HRoomKey: String = ""
    @AppStorage("HTeacherKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var HTeacherKey: String = ""
    @AppStorage("HFreeKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var HFreeKey: Bool = false
    @State var Hpickervalue = mainPickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "HColorKey") ?? systemGray)
    @State var Hcolorvalue = pickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "HColorKey") ?? systemH)
    
    
    @State var AdvisingColorKey = Color(UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AdvisingColorKey") ?? systemTeal)
    @AppStorage("AdvisingNameKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var AdvisingNameKey: String = "Advising"
    @AppStorage("AdvisingRoomKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var AdvisingRoomKey: String = ""
    @AppStorage("AdvisingTeacherKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var AdvisingTeacherKey: String = ""
    @AppStorage("AdvisingFreeKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var AdvisingFreeKey: Bool = false
    @State var Advisingpickervalue = mainPickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AdvisingColorKey") ?? systemGray)
    @State var Advisingcolorvalue = pickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AdvisingColorKey") ?? systemTeal)
    
    @State var AssemblyColorKey = Color(UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AssemblyColorKey") ?? systemTeal)
    @AppStorage("AssemblyNameKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var AssemblyNameKey: String = "Assembly"
    @AppStorage("AssemblyRoomKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var AssemblyRoomKey: String = ""
    @AppStorage("AssemblyTeacherKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var AssemblyTeacherKey: String = ""
    @AppStorage("AssemblyFreeKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var AssemblyFreeKey: Bool = false
    @State var Assemblypickervalue = mainPickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AssemblyColorKey") ?? systemGray)
    @State var Assemblycolorvalue = pickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AssemblyColorKey") ?? systemTeal)
    
    @State var CompassColorKey = Color(UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CompassColorKey") ?? systemTeal)
    @AppStorage("CompassNameKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var CompassNameKey: String = "Compass"
    @AppStorage("CompassRoomKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var CompassRoomKey: String = ""
    @AppStorage("CompassTeacherKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var CompassTeacherKey: String = ""
    @AppStorage("CompassFreeKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var CompassFreeKey: Bool = false
    @State var Compasspickervalue = mainPickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CompassColorKey") ?? systemGray)
    @State var Compasscolorvalue = pickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CompassColorKey") ?? systemTeal)
    
    @State var CommonColorKey = Color(UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CommonColorKey") ?? systemTeal)
    @AppStorage("CommonNameKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var CommonNameKey: String = "Common Classroom"
    @AppStorage("CommonRoomKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var CommonRoomKey: String = ""
    @AppStorage("CommonTeacherKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var CommonTeacherKey: String = ""
    @AppStorage("CommonFreeKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var CommonFreeKey: Bool = false
    @State var Commonpickervalue = mainPickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CommonColorKey") ?? systemGray)
    @State var Commoncolorvalue = pickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CommonColorKey") ?? systemTeal)
    
    @State var showAuthSheet = false
    
    var body: some View {
        NavigationView {
            List {
                Section (header: Text("GENERAL")) {
                    if authenticated == true {
                        Label {
                            Text("Authenticated")
                                .foregroundColor(.green)
                        } icon: {
                            Image(systemName: "checkmark.seal")
                                .foregroundColor(.green)
                        }
                    } else {
                        Button(action: {
                            showAuthSheet = true
                        }) {
                            Label {
                                Text("Authenticate")
                                    .foregroundColor(.blue)
                            } icon: {
                                Image(systemName: "seal")
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                }
                Section (header: Text("COURSES")) {
                    NavigationLink(destination: CourseDetailView(supportFreePeriod: true, supportTeacher: true, title: "A-Block", colorkey: "AColorKey", color: $AColorKey, name: $ANameKey, room: $ARoomKey, teacher: $ATeacherKey, freePeriodStatus: $AFreeKey, pickervalue: $Apickervalue, colorvalue: $Acolorvalue)) {
                        Label("A-Block", systemImage: "book.closed")
                    }
                    NavigationLink(destination: CourseDetailView(supportFreePeriod: true, supportTeacher: true, title: "B-Block", colorkey: "BColorKey", color: $BColorKey, name: $BNameKey, room: $BRoomKey, teacher: $BTeacherKey, freePeriodStatus: $BFreeKey, pickervalue: $Bpickervalue, colorvalue: $Bcolorvalue)) {
                        Label("B-Block", systemImage: "book.closed")
                    }
                    NavigationLink(destination: CourseDetailView(supportFreePeriod: true, supportTeacher: true, title: "C-Block", colorkey: "CColorKey", color: $CColorKey, name: $CNameKey, room: $CRoomKey, teacher: $CTeacherKey, freePeriodStatus: $CFreeKey, pickervalue: $Cpickervalue, colorvalue: $Ccolorvalue)) {
                        Label("C-Block", systemImage: "book.closed")
                    }
                    NavigationLink(destination: CourseDetailView(supportFreePeriod: true, supportTeacher: true, title: "D-Block", colorkey: "DColorKey", color: $DColorKey, name: $DNameKey, room: $DRoomKey, teacher: $DTeacherKey, freePeriodStatus: $DFreeKey, pickervalue: $Dpickervalue, colorvalue: $Dcolorvalue)) {
                        Label("D-Block", systemImage: "book.closed")
                    }
                    NavigationLink(destination: CourseDetailView(supportFreePeriod: true, supportTeacher: true, title: "E-Block", colorkey: "EColorKey", color: $EColorKey, name: $ENameKey, room: $ERoomKey, teacher: $ETeacherKey, freePeriodStatus: $EFreeKey, pickervalue: $Epickervalue, colorvalue: $Ecolorvalue)) {
                        Label("E-Block", systemImage: "book.closed")
                    }
                    NavigationLink(destination: CourseDetailView(supportFreePeriod: true, supportTeacher: true, title: "F-Block", colorkey: "FColorKey", color: $FColorKey, name: $FNameKey, room: $FRoomKey, teacher: $FTeacherKey, freePeriodStatus: $FFreeKey, pickervalue: $Fpickervalue, colorvalue: $Fcolorvalue)) {
                        Label("F-Block", systemImage: "book.closed")
                    }
                    NavigationLink(destination: CourseDetailView(supportFreePeriod: true, supportTeacher: true, title: "G-Block", colorkey: "GColorKey", color: $GColorKey, name: $GNameKey, room: $GRoomKey, teacher: $GTeacherKey, freePeriodStatus: $GFreeKey, pickervalue: $Gpickervalue, colorvalue: $Gcolorvalue)) {
                        Label("G-Block", systemImage: "book.closed")
                    }
                    NavigationLink(destination: CourseDetailView(supportFreePeriod: true, supportTeacher: true, title: "H-Block", colorkey: "HColorKey", color: $HColorKey, name: $HNameKey, room: $HRoomKey, teacher: $HTeacherKey, freePeriodStatus: $HFreeKey, pickervalue: $Hpickervalue, colorvalue: $Hcolorvalue)) {
                        Label("H-Block", systemImage: "book.closed")
                    }
                }
                Section (header: Text("COMMUNITY")){
                    NavigationLink(destination: CourseDetailView(supportFreePeriod: false, supportTeacher: false, title: "Assembly", colorkey: "AssemblyColorKey", color: $AssemblyColorKey, name: $AssemblyNameKey, room: $AssemblyRoomKey, teacher: $AssemblyTeacherKey, freePeriodStatus: $AssemblyFreeKey, pickervalue: $Assemblypickervalue, colorvalue: $Assemblycolorvalue)) {
                        Label("Assembly", systemImage: "megaphone")
                    }
                    NavigationLink(destination: CourseDetailView(supportFreePeriod: false, supportTeacher: true, title: "Advising", colorkey: "AdvisingColorKey", color: $AdvisingColorKey, name: $AdvisingNameKey, room: $AdvisingRoomKey, teacher: $AdvisingTeacherKey, freePeriodStatus: $AdvisingFreeKey, pickervalue: $Advisingpickervalue, colorvalue: $Advisingcolorvalue)) {
                        Label("Advising", systemImage: "person")
                    }
                    NavigationLink(destination: CourseDetailView(supportFreePeriod: false, supportTeacher: false, title: "Common Classroom", colorkey: "CommonColorKey", color: $CommonColorKey, name: $CommonNameKey, room: $CommonRoomKey, teacher: $CommonTeacherKey, freePeriodStatus: $CommonFreeKey, pickervalue: $Commonpickervalue, colorvalue: $Commoncolorvalue)) {
                        Label("Common Classroom", systemImage: "person")
                    }
                    NavigationLink(destination: CourseDetailView(supportFreePeriod: false, supportTeacher: false, title: "Compass", colorkey: "CompassColorKey", color: $CompassColorKey, name: $CompassNameKey, room: $CompassRoomKey, teacher: $CompassTeacherKey, freePeriodStatus: $CompassFreeKey, pickervalue: $Compasspickervalue, colorvalue: $Compasscolorvalue)) {
                        Label("Compass", systemImage: "person")
                    }
                }
                Section {
                    BlockResetRow(ipados: false)
                    OtherResetRow(ipados: false)
                }
            }.listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Settings")
        }.sheet(isPresented: $showAuthSheet, content: {
            AuthView(authenticated: $authenticated, clubsArray: $clubsArray, sportsArray: $sportsArray, qlArray: $qlArray)
        })
    }
}
