//  CoursesFile.swift
//  Schedule.app
//
//  Created by Rahim Malik on 7/20/20.
//  Copyright © 2020 Rahim Malik. All rights reserved.

import SwiftUI
import WidgetKit

func receiveColor(value: Int) -> Color {
    if value == 0 {
        return(Color("Apricot"))
    }
    if value == 1 {
        return(Color("Hibiscus"))
    }
    if value == 2 {
        return(Color("Crystal"))
    }
    if value == 3 {
        return(Color("Sea Foam"))
    }
    if value == 4 {
        return(Color("Dragon Fruit"))
    }
    if value == 5 {
        return(Color("Lavender"))
    }
    if value == 6 {
        return(Color("Clementine"))
    }
    if value == 7 {
        return(Color("Surf"))
    }
    if value == 8 {
        return(Color(systemTeal))
    }
    else {
        return(Color(systemAdaptive))
    }
}

func headerFormatter(textvalue: String, childpicker: Int) -> Text {
    if childpicker == 0 {
        return (
            Text (textvalue)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(systemBlue))
        )
    }
    if childpicker == 1 {
        return (
            Text (textvalue)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(systemGreen))
        )
    }
    if childpicker == 2 {
        return (
            Text (textvalue)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(systemOrange))
        )
    }
    if childpicker == 3 {
        return (
            Text (textvalue)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(systemIndigo))
        )
    }
    if childpicker == 4 {
        return (
            Text (textvalue)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(systemPurple))
        )
    }
    if childpicker == 5 {
        return (
            Text (textvalue)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(systemMagenta))
        )
    }
    if childpicker == 6 {
        return (
            Text (textvalue)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(systemRed))
        )
    }
    if childpicker == 7 {
        return (
            Text (textvalue)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(systemYellow))
        )
    }
    if childpicker == 8 {
        return (
            Text (textvalue)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(systemTeal))
        )
    }
    if childpicker == 9 {
        return(
            Text (textvalue)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(systemGray))
        )
    }
    else {
        return(
            Text (textvalue)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(systemAdaptive))
        )
    }
}

func pickerFormatter (color: NSColor) -> Int {
    if color == systemBlue { return(0) }
    if color == systemGreen { return(1) }
    if color == systemOrange { return(2) }
    if color == systemIndigo { return(3) }
    if color == systemPurple { return(4) }
    if color == systemMagenta { return(5) }
    if color == systemRed { return(6) }
    if color == systemYellow { return(7) }
    if color == systemTeal { return(8) }
    if color == systemGray { return(9) }
    else { return(0)}
}

func mainPickerFormatter (color: NSColor) -> Int {
    return(1)
}

struct CourseDetailView: View {
    
    var supportFreePeriod: Bool
    var supportTeacher: Bool
    var title: String
    var colorkey: String
    @Binding var color: Color
    @Binding var name: String
    @Binding var room: String
    @Binding var teacher: String
    @Binding var freePeriodStatus: Bool
    @Binding var pickervalue: Int
    @Binding var colorvalue: Int
    
    var body: some View {
        VStack {
            HStack {
                if pickervalue == 0 {
                    Text(title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(receiveColor(value: colorvalue))
                }
                if pickervalue == 1 {
                    Text(title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(color)
                }
            }.padding([.top,.bottom])
            Form {
                VStack {
                    Section {
                        TextField("Name", text: $name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .onChange(of: name, perform: { value in
                                WidgetCenter.shared.reloadAllTimelines()
                            })
                        if supportTeacher {
                            if title == "Advising" {
                                TextField("Advisor", text: $teacher)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .onChange(of: teacher, perform: { value in
                                        WidgetCenter.shared.reloadAllTimelines()
                                    })
                            } else {
                                TextField("Teacher", text: $teacher)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .onChange(of: teacher, perform: { value in
                                        WidgetCenter.shared.reloadAllTimelines()
                                    })
                            }
                        }
                        if (title.contains("Block") || title.contains("Advising") || title.contains("Compass")) && title != "X-Block" {
                            TextField("Room", text: $room)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .onChange(of: room, perform: { value in
                                    WidgetCenter.shared.reloadAllTimelines()
                                })
                        }
                    }
                }.padding([.bottom])
                if supportFreePeriod {
                    Section() {
                        HStack {
                            Text("Free Period")
                            Spacer()
                            Toggle("Free Period", isOn: $freePeriodStatus)
                                .onChange(of: freePeriodStatus, perform: { value in
                                    WidgetCenter.shared.reloadAllTimelines()
                                })
                                .toggleStyle(SwitchToggleStyle())
                                .labelsHidden()
                        }
                    }.padding([.bottom])
                }
                Section {
                    HStack {
                        Text("Color")
                        Spacer()
                    }
                    Picker(selection: $pickervalue, label: Text("")) {
                        Text("Defaults").tag(0)
                        Text("Custom").tag(1)
                    }
                    .padding([.bottom])
                    .pickerStyle(SegmentedPickerStyle())
                    if pickervalue == 0 {
                        Picker("", selection: $colorvalue) {
                            Text("Apricot").tag(0)
                                .foregroundColor(Color("Apricot"))
                            Text("Hibiscus").tag(1)
                                .foregroundColor(Color("Hibiscus"))
                            Text("Crystal").tag(2)
                                .foregroundColor(Color("Crystal"))
                            Text("Sea Foam").tag(3)
                                .foregroundColor(Color("Sea Foam"))
                            Text("Dragon Fruit").tag(4)
                                .foregroundColor(Color("Dragon Fruit"))
                            Text("Lavender").tag(5)
                                .foregroundColor(Color("Lavender"))
                            Text("Clementine").tag(6)
                                .foregroundColor(Color("Clementine"))
                            Text("Surf").tag(7)
                                .foregroundColor(Color("Surf"))
                            Text("Sky").tag(8)
                                .foregroundColor(Color(systemTeal))
                            Text("Stone").tag(9)
                                .foregroundColor(Color(systemAdaptive))
                        }
                        .onReceive([self.colorvalue].publisher.first(), perform: { value in
                            UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.setColor(color: NSColor(receiveColor(value: self.colorvalue)), forKey: colorkey)
                            WidgetCenter.shared.reloadAllTimelines()
                        })
                        .labelsHidden()
                        .pickerStyle(PopUpButtonPickerStyle())
                        .accentColor(receiveColor(value: self.colorvalue))
                        .padding([.bottom])
                    }
                    if pickervalue == 1 {
                        ColorPicker("Set a custom color", selection: $color, supportsOpacity: false)
                            .onChange(of: color, perform: { value in
                                UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.setColor(color: NSColor(color), forKey: colorkey)
                                WidgetCenter.shared.reloadAllTimelines()
                            })
                            .labelsHidden()
                            .padding([.bottom])
                            .frame(height: 50)
                    }
                }
            }
        }
        .padding()
        .padding()
        .onDisappear(perform: {
            WidgetCenter.shared.reloadAllTimelines()
        })
    }
}
