//
//  ClubsView.swift
//  Schedule (iOS)
//
//  Created by Rahim Malik on 12/14/20.
//  Copyright © 2020 Rahim Malik. All rights reserved.
//

import SwiftUI
import DynamicColor
import Foundation
import Combine

func getDataClubs(input: GetCalClubs) -> EventCalModel {
    let testDate = Date()
    let myDateFormatter = DateFormatter()
    myDateFormatter.locale = Locale(identifier: "en_US_POSIX")
    myDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    let startMO = testDate.startOfMonth()
    let endMO = testDate.endOfMonth()
    let calendarID = "ur_mom"
    let apiKey = "ur_mom"
    
    var components = URLComponents()
    components.scheme = "https"
    components.host = "www.googleapis.com"
    components.path = "/calendar/v3/calendars/\(calendarID)/events"
    components.queryItems = [
        URLQueryItem(name: "key", value: apiKey),
        URLQueryItem(name: "timeMin", value: myDateFormatter.string(from: startMO)),
        URLQueryItem(name: "timeMax", value: myDateFormatter.string(from: endMO)),
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

struct ClubsQuickLink: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.openURL) var openURL
    
    @Binding var date: Date
    @Binding var array: [EventCalModel.Item]
    @ObservedObject var clubsManager = GetCalClubs()
    let timer = Timer.publish(every: 5, tolerance: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing: 15) {
            if array.filter { if ($0.dateTime != "" && DateChecker(dateRow: getDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "dd", convertDate: $0.dateTime), bindDate: date)) || ($0.start != "" && DateChecker(dateRow: getDate(currentDateFormate: "yyyy-MM-dd", conVertFormate: "dd", convertDate: $0.start), bindDate: date)) {
                return true
            } else {
                return false
            } } != [] {
                HStack {
                    Text("Clubs")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .textCase(.uppercase)
                        .foregroundColor(Color(.secondaryLabel))
                    Spacer()
                }
                QLCalendarView(ClubsArray: array.filter { if ($0.dateTime != "" && DateChecker(dateRow: getDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "dd", convertDate: $0.dateTime), bindDate: date)) || ($0.start != "" && DateChecker(dateRow: getDate(currentDateFormate: "yyyy-MM-dd", conVertFormate: "dd", convertDate: $0.start), bindDate: date)) {
                    return true
                } else {
                    return false
                } }, date: $date)
            } else {
                HStack {
                    Text("Clubs")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .textCase(.uppercase)
                        .foregroundColor(Color(.secondaryLabel))
                    Spacer()
                    Text("No Club Meetings")
                        .font(.system(size: 16))
                }
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 15).foregroundColor(Color(.quaternarySystemFill)))
        .onReceive(timer, perform: { _ in
            array = getDataClubs(input: clubsManager).items
        })
    }
}

struct ClubsView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.openURL) var openURL
    
    @Binding var date: Date
    @Binding var array: [EventCalModel.Item]
    @State var show = false
    
    @State var affinitiesPresented = true
    @State var activismPresented = true
    @State var stemPresented = true
    @State var poleconPresented = true
    @State var lifestylePresented = true
    @State var artsPresented = true
    
    var body: some View {
        VStack {
            AgendaView(ClubsArray: $array, show: $show, date: $date, affinitiesPresented: $affinitiesPresented, activismPresented: $activismPresented, stemPresented: $stemPresented, poleconPresented: $poleconPresented, lifestylePresented: $lifestylePresented, artsPresented: $artsPresented)
//                .onTapGesture {
//                    self.show.toggle()
//                    let impactHeavy = UIImpactFeedbackGenerator(style: .rigid)
//                    impactHeavy.impactOccurred()
//                }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack {
                    Menu {
                        Button(action: {
                            affinitiesPresented = true
                            activismPresented = true
                            stemPresented = true
                            poleconPresented = true
                            lifestylePresented = true
                            artsPresented = true
                        }) {
                            if affinitiesPresented && activismPresented && stemPresented && poleconPresented && lifestylePresented && artsPresented {
                                Label("All Clubs", systemImage: "checkmark")
                            } else {
                                Text("All Clubs")
                            }
                        }
                        Divider()
                        Group {
                            Button(action: {
                                affinitiesPresented = true
                                activismPresented = false
                                stemPresented = false
                                poleconPresented = false
                                lifestylePresented = false
                                artsPresented = false
                            }) {
                                if affinitiesPresented && activismPresented == false && stemPresented == false && poleconPresented == false && lifestylePresented == false && artsPresented == false {
                                    Label("Affinities", systemImage: "checkmark")
                                } else {
                                    Text("Affinities")
                                }
                            }
                            Button(action: {
                                affinitiesPresented = false
                                activismPresented = true
                                stemPresented = false
                                poleconPresented = false
                                lifestylePresented = false
                                artsPresented = false
                            }) {
                                if affinitiesPresented == false && activismPresented && stemPresented == false && poleconPresented == false && lifestylePresented == false && artsPresented == false {
                                    Label("Activism", systemImage: "checkmark")
                                } else {
                                    Text("Activism")
                                }
                            }
                            Button(action: {
                                affinitiesPresented = false
                                activismPresented = false
                                stemPresented = false
                                poleconPresented = false
                                lifestylePresented = false
                                artsPresented = true
                            }) {
                                if affinitiesPresented == false && activismPresented == false && stemPresented == false && poleconPresented == false && lifestylePresented == false && artsPresented {
                                    Label("Arts", systemImage: "checkmark")
                                } else {
                                    Text("Arts")
                                }
                            }
                            Button(action: {
                                affinitiesPresented = false
                                activismPresented = false
                                stemPresented = false
                                poleconPresented = false
                                lifestylePresented = true
                                artsPresented = false
                            }) {
                                if affinitiesPresented == false && activismPresented == false && stemPresented == false && poleconPresented == false && lifestylePresented && artsPresented == false {
                                    Label("Lifestyle", systemImage: "checkmark")
                                } else {
                                    Text("Lifestyle")
                                }
                            }
                            Button(action: {
                                affinitiesPresented = false
                                activismPresented = false
                                stemPresented = false
                                poleconPresented = true
                                lifestylePresented = false
                                artsPresented = false
                            }) {
                                if affinitiesPresented == false && activismPresented == false && stemPresented == false && poleconPresented && lifestylePresented == false && artsPresented == false {
                                    Label("Politics", systemImage: "checkmark")
                                } else {
                                    Text("Politics")
                                }
                            }
                            Button(action: {
                                affinitiesPresented = false
                                activismPresented = false
                                stemPresented = true
                                poleconPresented = false
                                lifestylePresented = false
                                artsPresented = false
                            }) {
                                if affinitiesPresented == false && activismPresented == false && stemPresented && poleconPresented == false && lifestylePresented == false && artsPresented == false {
                                    Label("STEM", systemImage: "checkmark")
                                } else {
                                    Text("STEM")
                                }
                            }
                        }
                    } label: {
                        if affinitiesPresented && activismPresented && stemPresented && poleconPresented && lifestylePresented && artsPresented {
                            Image(systemName: "line.horizontal.3.decrease.circle")
                                .font(.system(size: 22))
                                .padding(.trailing)
                        } else {
                            Image(systemName: "line.horizontal.3.decrease.circle.fill")
                                .font(.system(size: 22))
                                .padding(.trailing)
                        }
                    }
                    Menu {
                        Button(action: {
                            openURL(URL(string: "https://calendar.google.com/calendar/ical/thecollegepreparatoryschool.org_3533373834333333373533%40resource.calendar.google.com/public/basic.ics")!)
                        }, label: {
                            Text("Export to iCalendar")
                        })
                        Button(action: {
                            openURL(URL(string: "https://calendar.google.com/calendar/u/0?cid=dGhlY29sbGVnZXByZXBhcmF0b3J5c2Nob29sLm9yZ18zNTMzMzczODM0MzMzMzMzMzczNTMzQHJlc291cmNlLmNhbGVuZGFyLmdvb2dsZS5jb20")!)
                        }, label: {
                            Text("Export to Google Calendar")
                        })
                        Divider()
                        Button("Copy Address") {
                            UIPasteboard.general.string = "https://calendar.google.com/calendar/ical/thecollegepreparatoryschool.org_3533373834333333373533%40resource.calendar.google.com/public/basic.ics"
                        }
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                            .font(.system(size: 20))
                        //                        .foregroundColor(Color("SystemToolbar"))
                    }
                }
            }
        }
        .navigationBarTitle("Clubs")
        .navigationBarTitleDisplayMode(.inline)
    }
}
