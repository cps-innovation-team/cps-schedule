//  ViewMain.swift
//  Schedule.app
//
//  Created by Rahim Malik on 7/9/20.
//  Copyright © 2020 Rahim Malik. All rights reserved.

import SwiftUI
import WidgetKit

#if os(macOS)
func toggleSidebar() { NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)}
#endif

struct ViewMain: View {
    
    @Binding var header: String
    @State var selectedTab = TabIdentifier.dashboard
    @State var resetBlocks = true
    @State private var selection: String? = "Dashboard"
    @Binding var showAuthSheet: Bool
    @AppStorage("AuthStatus", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var authenticated: Bool = false
    @AppStorage("QLArray", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var qlArray = getQLData(input: QLFetcher())
    @AppStorage("ClubsArray", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var clubsArray = [EventCalModel.Item]()
    @AppStorage("SportsArray", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var sportsArray = [EventCalModel.Item]()
    #if os(iOS)
    @Environment(\.verticalSizeClass) var vSizeClass
    @Environment(\.horizontalSizeClass) var hSizeClass
    #endif
    
    @State private var alertItem: AlertItem? = nil
    
    var body: some View {
        #if os(macOS)
        NavigationView() {
            ViewMainmacOS(selection: $selection, authenticated: $authenticated, clubsArray: $clubsArray, sportsArray: $sportsArray, qlArray: $qlArray)
            .toolbar{
                ToolbarItem(placement: .navigation){
                    Button(action: toggleSidebar, label: {
                        Image(systemName: "sidebar.left").foregroundColor(Color("SystemToolbar")) })
                }}
            .listStyle(SidebarListStyle())
                .sheet(isPresented: $showAuthSheet, content: {
                    AuthView(authenticated: $authenticated, clubsArray: $clubsArray, sportsArray: $sportsArray, qlArray: $qlArray)
                })
        }
        .accentColor(Color("AccentColor"))
        #elseif os(iOS)
        if vSizeClass == .regular && hSizeClass == .regular {
            ViewMainiPadOS(selection: $selection, authenticated: $authenticated, clubsArray: $clubsArray, sportsArray: $sportsArray, qlArray: $qlArray)
                .sheet(isPresented: $showAuthSheet, content: {
                    AuthView(authenticated: $authenticated, clubsArray: $clubsArray, sportsArray: $sportsArray, qlArray: $qlArray)
                        .allowAutoDismiss(false)
                })
        }
        else {
            TabView(selection: $selectedTab) {
                NowView(authstatus: $authenticated, clubsArray: $clubsArray, sportsArray: $sportsArray, qlArray: $qlArray)
                    .tabItem {
                        Image(systemName: "speedometer")
                            .font(.system(size: 24, weight: .bold))
                        Text("Dashboard")
                    }
                    .tag(TabIdentifier.dashboard)
                ScheduleView(array: $qlArray)
                    .tabItem {
                        Image(systemName: "calendar")
                            .font(.system(size: 24, weight: .bold))
                        Text("Schedule")
                    }
                    .tag(TabIdentifier.schedule)
                CourseView(authenticated: $authenticated, clubsArray: $clubsArray, sportsArray: $sportsArray, qlArray: $qlArray)
                    .tabItem {
                        Image(systemName: "gear")
                            .font(.system(size: 24, weight: .bold))
                        Text("Settings")
                    }
                    .tag(TabIdentifier.courses)
            }
//            .onAppear(perform: {
//                if alertstatus {
//                    alertItem = AlertItem(title: "Universal Copy & Paste", message: "On iOS, all links or zoom rooms you tap will automatically be copied to your clipboard so that you can effortlessly paste them on your Mac.")
//                }
//                alertstatus = false
//            })
//            .alert(item: $alertItem) { alert -> Alert in
//                Alert(
//                    title: Text(alert.title),
//                    message: Text(alert.message)
//                )
//            }
            .sheet(isPresented: $showAuthSheet, content: {
                AuthView(authenticated: $authenticated, clubsArray: $clubsArray, sportsArray: $sportsArray, qlArray: $qlArray)
                    .allowAutoDismiss(false)
            })
            .onOpenURL { url in
                guard let tabIdentifier = url.tabIdentifier else {
                    return
                }
                selectedTab = tabIdentifier
            }
            .onDisappear(perform: {
                WidgetCenter.shared.reloadAllTimelines()
            })
            .accentColor(Color(accentTeal))
        }
        #endif
    }
}

enum TabIdentifier: Hashable {
    case dashboard, schedule, clubs, courses, sports
}

extension URL {
    var isDeeplink: Bool {
        return scheme == "cps-schedule"
    }
    
    var tabIdentifier: TabIdentifier? {
        guard isDeeplink else { return nil }
        
        switch host {
            case "dashboard": return .dashboard
            case "schedule": return .schedule
            case "clubs": return .clubs
            case "sports": return .sports
            case "courses": return .courses
            default: return .schedule
        }
    }
}

#if os(iOS)
struct ViewMainiPadOS: View {
    @Binding var selection: String?
    @Binding var authenticated: Bool
    @State var showAuthSheet = false
    
    @Binding var clubsArray: [EventCalModel.Item]
    @Binding var sportsArray: [EventCalModel.Item]
    @Binding var qlArray: [Entry]
    
    @State var AColorKey = Color(UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AColorKey") ?? systemBlue)
    @AppStorage("ANameKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var ANameKey: String = "A-Block"
    @AppStorage("ARoomKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var ARoomKey: String = ""
    @AppStorage("ATeacherKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var ATeacherKey: String = ""
    @AppStorage("AFreeKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var AFreeKey: Bool = false
    @State var Apickervalue = mainPickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AColorKey") ?? systemGray)
    @State var Acolorvalue = pickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AColorKey") ?? systemBlue)
    
    @State var BColorKey = Color(UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "BColorKey") ?? systemGreen)
    @AppStorage("BNameKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var BNameKey: String = "B-Block"
    @AppStorage("BRoomKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var BRoomKey: String = ""
    @AppStorage("BTeacherKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var BTeacherKey: String = ""
    @AppStorage("BFreeKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var BFreeKey: Bool = false
    @State var Bpickervalue = mainPickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "BColorKey") ?? systemGray)
    @State var Bcolorvalue = pickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "BColorKey") ?? systemGreen)
    
    @State var CColorKey = Color(UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CColorKey") ?? systemOrange)
    @AppStorage("CNameKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var CNameKey: String = "C-Block"
    @AppStorage("CRoomKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var CRoomKey: String = ""
    @AppStorage("CTeacherKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var CTeacherKey: String = ""
    @AppStorage("CFreeKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var CFreeKey: Bool = false
    @State var Cpickervalue = mainPickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CColorKey") ?? systemGray)
    @State var Ccolorvalue = pickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CColorKey") ?? systemOrange)
    
    @State var DColorKey = Color(UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "DColorKey") ?? systemIndigo)
    @AppStorage("DNameKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var DNameKey: String = "D-Block"
    @AppStorage("DRoomKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var DRoomKey: String = ""
    @AppStorage("DTeacherKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var DTeacherKey: String = ""
    @AppStorage("DFreeKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var DFreeKey: Bool = false
    @State var Dpickervalue = mainPickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "DColorKey") ?? systemGray)
    @State var Dcolorvalue = pickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "DColorKey") ?? systemIndigo)
    
    @State var EColorKey = Color(UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "EColorKey") ?? systemPurple)
    @AppStorage("ENameKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var ENameKey: String = "E-Block"
    @AppStorage("ERoomKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var ERoomKey: String = ""
    @AppStorage("ETeacherKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var ETeacherKey: String = ""
    @AppStorage("EFreeKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var EFreeKey: Bool = false
    @State var Epickervalue = mainPickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "EColorKey") ?? systemGray)
    @State var Ecolorvalue = pickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "EColorKey") ?? systemPurple)
    
    @State var FColorKey = Color(UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "FColorKey") ?? systemMagenta)
    @AppStorage("FNameKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var FNameKey: String = "F-Block"
    @AppStorage("FRoomKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var FRoomKey: String = ""
    @AppStorage("FTeacherKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var FTeacherKey: String = ""
    @AppStorage("FFreeKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var FFreeKey: Bool = false
    @State var Fpickervalue = mainPickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "FColorKey") ?? systemGray)
    @State var Fcolorvalue = pickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "FColorKey") ?? systemMagenta)
    
    @State var GColorKey = Color(UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "GColorKey") ?? systemRed)
    @AppStorage("GNameKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var GNameKey: String = "G-Block"
    @AppStorage("GRoomKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var GRoomKey: String = ""
    @AppStorage("GTeacherKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var GTeacherKey: String = ""
    @AppStorage("GFreeKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var GFreeKey: Bool = false
    @State var Gpickervalue = mainPickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "GColorKey") ?? systemGray)
    @State var Gcolorvalue = pickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "GColorKey") ?? systemRed)
    
    @State var HColorKey = Color(UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "HColorKey") ?? systemYellow)
    @AppStorage("HNameKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var HNameKey: String = "H-Block"
    @AppStorage("HRoomKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var HRoomKey: String = ""
    @AppStorage("HTeacherKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var HTeacherKey: String = ""
    @AppStorage("HFreeKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var HFreeKey: Bool = false
    @State var Hpickervalue = mainPickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "HColorKey") ?? systemGray)
    @State var Hcolorvalue = pickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "HColorKey") ?? systemYellow)
    
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
    
    var body: some View {
        NavigationView() {
            List {
                NavigationLink(destination: NowView(authstatus: $authenticated, clubsArray: $clubsArray, sportsArray: $sportsArray, qlArray: $qlArray), tag: "Dashboard", selection: $selection) {
                    Label("Dashboard", systemImage: "speedometer")
                }
                NavigationLink(destination: ScheduleView(array: $qlArray), tag: "Schedule", selection: $selection) {
                    Label("Schedule", systemImage: "calendar")
                }
                Section (header: Text("Courses").foregroundColor(Color("SystemContrast"))){
                    NavigationLink(destination: CourseDetailView(supportFreePeriod: true, supportTeacher: true, title: "A-Block", colorkey: "AColorKey", color: $AColorKey, name: $ANameKey, room: $ARoomKey, teacher: $ATeacherKey, freePeriodStatus: $AFreeKey, pickervalue: $Apickervalue, colorvalue: $Acolorvalue), tag: "A-Block", selection: $selection) {
                        Label("A-Block", systemImage: "book.closed")
                    }
                    NavigationLink(destination: CourseDetailView(supportFreePeriod: true, supportTeacher: true, title: "B-Block", colorkey: "BColorKey", color: $BColorKey, name: $BNameKey, room: $BRoomKey, teacher: $BTeacherKey, freePeriodStatus: $BFreeKey, pickervalue: $Bpickervalue, colorvalue: $Bcolorvalue), tag: "B-Block", selection: $selection) {
                        Label("B-Block", systemImage: "book.closed")
                    }
                    NavigationLink(destination: CourseDetailView(supportFreePeriod: true, supportTeacher: true, title: "C-Block", colorkey: "CColorKey", color: $CColorKey, name: $CNameKey, room: $CRoomKey, teacher: $CTeacherKey, freePeriodStatus: $CFreeKey, pickervalue: $Cpickervalue, colorvalue: $Ccolorvalue), tag: "C-Block", selection: $selection) {
                        Label("C-Block", systemImage: "book.closed")
                    }
                    NavigationLink(destination: CourseDetailView(supportFreePeriod: true, supportTeacher: true, title: "D-Block", colorkey: "DColorKey", color: $DColorKey, name: $DNameKey, room: $DRoomKey, teacher: $DTeacherKey, freePeriodStatus: $DFreeKey, pickervalue: $Dpickervalue, colorvalue: $Dcolorvalue), tag: "D-Block", selection: $selection) {
                        Label("D-Block", systemImage: "book.closed")
                    }
                    NavigationLink(destination: CourseDetailView(supportFreePeriod: true, supportTeacher: true, title: "E-Block", colorkey: "EColorKey", color: $EColorKey, name: $ENameKey, room: $ERoomKey, teacher: $ETeacherKey, freePeriodStatus: $EFreeKey, pickervalue: $Epickervalue, colorvalue: $Ecolorvalue), tag: "E-Block", selection: $selection) {
                        Label("E-Block", systemImage: "book.closed")
                    }
                    NavigationLink(destination: CourseDetailView(supportFreePeriod: true, supportTeacher: true, title: "F-Block", colorkey: "FColorKey", color: $FColorKey, name: $FNameKey, room: $FRoomKey, teacher: $FTeacherKey, freePeriodStatus: $FFreeKey, pickervalue: $Fpickervalue, colorvalue: $Fcolorvalue), tag: "F-Block", selection: $selection) {
                        Label("F-Block", systemImage: "book.closed")
                    }
                    NavigationLink(destination: CourseDetailView(supportFreePeriod: true, supportTeacher: true, title: "G-Block", colorkey: "GColorKey", color: $GColorKey, name: $GNameKey, room: $GRoomKey, teacher: $GTeacherKey, freePeriodStatus: $GFreeKey, pickervalue: $Gpickervalue, colorvalue: $Gcolorvalue), tag: "G-Block", selection: $selection) {
                        Label("G-Block", systemImage: "book.closed")
                    }
                    NavigationLink(destination: CourseDetailView(supportFreePeriod: true, supportTeacher: true, title: "H-Block", colorkey: "HColorKey", color: $HColorKey, name: $HNameKey, room: $HRoomKey, teacher: $HTeacherKey, freePeriodStatus: $HFreeKey, pickervalue: $Hpickervalue, colorvalue: $Hcolorvalue), tag: "H-Block", selection: $selection) {
                        Label("H-Block", systemImage: "book.closed")
                    }
                }
                Section (header: Text("Community").foregroundColor(Color("SystemContrast"))) {
                    NavigationLink(destination: CourseDetailView(supportFreePeriod: false, supportTeacher: false, title: "Assembly", colorkey: "AssemblyColorKey", color: $AssemblyColorKey, name: $AssemblyNameKey, room: $AssemblyRoomKey, teacher: $AssemblyTeacherKey, freePeriodStatus: $AssemblyFreeKey, pickervalue: $Assemblypickervalue, colorvalue: $Assemblycolorvalue), tag: "Assembly", selection: $selection) {
                        Label("Assembly", systemImage: "megaphone")
                    }
                    NavigationLink(destination: CourseDetailView(supportFreePeriod: false, supportTeacher: true, title: "Advising", colorkey: "AdvisingColorKey", color: $AdvisingColorKey, name: $AdvisingNameKey, room: $AdvisingRoomKey, teacher: $AdvisingTeacherKey, freePeriodStatus: $AdvisingFreeKey, pickervalue: $Advisingpickervalue, colorvalue: $Advisingcolorvalue), tag: "Advising", selection: $selection) {
                        Label("Advising", systemImage: "person")
                    }
                    NavigationLink(destination: CourseDetailView(supportFreePeriod: false, supportTeacher: false, title: "Common Classroom", colorkey: "CommonColorKey", color: $CommonColorKey, name: $CommonNameKey, room: $CommonRoomKey, teacher: $CommonTeacherKey, freePeriodStatus: $CommonFreeKey, pickervalue: $Commonpickervalue, colorvalue: $Commoncolorvalue), tag: "Common Classroom", selection: $selection) {
                        Label("Common Classroom", systemImage: "person")
                    }
                    NavigationLink(destination: CourseDetailView(supportFreePeriod: false, supportTeacher: false, title: "Compass", colorkey: "CompassColorKey", color: $CompassColorKey, name: $CompassNameKey, room: $CompassRoomKey, teacher: $CompassTeacherKey, freePeriodStatus: $CompassFreeKey, pickervalue: $Compasspickervalue, colorvalue: $Compasscolorvalue), tag: "Compass", selection: $selection) {
                        Label("Compass", systemImage: "person")
                    }
                    Divider()
                }
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
                BlockResetRow(ipados: true)
                OtherResetRow(ipados: true)
            }.sheet(isPresented: $showAuthSheet, content: {
                AuthView(authenticated: $authenticated, clubsArray: $clubsArray, sportsArray: $sportsArray, qlArray: $qlArray)
            })
            .listStyle(SidebarListStyle())
            .navigationBarTitle("Schedule")
        }
        .accentColor(Color("AccentColor"))
    }
}
#endif

#if os(macOS)
struct ViewMainmacOS: View {
    @Binding var selection: String?
    @Binding var authenticated: Bool
    @State var showAuthSheet = false
    
    @Binding var clubsArray: [EventCalModel.Item]
    @Binding var sportsArray: [EventCalModel.Item]
    @Binding var qlArray: [Entry]
    
    @State var date = Date()
    
    @State var AColorKey = Color(UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AColorKey") ?? systemBlue)
    @AppStorage("ANameKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var ANameKey: String = "A-Block"
    @AppStorage("ARoomKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var ARoomKey: String = ""
    @AppStorage("ATeacherKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var ATeacherKey: String = ""
    @AppStorage("AFreeKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var AFreeKey: Bool = false
    @State var Apickervalue = mainPickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AColorKey") ?? systemGray)
    @State var Acolorvalue = pickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "AColorKey") ?? systemBlue)
    
    @State var BColorKey = Color(UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "BColorKey") ?? systemGreen)
    @AppStorage("BNameKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var BNameKey: String = "B-Block"
    @AppStorage("BRoomKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var BRoomKey: String = ""
    @AppStorage("BTeacherKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var BTeacherKey: String = ""
    @AppStorage("BFreeKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var BFreeKey: Bool = false
    @State var Bpickervalue = mainPickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "BColorKey") ?? systemGray)
    @State var Bcolorvalue = pickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "BColorKey") ?? systemGreen)
    
    @State var CColorKey = Color(UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CColorKey") ?? systemOrange)
    @AppStorage("CNameKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var CNameKey: String = "C-Block"
    @AppStorage("CRoomKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var CRoomKey: String = ""
    @AppStorage("CTeacherKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var CTeacherKey: String = ""
    @AppStorage("CFreeKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var CFreeKey: Bool = false
    @State var Cpickervalue = mainPickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CColorKey") ?? systemGray)
    @State var Ccolorvalue = pickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "CColorKey") ?? systemOrange)
    
    @State var DColorKey = Color(UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "DColorKey") ?? systemIndigo)
    @AppStorage("DNameKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var DNameKey: String = "D-Block"
    @AppStorage("DRoomKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var DRoomKey: String = ""
    @AppStorage("DTeacherKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var DTeacherKey: String = ""
    @AppStorage("DFreeKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var DFreeKey: Bool = false
    @State var Dpickervalue = mainPickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "DColorKey") ?? systemGray)
    @State var Dcolorvalue = pickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "DColorKey") ?? systemIndigo)
    
    @State var EColorKey = Color(UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "EColorKey") ?? systemPurple)
    @AppStorage("ENameKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var ENameKey: String = "E-Block"
    @AppStorage("ERoomKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var ERoomKey: String = ""
    @AppStorage("ETeacherKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var ETeacherKey: String = ""
    @AppStorage("EFreeKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var EFreeKey: Bool = false
    @State var Epickervalue = mainPickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "EColorKey") ?? systemGray)
    @State var Ecolorvalue = pickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "EColorKey") ?? systemPurple)
    
    @State var FColorKey = Color(UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "FColorKey") ?? systemMagenta)
    @AppStorage("FNameKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var FNameKey: String = "F-Block"
    @AppStorage("FRoomKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var FRoomKey: String = ""
    @AppStorage("FTeacherKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var FTeacherKey: String = ""
    @AppStorage("FFreeKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var FFreeKey: Bool = false
    @State var Fpickervalue = mainPickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "FColorKey") ?? systemGray)
    @State var Fcolorvalue = pickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "FColorKey") ?? systemMagenta)
    
    @State var GColorKey = Color(UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "GColorKey") ?? systemRed)
    @AppStorage("GNameKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var GNameKey: String = "G-Block"
    @AppStorage("GRoomKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var GRoomKey: String = ""
    @AppStorage("GTeacherKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var GTeacherKey: String = ""
    @AppStorage("GFreeKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var GFreeKey: Bool = false
    @State var Gpickervalue = mainPickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "GColorKey") ?? systemGray)
    @State var Gcolorvalue = pickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "GColorKey") ?? systemRed)
    
    @State var HColorKey = Color(UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "HColorKey") ?? systemYellow)
    @AppStorage("HNameKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var HNameKey: String = "H-Block"
    @AppStorage("HRoomKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var HRoomKey: String = ""
    @AppStorage("HTeacherKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var HTeacherKey: String = ""
    @AppStorage("HFreeKey", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var HFreeKey: Bool = false
    @State var Hpickervalue = mainPickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "HColorKey") ?? systemGray)
    @State var Hcolorvalue = pickerFormatter(color: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.colorForKey(key: "HColorKey") ?? systemYellow)
    
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
    
    var body: some View {
//        NavigationView() {
            List {
                NavigationLink(destination: NowView(authstatus: $authenticated, clubsArray: $clubsArray, sportsArray: $sportsArray, qlArray: $qlArray), tag: "Dashboard", selection: $selection) {
                    Label("Dashboard", systemImage: "speedometer")
                }
//                if authenticated {
                    NavigationLink(destination: ClubsView(date: $date, array: $clubsArray), tag: "Clubs", selection: $selection) {
                                    Label("Clubs", systemImage: "person.2")
                                }
                    NavigationLink(destination: SportsView(date: $date, array: $sportsArray), tag: "Sports", selection: $selection) {
                                    Label("Sports", systemImage: "rosette")
                                }
//                                }
                NavigationLink(destination: ScheduleView(array: $qlArray), tag: "Schedule", selection: $selection) {
                    Label("Schedule", systemImage: "calendar")
                }
                Section (header: Text("Courses")){
                    NavigationLink(destination: CourseDetailView(supportFreePeriod: true, supportTeacher: true, title: "A-Block", colorkey: "AColorKey", color: $AColorKey, name: $ANameKey, room: $ARoomKey, teacher: $ATeacherKey, freePeriodStatus: $AFreeKey, pickervalue: $Apickervalue, colorvalue: $Acolorvalue), tag: "A-Block", selection: $selection) {
                        Label("A-Block", systemImage: "book.closed")
                    }
                    NavigationLink(destination: CourseDetailView(supportFreePeriod: true, supportTeacher: true, title: "B-Block", colorkey: "BColorKey", color: $BColorKey, name: $BNameKey, room: $BRoomKey, teacher: $BTeacherKey, freePeriodStatus: $BFreeKey, pickervalue: $Bpickervalue, colorvalue: $Bcolorvalue), tag: "B-Block", selection: $selection) {
                        Label("B-Block", systemImage: "book.closed")
                    }
                    NavigationLink(destination: CourseDetailView(supportFreePeriod: true, supportTeacher: true, title: "C-Block", colorkey: "CColorKey", color: $CColorKey, name: $CNameKey, room: $CRoomKey, teacher: $CTeacherKey, freePeriodStatus: $CFreeKey, pickervalue: $Cpickervalue, colorvalue: $Ccolorvalue), tag: "C-Block", selection: $selection) {
                        Label("C-Block", systemImage: "book.closed")
                    }
                    NavigationLink(destination: CourseDetailView(supportFreePeriod: true, supportTeacher: true, title: "D-Block", colorkey: "DColorKey", color: $DColorKey, name: $DNameKey, room: $DRoomKey, teacher: $DTeacherKey, freePeriodStatus: $DFreeKey, pickervalue: $Dpickervalue, colorvalue: $Dcolorvalue), tag: "D-Block", selection: $selection) {
                        Label("D-Block", systemImage: "book.closed")
                    }
                    NavigationLink(destination: CourseDetailView(supportFreePeriod: true, supportTeacher: true, title: "E-Block", colorkey: "EColorKey", color: $EColorKey, name: $ENameKey, room: $ERoomKey, teacher: $ETeacherKey, freePeriodStatus: $EFreeKey, pickervalue: $Epickervalue, colorvalue: $Ecolorvalue), tag: "E-Block", selection: $selection) {
                        Label("E-Block", systemImage: "book.closed")
                    }
                    NavigationLink(destination: CourseDetailView(supportFreePeriod: true, supportTeacher: true, title: "F-Block", colorkey: "FColorKey", color: $FColorKey, name: $FNameKey, room: $FRoomKey, teacher: $FTeacherKey, freePeriodStatus: $FFreeKey, pickervalue: $Fpickervalue, colorvalue: $Fcolorvalue), tag: "F-Block", selection: $selection) {
                        Label("F-Block", systemImage: "book.closed")
                    }
                    NavigationLink(destination: CourseDetailView(supportFreePeriod: true, supportTeacher: true, title: "G-Block", colorkey: "GColorKey", color: $GColorKey, name: $GNameKey, room: $GRoomKey, teacher: $GTeacherKey, freePeriodStatus: $GFreeKey, pickervalue: $Gpickervalue, colorvalue: $Gcolorvalue), tag: "G-Block", selection: $selection) {
                        Label("G-Block", systemImage: "book.closed")
                    }
                    NavigationLink(destination: CourseDetailView(supportFreePeriod: true, supportTeacher: true, title: "H-Block", colorkey: "HColorKey", color: $HColorKey, name: $HNameKey, room: $HRoomKey, teacher: $HTeacherKey, freePeriodStatus: $HFreeKey, pickervalue: $Hpickervalue, colorvalue: $Hcolorvalue), tag: "H-Block", selection: $selection) {
                        Label("H-Block", systemImage: "book.closed")
                    }
                }
                Section (header: Text("Community")) {
                    NavigationLink(destination: CourseDetailView(supportFreePeriod: false, supportTeacher: false, title: "Assembly", colorkey: "AssemblyColorKey", color: $AssemblyColorKey, name: $AssemblyNameKey, room: $AssemblyRoomKey, teacher: $AssemblyTeacherKey, freePeriodStatus: $AssemblyFreeKey, pickervalue: $Assemblypickervalue, colorvalue: $Assemblycolorvalue), tag: "Assembly", selection: $selection) {
                        Label("Assembly", systemImage: "megaphone")
                    }
                    NavigationLink(destination: CourseDetailView(supportFreePeriod: false, supportTeacher: true, title: "Advising", colorkey: "AdvisingColorKey", color: $AdvisingColorKey, name: $AdvisingNameKey, room: $AdvisingRoomKey, teacher: $AdvisingTeacherKey, freePeriodStatus: $AdvisingFreeKey, pickervalue: $Advisingpickervalue, colorvalue: $Advisingcolorvalue), tag: "Advising", selection: $selection) {
                        Label("Advising", systemImage: "person")
                    }
                    NavigationLink(destination: CourseDetailView(supportFreePeriod: false, supportTeacher: false, title: "Common Classroom", colorkey: "CommonColorKey", color: $CommonColorKey, name: $CommonNameKey, room: $CommonRoomKey, teacher: $CommonTeacherKey, freePeriodStatus: $CommonFreeKey, pickervalue: $Commonpickervalue, colorvalue: $Commoncolorvalue), tag: "Common Classroom", selection: $selection) {
                        Label("Common Classroom", systemImage: "person")
                    }
                    NavigationLink(destination: CourseDetailView(supportFreePeriod: false, supportTeacher: false, title: "Compass", colorkey: "CompassColorKey", color: $CompassColorKey, name: $CompassNameKey, room: $CompassRoomKey, teacher: $CompassTeacherKey, freePeriodStatus: $CompassFreeKey, pickervalue: $Compasspickervalue, colorvalue: $Compasscolorvalue), tag: "Compass", selection: $selection) {
                        Label("Compass", systemImage: "person")
                    }
                }
            }.sheet(isPresented: $showAuthSheet, content: {
                AuthView(authenticated: $authenticated, clubsArray: $clubsArray, sportsArray: $sportsArray, qlArray: $qlArray)
            })
        .accentColor(Color("AccentColor"))
    }
}
#endif
