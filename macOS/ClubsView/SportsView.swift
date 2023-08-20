//
//  SportsView.swift
//  Schedule (iOS)
//
//  Created by Rahim Malik on 2/19/21.
//  Copyright © 2021 Rahim Malik. All rights reserved.
//

import SwiftUI
import DynamicColor
import Foundation
import Combine

func getDataSports(input: GetCalSports) -> EventCalModel {
    let myDateFormatter = DateFormatter()
    myDateFormatter.locale = Locale(identifier: "en_US_POSIX")
    myDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    let calendarID = "ur_mom"
    let apiKey = "ur_mom"
    
    var components = URLComponents()
    components.scheme = "https"
    components.host = "www.googleapis.com"
    components.path = "/calendar/v3/calendars/\(calendarID)/events"
    components.queryItems = [
        URLQueryItem(name: "key", value: apiKey),
        URLQueryItem(name: "showDeleted", value: "false"),
        URLQueryItem(name: "singleEvents", value: "true")
    ]
    
    let urlFormat = components.url
    
    URLSession.shared.dataTask(with: urlFormat!) { (data, response, error) in
        if let httpResponse = response as? HTTPURLResponse {
            if httpResponse.statusCode == 200 {
                if let data = data {
                    DispatchQueue.main.async {
                        do {
                            let test = try JSONDecoder().decode(EventCal.self, from: data)
                            input.event = EventCalModel(model: test)
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
        }
        guard error == nil else {
            print(error!.localizedDescription)
            return
        }
    }.resume()
    
    return input.event
}

struct SportsQuickLink: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.openURL) var openURL
    
    @Binding var date: Date
    @Binding var array: [EventCalModel.Item]
    @ObservedObject var sportsManager = GetCalSports()
    let timer = Timer.publish(every: 10, tolerance: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing: 15) {
            if array.filter { if ($0.dateTime != "" && DateCheckerU(dateRow: getDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "dd", convertDate: $0.dateTime))) {
                return true
            } else {
                return false
            } } != [] {
                HStack {
                    Text("Sports")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .textCase(.uppercase)
                        .foregroundColor(Color("SystemGray2"))
                    Spacer()
                }
                QLSportsViewUpcoming(SportsArray: array.filter {
                    if ($0.dateTime != "" && DateCheckerU(dateRow: getDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "dd", convertDate: $0.dateTime))) {
                        return true
                    } else {
                        return false
                    }
                }, date: $date)
            } else {
                HStack {
                    Text("Sports")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .textCase(.uppercase)
                        .foregroundColor(Color("SystemGray2"))
                    Spacer()
                    Text("No Sports Games")
                        .font(.system(size: 16))
                }
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 15).foregroundColor(Color(.gridColor)))
        .onReceive(timer, perform: { _ in
            array = getDataSports(input: sportsManager).items
            date = Date()
        })
    }
}

struct SportsView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.openURL) var openURL
    
    @Binding var date: Date
    @Binding var array: [EventCalModel.Item]
    
    @State var pickerValue = 0
    
    @State var bcrosscountryPresented = true
    @State var gcrosscountryPresented = true
    @State var golfPresented = true
    @State var gtennisPresented = true
    @State var trackandfieldPresented = true
    @State var btennisPresented = true
    @State var baseballPresented = true
    @State var softballPresented = true
    @State var bvolleyballPresented = true
    @State var gvolleyballPresented = true
    @State var bswimmingPresented = true
    @State var gswimmingPresented = true
    @State var bsoccerPresented = true
    @State var gsoccerPresented = true
    @State var bbasketballPresented = true
    @State var gbasketballPresented = true
    
    var body: some View {
        VStack {
            SportsVM(SportsArray: $array, date: $date, pickerValue: $pickerValue, bcrosscountryPresented: $bcrosscountryPresented, gcrosscountryPresented: $gcrosscountryPresented, golfPresented: $golfPresented, gtennisPresented: $gtennisPresented, trackandfieldPresented: $trackandfieldPresented, btennisPresented: $btennisPresented, baseballPresented: $baseballPresented, softballPresented: $softballPresented, bvolleyballPresented: $bvolleyballPresented, gvolleyballPresented: $gvolleyballPresented, bswimmingPresented: $bswimmingPresented, gswimmingPresented: $gswimmingPresented, bsoccerPresented: $bsoccerPresented, gsoccerPresented: $gsoccerPresented, bbasketballPresented: $bbasketballPresented, gbasketballPresented: $gbasketballPresented)
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Spacer()
                    Picker("Sports", selection: $pickerValue) {
                        Text("Upcoming").tag(0)
                        Text("Results").tag(1)
                    }
                    .labelsHidden()
                    .pickerStyle(SegmentedPickerStyle())
                    Spacer()
                }
            }
            ToolbarItem() {
                Spacer()
            }
            ToolbarItem() {
                Menu {
                    Button(action: {
                        bcrosscountryPresented = true
                        gcrosscountryPresented = true
                        golfPresented = true
                        gtennisPresented = true
                        trackandfieldPresented = true
                        btennisPresented = true
                        baseballPresented = true
                        softballPresented = true
                        bvolleyballPresented = true
                        gvolleyballPresented = true
                        bswimmingPresented = true
                        gswimmingPresented = true
                        bsoccerPresented = true
                        gsoccerPresented = true
                        bbasketballPresented = true
                        gbasketballPresented = true
                    }) {
                        if bcrosscountryPresented && gcrosscountryPresented && golfPresented && gtennisPresented && trackandfieldPresented && btennisPresented && baseballPresented && softballPresented && bvolleyballPresented && gvolleyballPresented && bswimmingPresented && gswimmingPresented && bsoccerPresented && gsoccerPresented && bbasketballPresented && gbasketballPresented {
                            HStack {
                                Image(systemName: "checkmark")
                                Text("All Sports")
                            }
                        } else {
                            Text("All Sports")
                        }
                    }
                    Divider()
                    Group {
                        Button(action: {
                            bcrosscountryPresented = true
                            gcrosscountryPresented = false
                            golfPresented = false
                            gtennisPresented = false
                            trackandfieldPresented = false
                            btennisPresented = false
                            baseballPresented = false
                            softballPresented = false
                            bvolleyballPresented = false
                            gvolleyballPresented = false
                            bswimmingPresented = false
                            gswimmingPresented = false
                            bsoccerPresented = false
                            gsoccerPresented = false
                            bbasketballPresented = false
                            gbasketballPresented = false
                        }) {
                            if bcrosscountryPresented == true && gcrosscountryPresented == false && golfPresented == false && gtennisPresented == false && trackandfieldPresented == false && btennisPresented == false && baseballPresented == false && softballPresented == false && bvolleyballPresented == false && gvolleyballPresented == false && bswimmingPresented == false && gswimmingPresented == false && bsoccerPresented == false && gsoccerPresented == false && bbasketballPresented == false && gbasketballPresented == false {
                                HStack {
                                    Image(systemName: "checkmark")
                                    Text("Boys Cross Country")
                                }
                            } else {
                                Text("Boys Cross Country")
                            }
                        }
                        Button(action: {
                            bcrosscountryPresented = false
                            gcrosscountryPresented = true
                            golfPresented = false
                            gtennisPresented = false
                            trackandfieldPresented = false
                            btennisPresented = false
                            baseballPresented = false
                            softballPresented = false
                            bvolleyballPresented = false
                            gvolleyballPresented = false
                            bswimmingPresented = false
                            gswimmingPresented = false
                            bsoccerPresented = false
                            gsoccerPresented = false
                            bbasketballPresented = false
                            gbasketballPresented = false
                        }) {
                            if bcrosscountryPresented == false && gcrosscountryPresented == true && golfPresented == false && gtennisPresented == false && trackandfieldPresented == false && btennisPresented == false && baseballPresented == false && softballPresented == false && bvolleyballPresented == false && gvolleyballPresented == false && bswimmingPresented == false && gswimmingPresented == false && bsoccerPresented == false && gsoccerPresented == false && bbasketballPresented == false && gbasketballPresented == false {
                                HStack {
                                    Image(systemName: "checkmark")
                                    Text("Girls Cross Country")
                                }
                            } else {
                                Text("Girls Cross Country")
                            }
                        }
                        Button(action: {
                            bcrosscountryPresented = false
                            gcrosscountryPresented = false
                            golfPresented = true
                            gtennisPresented = false
                            trackandfieldPresented = false
                            btennisPresented = false
                            baseballPresented = false
                            softballPresented = false
                            bvolleyballPresented = false
                            gvolleyballPresented = false
                            bswimmingPresented = false
                            gswimmingPresented = false
                            bsoccerPresented = false
                            gsoccerPresented = false
                            bbasketballPresented = false
                            gbasketballPresented = false
                        }) {
                            if bcrosscountryPresented == false && gcrosscountryPresented == false && golfPresented == true && gtennisPresented == false && trackandfieldPresented == false && btennisPresented == false && baseballPresented == false && softballPresented == false && bvolleyballPresented == false && gvolleyballPresented == false && bswimmingPresented == false && gswimmingPresented == false && bsoccerPresented == false && gsoccerPresented == false && bbasketballPresented == false && gbasketballPresented == false {
                                HStack {
                                    Image(systemName: "checkmark")
                                    Text("Golf")
                                }
                            } else {
                                Text("Golf")
                            }
                        }
                        Button(action: {
                            bcrosscountryPresented = false
                            gcrosscountryPresented = false
                            golfPresented = false
                            gtennisPresented = true
                            trackandfieldPresented = false
                            btennisPresented = false
                            baseballPresented = false
                            softballPresented = false
                            bvolleyballPresented = false
                            gvolleyballPresented = false
                            bswimmingPresented = false
                            gswimmingPresented = false
                            bsoccerPresented = false
                            gsoccerPresented = false
                            bbasketballPresented = false
                            gbasketballPresented = false
                        }) {
                            if bcrosscountryPresented == false && gcrosscountryPresented == false && golfPresented == false && gtennisPresented == true && trackandfieldPresented == false && btennisPresented == false && baseballPresented == false && softballPresented == false && bvolleyballPresented == false && gvolleyballPresented == false && bswimmingPresented == false && gswimmingPresented == false && bsoccerPresented == false && gsoccerPresented == false && bbasketballPresented == false && gbasketballPresented == false {
                                HStack {
                                    Image(systemName: "checkmark")
                                    Text("Girls Tennis")
                                }
                            } else {
                                Text("Girls Tennis")
                            }
                        }
                        Button(action: {
                            bcrosscountryPresented = false
                            gcrosscountryPresented = false
                            golfPresented = false
                            gtennisPresented = false
                            trackandfieldPresented = true
                            btennisPresented = false
                            baseballPresented = false
                            softballPresented = false
                            bvolleyballPresented = false
                            gvolleyballPresented = false
                            bswimmingPresented = false
                            gswimmingPresented = false
                            bsoccerPresented = false
                            gsoccerPresented = false
                            bbasketballPresented = false
                            gbasketballPresented = false
                        }) {
                            if bcrosscountryPresented == false && gcrosscountryPresented == false && golfPresented == false && gtennisPresented == false && trackandfieldPresented == true && btennisPresented == false && baseballPresented == false && softballPresented == false && bvolleyballPresented == false && gvolleyballPresented == false && bswimmingPresented == false && gswimmingPresented == false && bsoccerPresented == false && gsoccerPresented == false && bbasketballPresented == false && gbasketballPresented == false {
                                HStack {
                                    Image(systemName: "checkmark")
                                    Text("Track & Field")
                                }
                            } else {
                                Text("Track & Field")
                            }
                        }
                        Button(action: {
                            bcrosscountryPresented = false
                            gcrosscountryPresented = false
                            golfPresented = false
                            gtennisPresented = false
                            trackandfieldPresented = false
                            btennisPresented = true
                            baseballPresented = false
                            softballPresented = false
                            bvolleyballPresented = false
                            gvolleyballPresented = false
                            bswimmingPresented = false
                            gswimmingPresented = false
                            bsoccerPresented = false
                            gsoccerPresented = false
                            bbasketballPresented = false
                            gbasketballPresented = false
                        }) {
                            if bcrosscountryPresented == false && gcrosscountryPresented == false && golfPresented == false && gtennisPresented == false && trackandfieldPresented == false && btennisPresented == true && baseballPresented == false && softballPresented == false && bvolleyballPresented == false && gvolleyballPresented == false && bswimmingPresented == false && gswimmingPresented == false && bsoccerPresented == false && gsoccerPresented == false && bbasketballPresented == false && gbasketballPresented == false {
                                HStack {
                                    Image(systemName: "checkmark")
                                    Text("Boys Tennis")
                                }
                            } else {
                                Text("Boys Tennis")
                            }
                        }
                        Button(action: {
                            bcrosscountryPresented = false
                            gcrosscountryPresented = false
                            golfPresented = false
                            gtennisPresented = false
                            trackandfieldPresented = false
                            btennisPresented = false
                            baseballPresented = true
                            softballPresented = false
                            bvolleyballPresented = false
                            gvolleyballPresented = false
                            bswimmingPresented = false
                            gswimmingPresented = false
                            bsoccerPresented = false
                            gsoccerPresented = false
                            bbasketballPresented = false
                            gbasketballPresented = false
                        }) {
                            if bcrosscountryPresented == false && gcrosscountryPresented == false && golfPresented == false && gtennisPresented == false && trackandfieldPresented == false && btennisPresented == false && baseballPresented == true && softballPresented == false && bvolleyballPresented == false && gvolleyballPresented == false && bswimmingPresented == false && gswimmingPresented == false && bsoccerPresented == false && gsoccerPresented == false && bbasketballPresented == false && gbasketballPresented == false {
                                HStack {
                                    Image(systemName: "checkmark")
                                    Text("Baseball")
                                }
                            } else {
                                Text("Baseball")
                            }
                        }
                    }
                    Group {
                        Button(action: {
                            bcrosscountryPresented = false
                            gcrosscountryPresented = false
                            golfPresented = false
                            gtennisPresented = false
                            trackandfieldPresented = false
                            btennisPresented = false
                            baseballPresented = false
                            softballPresented = true
                            bvolleyballPresented = false
                            gvolleyballPresented = false
                            bswimmingPresented = false
                            gswimmingPresented = false
                            bsoccerPresented = false
                            gsoccerPresented = false
                            bbasketballPresented = false
                            gbasketballPresented = false
                        }) {
                            if bcrosscountryPresented == false && gcrosscountryPresented == false && golfPresented == false && gtennisPresented == false && trackandfieldPresented == false && btennisPresented == false && baseballPresented == false && softballPresented == true && bvolleyballPresented == false && gvolleyballPresented == false && bswimmingPresented == false && gswimmingPresented == false && bsoccerPresented == false && gsoccerPresented == false && bbasketballPresented == false && gbasketballPresented == false {
                                HStack {
                                    Image(systemName: "checkmark")
                                    Text("Softball")
                                }
                            } else {
                                Text("Softball")
                            }
                        }
                        Button(action: {
                            bcrosscountryPresented = false
                            gcrosscountryPresented = false
                            golfPresented = false
                            gtennisPresented = false
                            trackandfieldPresented = false
                            btennisPresented = false
                            baseballPresented = false
                            softballPresented = false
                            bvolleyballPresented = true
                            gvolleyballPresented = false
                            bswimmingPresented = false
                            gswimmingPresented = false
                            bsoccerPresented = false
                            gsoccerPresented = false
                            bbasketballPresented = false
                            gbasketballPresented = false
                        }) {
                            if bcrosscountryPresented == false && gcrosscountryPresented == false && golfPresented == false && gtennisPresented == false && trackandfieldPresented == false && btennisPresented == false && baseballPresented == false && softballPresented == false && bvolleyballPresented == true && gvolleyballPresented == false && bswimmingPresented == false && gswimmingPresented == false && bsoccerPresented == false && gsoccerPresented == false && bbasketballPresented == false && gbasketballPresented == false {
                                HStack {
                                    Image(systemName: "checkmark")
                                    Text("Boys Volleyball")
                                }
                            } else {
                                Text("Boys Volleyball")
                            }
                        }
                        Button(action: {
                            bcrosscountryPresented = false
                            gcrosscountryPresented = false
                            golfPresented = false
                            gtennisPresented = false
                            trackandfieldPresented = false
                            btennisPresented = false
                            baseballPresented = false
                            softballPresented = false
                            bvolleyballPresented = false
                            gvolleyballPresented = true
                            bswimmingPresented = false
                            gswimmingPresented = false
                            bsoccerPresented = false
                            gsoccerPresented = false
                            bbasketballPresented = false
                            gbasketballPresented = false
                        }) {
                            if bcrosscountryPresented == false && gcrosscountryPresented == false && golfPresented == false && gtennisPresented == false && trackandfieldPresented == false && btennisPresented == false && baseballPresented == false && softballPresented == false && bvolleyballPresented == false && gvolleyballPresented == true && bswimmingPresented == false && gswimmingPresented == false && bsoccerPresented == false && gsoccerPresented == false && bbasketballPresented == false && gbasketballPresented == false {
                                HStack {
                                    Image(systemName: "checkmark")
                                    Text("Girls Volleyball")
                                }
                            } else {
                                Text("Girls Volleyball")
                            }
                        }
                        Button(action: {
                            bcrosscountryPresented = false
                            gcrosscountryPresented = false
                            golfPresented = false
                            gtennisPresented = false
                            trackandfieldPresented = false
                            btennisPresented = false
                            baseballPresented = false
                            softballPresented = false
                            bvolleyballPresented = false
                            gvolleyballPresented = false
                            bswimmingPresented = true
                            gswimmingPresented = false
                            bsoccerPresented = false
                            gsoccerPresented = false
                            bbasketballPresented = false
                            gbasketballPresented = false
                        }) {
                            if bcrosscountryPresented == false && gcrosscountryPresented == false && golfPresented == false && gtennisPresented == false && trackandfieldPresented == false && btennisPresented == false && baseballPresented == false && softballPresented == false && bvolleyballPresented == false && gvolleyballPresented == false && bswimmingPresented == true && gswimmingPresented == false && bsoccerPresented == false && gsoccerPresented == false && bbasketballPresented == false && gbasketballPresented == false {
                                HStack {
                                    Image(systemName: "checkmark")
                                    Text("Boys Swimming")
                                }
                            } else {
                                Text("Boys Swimming")
                            }
                        }
                        Button(action: {
                            bcrosscountryPresented = false
                            gcrosscountryPresented = false
                            golfPresented = false
                            gtennisPresented = false
                            trackandfieldPresented = false
                            btennisPresented = false
                            baseballPresented = false
                            softballPresented = false
                            bvolleyballPresented = false
                            gvolleyballPresented = false
                            bswimmingPresented = false
                            gswimmingPresented = true
                            bsoccerPresented = false
                            gsoccerPresented = false
                            bbasketballPresented = false
                            gbasketballPresented = false
                        }) {
                            if bcrosscountryPresented == false && gcrosscountryPresented == false && golfPresented == false && gtennisPresented == false && trackandfieldPresented == false && btennisPresented == false && baseballPresented == false && softballPresented == false && bvolleyballPresented == false && gvolleyballPresented == false && bswimmingPresented == false && gswimmingPresented == true && bsoccerPresented == false && gsoccerPresented == false && bbasketballPresented == false && gbasketballPresented == false {
                                HStack {
                                    Image(systemName: "checkmark")
                                    Text("Girls Swimming")
                                }
                            } else {
                                Text("Girls Swimming")
                            }
                        }
                        Button(action: {
                            bcrosscountryPresented = false
                            gcrosscountryPresented = false
                            golfPresented = false
                            gtennisPresented = false
                            trackandfieldPresented = false
                            btennisPresented = false
                            baseballPresented = false
                            softballPresented = false
                            bvolleyballPresented = false
                            gvolleyballPresented = false
                            bswimmingPresented = false
                            gswimmingPresented = false
                            bsoccerPresented = true
                            gsoccerPresented = false
                            bbasketballPresented = false
                            gbasketballPresented = false
                        }) {
                            if bcrosscountryPresented == false && gcrosscountryPresented == false && golfPresented == false && gtennisPresented == false && trackandfieldPresented == false && btennisPresented == false && baseballPresented == false && softballPresented == false && bvolleyballPresented == false && gvolleyballPresented == false && bswimmingPresented == false && gswimmingPresented == false && bsoccerPresented == true && gsoccerPresented == false && bbasketballPresented == false && gbasketballPresented == false {
                                HStack {
                                    Image(systemName: "checkmark")
                                    Text("Boys Soccer")
                                }
                            } else {
                                Text("Boys Soccer")
                            }
                        }
                    }
                    Group {
                        Button(action: {
                            bcrosscountryPresented = false
                            gcrosscountryPresented = false
                            golfPresented = false
                            gtennisPresented = false
                            trackandfieldPresented = false
                            btennisPresented = false
                            baseballPresented = false
                            softballPresented = false
                            bvolleyballPresented = false
                            gvolleyballPresented = false
                            bswimmingPresented = false
                            gswimmingPresented = false
                            bsoccerPresented = false
                            gsoccerPresented = true
                            bbasketballPresented = false
                            gbasketballPresented = false
                        }) {
                            if bcrosscountryPresented == false && gcrosscountryPresented == false && golfPresented == false && gtennisPresented == false && trackandfieldPresented == false && btennisPresented == false && baseballPresented == false && softballPresented == false && bvolleyballPresented == false && gvolleyballPresented == false && bswimmingPresented == false && gswimmingPresented == false && bsoccerPresented == false && gsoccerPresented == true && bbasketballPresented == false && gbasketballPresented == false {
                                HStack {
                                    Image(systemName: "checkmark")
                                    Text("Girls Soccer")
                                }
                            } else {
                                Text("Girls Soccer")
                            }
                        }
                        Button(action: {
                            bcrosscountryPresented = false
                            gcrosscountryPresented = false
                            golfPresented = false
                            gtennisPresented = false
                            trackandfieldPresented = false
                            btennisPresented = false
                            baseballPresented = false
                            softballPresented = false
                            bvolleyballPresented = false
                            gvolleyballPresented = false
                            bswimmingPresented = false
                            gswimmingPresented = false
                            bsoccerPresented = false
                            gsoccerPresented = false
                            bbasketballPresented = true
                            gbasketballPresented = false
                        }) {
                            if bcrosscountryPresented == false && gcrosscountryPresented == false && golfPresented == false && gtennisPresented == false && trackandfieldPresented == false && btennisPresented == false && baseballPresented == false && softballPresented == false && bvolleyballPresented == false && gvolleyballPresented == false && bswimmingPresented == false && gswimmingPresented == false && bsoccerPresented == false && gsoccerPresented == false && bbasketballPresented == true && gbasketballPresented == false {
                                HStack {
                                    Image(systemName: "checkmark")
                                    Text("Boys Basketball")
                                }
                            } else {
                                Text("Boys Basketball")
                            }
                        }
                        Button(action: {
                            bcrosscountryPresented = false
                            gcrosscountryPresented = false
                            golfPresented = false
                            gtennisPresented = false
                            trackandfieldPresented = false
                            btennisPresented = false
                            baseballPresented = false
                            softballPresented = false
                            bvolleyballPresented = false
                            gvolleyballPresented = false
                            bswimmingPresented = false
                            gswimmingPresented = false
                            bsoccerPresented = false
                            gsoccerPresented = false
                            bbasketballPresented = false
                            gbasketballPresented = true
                        }) {
                            if bcrosscountryPresented == false && gcrosscountryPresented == false && golfPresented == false && gtennisPresented == false && trackandfieldPresented == false && btennisPresented == false && baseballPresented == false && softballPresented == false && bvolleyballPresented == false && gvolleyballPresented == false && bswimmingPresented == false && gswimmingPresented == false && bsoccerPresented == false && gsoccerPresented == false && bbasketballPresented == false && gbasketballPresented == true {
                                HStack {
                                    Image(systemName: "checkmark")
                                    Text("Girls Basketball")
                                }
                            } else {
                                Text("Girls Basketball")
                            }
                        }
                    }
                } label: {
                    if bcrosscountryPresented && gcrosscountryPresented && golfPresented && gtennisPresented && trackandfieldPresented && btennisPresented && baseballPresented && softballPresented && bvolleyballPresented && gvolleyballPresented && bswimmingPresented && gswimmingPresented && bsoccerPresented && gsoccerPresented && bbasketballPresented && gbasketballPresented {
                        Image(systemName: "line.horizontal.3.decrease.circle")
                            .font(.system(size: 22))
                            .foregroundColor(Color("SystemToolbar"))
                    } else {
                        Image(systemName: "line.horizontal.3.decrease.circle.fill")
                            .font(.system(size: 22))
                            .foregroundColor(Color("SystemToolbar"))
                    }
                }
            }
        }
    }
}
