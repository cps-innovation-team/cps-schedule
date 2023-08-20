//  AppMain.swift
//  Schedule.app
//
//  Created by Rahim Malik on 7/11/20.
//  Copyright © 2020 Rahim Malik. All rights reserved.

import SwiftUI

@main
struct ScheduleApp: App {
    @State var header = "Dashboard"
    @AppStorage("AuthSheet", store: UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")) var showAuthSheet: Bool = true
    var body: some Scene {
        #if os(macOS)
        WindowGroup("Schedule") {
            ViewMain(header: $header, showAuthSheet: $showAuthSheet)
        }
        .commands {
            macOSCommands(showAuthSheet: $showAuthSheet)
        }
        #elseif os(iOS)
        WindowGroup {
            ViewMain(header: $header, showAuthSheet: $showAuthSheet)
        }
        #endif
    }
}

struct macOSCommands: Commands {
    @Environment(\.openURL) var openURL
    @State private var showingAlert1 = false
    @State private var showingAlert2 = false
    @State private var showingAlert3 = false
    @Binding var showAuthSheet: Bool
    
    @CommandsBuilder var body: some Commands {
        CommandGroup(after: .newItem) {
            Divider()
            Menu {
                Group {
                    Button("COVID-19 Info") {
                        openURL(URL(string: "https://www.college-prep.org/2020-21-school-year")!)
                    }
                    Button("COVID-19 Dashboard") {
                        openURL(URL(string: "https://sites.google.com/thecollegepreparatoryschool.org/unofficialcpscovid/home")!)
                    }
                }
                Divider()
                Group {
                    Button("Portal") {
                        openURL(URL(string: "https://college-prep.myschoolapp.com/app/student#studentmyday/progress")!)
                    }
                    Button("Radar") {
                        openURL(URL(string: "https://cpsradar.com")!)
                    }
                }
                Divider()
                Group {
                    Button("Learning Center") {
                        openURL(URL(string: "https://sites.google.com/thecollegepreparatoryschool.org/digitallc/home")!)
                    }
                    Button("Library") {
                        openURL(URL(string: "https://collegepreplibrary.com")!)
                    }
                }
                Divider()
                Group {
                    Button("Feedback") {
                        openURL(URL(string: "https://docs.google.com/forms/d/e/1FAIpQLSdeFnyD4Ti1A5pKaLisd81IeX0WBtQ6aBZFa47CeNaw3trS3Q/viewform?usp=sf_link")!)
                    }
                }
            } label: {
                Label("QuickLinks", systemImage: "link")
            }
        }
        CommandGroup(after: .newItem) {
            if (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.bool(forKey: "AuthStatus")) == true {
                Text("Authenticated")
                Button(action: {
                    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.setValue(false, forKey: "AuthStatus")
                    UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.setValue(true, forKey: "AuthSheet")
                }) {
                    Text("Deauthenticate")
                }
            } else {
                Button(action: {
                    showAuthSheet = true
                }) {
                    Text("Authenticate")
                }
            }
            Divider()
            Button(action: {
                BlockReset()
            }) {
                Text("Reset Blocks")
            }
            Button(action: {
                OtherReset()
            }) {
                Text("Reset Community")
            }
        }
        CommandGroup(replacing: .systemServices) {
        }
    }
}
