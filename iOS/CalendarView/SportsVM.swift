//
//  SportsVM.swift
//  Schedule (iOS)
//
//  Created by Rahim Malik on 2/19/21.
//  Copyright © 2021 Rahim Malik. All rights reserved.
//

import SwiftUI
import DynamicColor

struct SportsBadge: View {
    let sportType: String
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color(getSportType(input: sportType).color.tinted(amount: 0.15)))
            if getSportType(input: sportType).name == "Track & Field" {
                ZStack {
                    HStack {
                        Spacer().frame(width: 10)
                        Text("🏃‍♂️")
                            .font(Font.system(size: 32))
                    }
                    HStack {
                        Text("🏃‍♀️")
                            .font(Font.system(size: 32))
                        Spacer().frame(width: 10)
                    }
                }
            } else {
                Text(getSportType(input: sportType).emoji)
                    .font(Font.system(size: 36))
            }
        }
    }
}

struct QLSportsViewUpcoming: View {
    
    var SportsArray: [EventCalModel.Item]
    @Binding var date: Date
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.openURL) var openURL
    
    var body: some View {
        
        VStack {
            ForEach(SportsArray.sorted { $0.dateTime < $1.dateTime }, id: \.id) { item in
//                if item.description.lowercased() == "" {
                        if item.dateTime != "" && item.endDateTime != "" {
                            VStack {
                                HStack {
                                    SportsBadge(sportType: item.summary).frame(width: 55, height: 55)
                                    VStack(spacing: 0) {
                                        if item.summary.contains("JV") {
                                            HStack {
                                                Text("JV \(cleanSummary(input: item.summary))")
                                                    .font(.system(size: 14))
                                                    .fontWeight(.semibold)
                                                    .multilineTextAlignment(.leading)
                                                Spacer()
                                            }
                                        } else {
                                            HStack {
                                                Text(cleanSummary(input: item.summary))
                                                    .font(.system(size: 14))
                                                    .fontWeight(.semibold)
                                                    .multilineTextAlignment(.leading)
                                                Spacer()
                                            }
                                        }
                                        if "\(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "h:mm", convertDate: item.dateTime)) - \(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "h:mm", convertDate: item.endDateTime))" == "12:00 - 12:00" {
                                            HStack {
                                                Text("all-day")
                                                    .font(.system(size: 14))
                                                    .multilineTextAlignment(.leading)
                                                Spacer()
                                            }
                                        }
                                        else {
                                            HStack {
                                                Text("\(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "M", convertDate: item.dateTime))/\(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "d", convertDate: item.dateTime)) \(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "h:mm", convertDate: item.dateTime)) - \(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "h:mm", convertDate: item.endDateTime))")
                                                    .font(.system(size: 14))
                                                    .multilineTextAlignment(.leading)
                                                Spacer()
                                            }
                                        }
                                    }.padding(.leading, 5)
                                    if item.summary.lowercased().contains("home") {
                                        Text("home")
                                            .font(Font.custom("HelveticaNeue-CondensedBold", size: 28))
                                            .foregroundColor(colorScheme == .light ? Color(getSportType(input: item.summary).color.shaded(amount: 0.25)) : Color(getSportType(input: item.summary).color.shaded(amount: 0.25)))
                                    } else if item.summary.lowercased().contains("away") {
                                        Text("away")
                                            .font(Font.custom("HelveticaNeue-CondensedBold", size: 28))
                                            .foregroundColor(colorScheme == .light ? Color(getSportType(input: item.summary).color.shaded(amount: 0.25)) : Color(getSportType(input: item.summary).color.shaded(amount: 0.25)))
                                    }
                                }
                            }
                        }
//                }
            }
        }
    }
}

struct QLSportsViewResults: View {
    
    var SportsArray: [EventCalModel.Item]
    @Binding var date: Date
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.openURL) var openURL
    
    var body: some View {
        VStack {
            ForEach(SportsArray.sorted { $1.dateTime < $0.dateTime }, id: \.id) { item in
//                if item.description.lowercased() != "" && item.description.lowercased().contains("away") == false && item.description.lowercased().contains("home") == false {
                        if item.dateTime != "" {
                            VStack {
                                HStack {
                                    SportsBadge(sportType: item.summary).frame(width: 55, height: 55)
                                    VStack(spacing: 0) {
                                        if item.summary.contains("JV") {
                                            HStack {
                                                Text("JV \(cleanSummary(input: item.summary))")
                                                    .font(.system(size: 14))
                                                    .fontWeight(.semibold)
                                                    .multilineTextAlignment(.leading)
                                                Spacer()
                                            }
                                        } else {
                                            HStack {
                                                Text(cleanSummary(input: item.summary))
                                                    .font(.system(size: 14))
                                                    .fontWeight(.semibold)
                                                    .multilineTextAlignment(.leading)
                                                Spacer()
                                            }
                                        }
                                        if "\(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "h:mm", convertDate: item.dateTime)) - \(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "h:mm", convertDate: item.endDateTime))" == "12:00 - 12:30" {
                                            HStack {
                                                Text("\(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "M", convertDate: item.dateTime))/\(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "d", convertDate: item.dateTime))")
                                                    .font(.system(size: 14))
                                                    .multilineTextAlignment(.leading)
                                                Spacer()
                                            }
                                        }
                                        else {
                                            HStack {
                                                Text("\(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "M", convertDate: item.dateTime))/\(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "d", convertDate: item.dateTime)) \(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "h:mm", convertDate: item.dateTime)) - \(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "h:mm", convertDate: item.endDateTime))")
                                                    .font(.system(size: 14))
                                                    .multilineTextAlignment(.leading)
                                                Spacer()
                                            }
                                        }
                                    }.padding(.leading, 5)
                                    if item.description != "" {
                                    Text(item.description.lowercased())
                                        .font(Font.custom("HelveticaNeue-CondensedBold", size: 28))
                                        .foregroundColor(colorScheme == .light ? Color(getSportType(input: item.summary).color.shaded(amount: 0.25)) : Color(getSportType(input: item.summary).color.shaded(amount: 0.25)))
                                    } else {
                                        if item.summary.lowercased().contains("home") {
                                            Text("home")
                                                .font(Font.custom("HelveticaNeue-CondensedBold", size: 28))
                                                .foregroundColor(colorScheme == .light ? Color(getSportType(input: item.summary).color.shaded(amount: 0.25)) : Color(getSportType(input: item.summary).color.shaded(amount: 0.25)))
                                        } else if item.summary.lowercased().contains("away") {
                                            Text("away")
                                                .font(Font.custom("HelveticaNeue-CondensedBold", size: 28))
                                                .foregroundColor(colorScheme == .light ? Color(getSportType(input: item.summary).color.shaded(amount: 0.25)) : Color(getSportType(input: item.summary).color.shaded(amount: 0.25)))
                                        }
                                    }
                                }
                            }
                        }
//                }
            }
        }
    }
}

struct SportsVM: View {
    
    @Binding var SportsArray: [EventCalModel.Item]
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.openURL) var openURL
    @Binding var date: Date
    
    @State var pickerValue = 0
    
    @Binding var bcrosscountryPresented: Bool
    @Binding var gcrosscountryPresented: Bool
    @Binding var golfPresented: Bool
    @Binding var gtennisPresented: Bool
    @Binding var trackandfieldPresented: Bool
    @Binding var btennisPresented: Bool
    @Binding var baseballPresented: Bool
    @Binding var softballPresented: Bool
    @Binding var bvolleyballPresented: Bool
    @Binding var gvolleyballPresented: Bool
    @Binding var bswimmingPresented: Bool
    @Binding var gswimmingPresented: Bool
    @Binding var bsoccerPresented: Bool
    @Binding var gsoccerPresented: Bool
    @Binding var bbasketballPresented: Bool
    @Binding var gbasketballPresented: Bool
    
    var body: some View {
        
//        NavigationView {
//            GeometryReader { geo in
                ScrollView(.vertical) {
                    Picker("Sports", selection: $pickerValue) {
                        Text("Upcoming").tag(0)
                        Text("Results").tag(1)
                    }
                    .labelsHidden()
                    .pickerStyle(SegmentedPickerStyle())
                    .padding([.horizontal])
                    .padding(.vertical, 7)
                    if pickerValue == 0 {
                        ForEach(SportsArray.sorted { $0.dateTime < $1.dateTime }.filter {
                            if ($0.dateTime != "" && getDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "dd", convertDate: $0.dateTime) >= Date()) || ($0.start != "" && getDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:s", conVertFormate: "dd", convertDate: $0.start) >= Date()) {
                                return true
                            } else {
                                return false
                            }
                        }, id: \.id) { item in
                            if item.description.lowercased() == "" {
                                    if (getSportType(input: item.summary).name == "Boys Cross Country" && bcrosscountryPresented) || (getSportType(input: item.summary).name == "Girls Cross Country" && gcrosscountryPresented) || (getSportType(input: item.summary).name == "Golf" && golfPresented) || (getSportType(input: item.summary).name == "Girls Tennis" && gtennisPresented) || (getSportType(input: item.summary).name == "Track & Field" && trackandfieldPresented) || (getSportType(input: item.summary).name == "Boys Tennis" && btennisPresented) || (getSportType(input: item.summary).name == "Baseball" && baseballPresented) || (getSportType(input: item.summary).name == "Softball" && softballPresented) || (getSportType(input: item.summary).name == "Boys Volleyball" && bvolleyballPresented) || (getSportType(input: item.summary).name == "Girls Volleyball" && gvolleyballPresented) || (getSportType(input: item.summary).name == "Boys Swimming" && bswimmingPresented) || (getSportType(input: item.summary).name == "Girls Swimming" && gswimmingPresented) || (getSportType(input: item.summary).name == "Boys Soccer" && bsoccerPresented) || (getSportType(input: item.summary).name == "Girls Soccer" && gsoccerPresented) || (getSportType(input: item.summary).name == "Boys Basketball" && bbasketballPresented) || (getSportType(input: item.summary).name == "Girls Basketball" && gbasketballPresented) {
                                        if item.dateTime != "" && item.endDateTime != "" {
                                            VStack {
                                                HStack {
                                                    SportsBadge(sportType: item.summary).frame(width: 55, height: 55)
                                                    VStack(spacing: 0) {
                                                        if item.summary.contains("JV") {
                                                            HStack {
                                                                Text("JV \(cleanSummary(input: item.summary))")
                                                                    .font(.system(size: 14))
                                                                    .fontWeight(.semibold)
                                                                    .multilineTextAlignment(.leading)
                                                                Spacer()
                                                            }
                                                        } else {
                                                            HStack {
                                                                Text(cleanSummary(input: item.summary))
                                                                    .font(.system(size: 14))
                                                                    .fontWeight(.semibold)
                                                                    .multilineTextAlignment(.leading)
                                                                Spacer()
                                                            }
                                                        }
                                                        if "\(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "h:mm", convertDate: item.dateTime)) - \(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "h:mm", convertDate: item.endDateTime))" == "12:00 - 12:30" {
                                                            HStack {
                                                                Text("\(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "M", convertDate: item.dateTime))/\(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "d", convertDate: item.dateTime))")
                                                                    .font(.system(size: 14))
                                                                    .multilineTextAlignment(.leading)
                                                                Spacer()
                                                            }
                                                        }
                                                        else {
                                                            HStack {
                                                                Text("\(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "M", convertDate: item.dateTime))/\(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "d", convertDate: item.dateTime)) \(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "h:mm", convertDate: item.dateTime)) - \(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "h:mm", convertDate: item.endDateTime))")
                                                                    .font(.system(size: 14))
                                                                    .multilineTextAlignment(.leading)
                                                                Spacer()
                                                            }
                                                        }
                                                    }.padding(.leading, 5)
                                                    if item.summary.lowercased().contains("home") {
                                                        Text("home")
                                                            .font(Font.custom("HelveticaNeue-CondensedBold", size: 28))
                                                            .foregroundColor(colorScheme == .light ? Color(getSportType(input: item.summary).color.shaded(amount: 0.25)) : Color(getSportType(input: item.summary).color.shaded(amount: 0.25)))
                                                    } else if item.summary.lowercased().contains("away") {
                                                        Text("away")
                                                            .font(Font.custom("HelveticaNeue-CondensedBold", size: 28))
                                                            .foregroundColor(colorScheme == .light ? Color(getSportType(input: item.summary).color.shaded(amount: 0.25)) : Color(getSportType(input: item.summary).color.shaded(amount: 0.25)))
                                                    }
                                                }
                                            }.padding(.horizontal)
                                        }
                                    }
                            }
                        }
                    } else {
                        Text("Updated Weekly")
                            .font(.caption)
                            .foregroundColor(.gray)
                        ForEach(SportsArray.sorted { $1.dateTime < $0.dateTime }.filter {
                            if ($0.dateTime != "" && getDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "dd", convertDate: $0.dateTime) < Date()) || ($0.start != "" && getDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "dd", convertDate: $0.start) < Date()) {
                                return true
                            } else {
                                return false
                            }
                        }, id: \.id) { item in
        //                    if item.description.lowercased() != "" {
                                    if (getSportType(input: item.summary).name == "Boys Cross Country" && bcrosscountryPresented) || (getSportType(input: item.summary).name == "Girls Cross Country" && gcrosscountryPresented) || (getSportType(input: item.summary).name == "Golf" && golfPresented) || (getSportType(input: item.summary).name == "Girls Tennis" && gtennisPresented) || (getSportType(input: item.summary).name == "Track & Field" && trackandfieldPresented) || (getSportType(input: item.summary).name == "Boys Tennis" && btennisPresented) || (getSportType(input: item.summary).name == "Baseball" && baseballPresented) || (getSportType(input: item.summary).name == "Softball" && softballPresented) || (getSportType(input: item.summary).name == "Boys Volleyball" && bvolleyballPresented) || (getSportType(input: item.summary).name == "Girls Volleyball" && gvolleyballPresented) || (getSportType(input: item.summary).name == "Boys Swimming" && bswimmingPresented) || (getSportType(input: item.summary).name == "Girls Swimming" && gswimmingPresented) || (getSportType(input: item.summary).name == "Boys Soccer" && bsoccerPresented) || (getSportType(input: item.summary).name == "Girls Soccer" && gsoccerPresented) || (getSportType(input: item.summary).name == "Boys Basketball" && bbasketballPresented) || (getSportType(input: item.summary).name == "Girls Basketball" && gbasketballPresented) {
                                        if item.dateTime != "" && item.endDateTime != "" {
                                            VStack {
                                                HStack {
                                                    SportsBadge(sportType: item.summary).frame(width: 55, height: 55)
                                                    VStack(spacing: 0) {
                                                        if item.summary.contains("JV") {
                                                            HStack {
                                                                Text("JV \(cleanSummary(input: item.summary))")
                                                                    .font(.system(size: 14))
                                                                    .fontWeight(.semibold)
                                                                    .multilineTextAlignment(.leading)
                                                                Spacer()
                                                            }
                                                        } else {
                                                            HStack {
                                                                Text(cleanSummary(input: item.summary))
                                                                    .font(.system(size: 14))
                                                                    .fontWeight(.semibold)
                                                                    .multilineTextAlignment(.leading)
                                                                Spacer()
                                                            }
                                                        }
                                                        if "\(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "h:mm", convertDate: item.dateTime)) - \(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "h:mm", convertDate: item.endDateTime))" == "12:00 - 12:30" {
                                                            HStack {
                                                                Text("\(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "M", convertDate: item.dateTime))/\(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "d", convertDate: item.dateTime))")
                                                                    .font(.system(size: 14))
                                                                    .multilineTextAlignment(.leading)
                                                                Spacer()
                                                            }
                                                        }
                                                        else {
                                                            HStack {
                                                                Text("\(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "M", convertDate: item.dateTime))/\(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "d", convertDate: item.dateTime)) \(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "h:mm", convertDate: item.dateTime)) - \(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "h:mm", convertDate: item.endDateTime))")
                                                                    .font(.system(size: 14))
                                                                    .multilineTextAlignment(.leading)
                                                                Spacer()
                                                            }
                                                        }
                                                    }.padding(.leading, 5)
                                                    if item.description != "" {
                                                        Text(item.description.lowercased())
                                                            .font(Font.custom("HelveticaNeue-CondensedBold", size: 28))
                                                            .foregroundColor(colorScheme == .light ? Color(getSportType(input: item.summary).color.shaded(amount: 0.25)) : Color(getSportType(input: item.summary).color.shaded(amount: 0.25)))
                                                    } else {
                                                        if item.summary.lowercased().contains("home") {
                                                            Text("home")
                                                                .font(Font.custom("HelveticaNeue-CondensedBold", size: 28))
                                                                .foregroundColor(colorScheme == .light ? Color(getSportType(input: item.summary).color.shaded(amount: 0.25)) : Color(getSportType(input: item.summary).color.shaded(amount: 0.25)))
                                                        } else if item.summary.lowercased().contains("away") {
                                                            Text("away")
                                                                .font(Font.custom("HelveticaNeue-CondensedBold", size: 28))
                                                                .foregroundColor(colorScheme == .light ? Color(getSportType(input: item.summary).color.shaded(amount: 0.25)) : Color(getSportType(input: item.summary).color.shaded(amount: 0.25)))
                                                        }
                                                    }
                                                }
                                            }.padding(.horizontal)
                                        }
        //                            }
                            }
                        }
                    }
                    Spacer().frame(height: 10)
                }
//            }
//        }
    }
}

class SportType: Hashable {
    static func == (lhs: SportType, rhs: SportType) -> Bool {
        lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    var name: String
    var emoji: String
    var color: UIColor
    
    init(name: String, emoji: String, color: UIColor) {
        self.name = name
        self.emoji = emoji
        self.color = color
    }
}

func getSportType(input: String) -> SportType {
    let switcher = input.lowercased()
    switch switcher {
        
        case let str where str.contains("boys varsity cross country"):
            return SportType(name: "Boys Cross Country", emoji: "🏃", color: UIColor(Color("Cross Country")))
            
        case let str where str.contains("girls varsity cross country"):
            return SportType(name: "Girls Cross Country", emoji: "🏃‍♀️", color: UIColor(Color("Golf")))
            
        case let str where str.contains("coed varsity golf"):
            return SportType(name: "Golf", emoji: "🏌️", color: UIColor(Color("Boys Tennis")))
            
        case let str where str.contains("girls varsity tennis"):
            return SportType(name: "Girls Tennis", emoji: "🎾", color: UIColor(Color("Girls Tennis")))
            
        case let str where str.contains("boys varsity tennis"):
            return SportType(name: "Boys Tennis", emoji: "🎾", color: UIColor(Color("Boys Tennis")))
            
        case let str where str.contains("track and field"):
            return SportType(name: "Track & Field", emoji: "🏃", color: UIColor(Color("Cross Country")))
            
        case let str where str.contains("track & field"):
            return SportType(name: "Track & Field", emoji: "🏃", color: UIColor(Color("Cross Country")))
            
        case let str where str.contains("varsity baseball"):
            return SportType(name: "Baseball", emoji: "⚾️", color: UIColor(Color("Baseball")))
            
        case let str where str.contains("softball"):
            return SportType(name: "Softball", emoji: "🥎", color: UIColor(Color("Softball")))
            
        case let str where str.contains("boys varsity volleyball"):
            return SportType(name: "Boys Volleyball", emoji: "🏐", color: UIColor(Color("Boys Volleyball")))
            
        case let str where str.contains("girls varsity volleyball"):
            return SportType(name: "Girls Volleyball", emoji: "🏐", color: UIColor(Color("Girls Volleyball")))
            
        case let str where str.contains("girls jv volleyball"):
            return SportType(name: "Girls Volleyball", emoji: "🏐", color: UIColor(Color("Girls Volleyball")))
            
        case let str where str.contains("boys varsity swimming"):
            return SportType(name: "Boys Swimming", emoji: "🏊", color: UIColor(Color("Golf")))
            
        case let str where str.contains("girls varsity swimming"):
            return SportType(name: "Girls Swimming", emoji: "🏊‍♀️", color: UIColor(Color("Girls Swimming")))
            
        case let str where str.contains("boys varsity soccer"):
            return SportType(name: "Boys Soccer", emoji: "⚽", color: UIColor(Color("Boys Soccer")))
            
        case let str where str.contains("girls varsity soccer"):
            return SportType(name: "Girls Soccer", emoji: "⚽", color: UIColor(Color("Girls Soccer")))
            
        case let str where str.contains("boys varsity basketball"):
            return SportType(name: "Boys Basketball", emoji: "🏀", color: UIColor(Color("Boys Basketball")))
            
        case let str where str.contains("boys jv basketball"):
            return SportType(name: "Boys Basketball", emoji: "🏀", color: UIColor(Color("Boys Basketball")))
            
        case let str where str.contains("girls varsity basketball"):
            return SportType(name: "Girls Basketball", emoji: "🏀", color: UIColor(Color("Girls Basketball")))
            
        default:
            return SportType(name: "Other Sport", emoji: "🏅", color: .systemGray)
            
    }
}

func DateChecker2(dateRow: Date) -> Bool {
    if dateRow > Calendar.current.date(byAdding: .day, value: -3, to: Date())! && dateRow < Calendar.current.date(byAdding: .day, value: 3, to: Date())! {
        return true
    } else {
        return false
    }
}

func DateCheckerU(dateRow: Date) -> Bool {
    if dateRow > Calendar.current.date(byAdding: .day, value: 0, to: Date())! && dateRow < Calendar.current.date(byAdding: .day, value: 3, to: Date())! {
        return true
    } else {
        return false
    }
}

func DateCheckerR(dateRow: Date) -> Bool {
    if dateRow > Calendar.current.date(byAdding: .day, value: -3, to: Date())! && dateRow < Calendar.current.date(byAdding: .day, value: 0, to: Date())! {
        return true
    } else {
        return false
    }
}

func cleanSummary(input: String) -> String {
    var input2 = input
    var urlextract = "sportextract"
    urlextract = ".*? - Game "
    if matches(for: urlextract, in: input2).count >= 1 {
        input2 = input2.replacingOccurrences(of: urlextract, with: "", options: .regularExpression)
    }
    input2 = input2.replacingOccurrences(of: " - Away", with: "", options: .regularExpression)
    input2 = input2.replacingOccurrences(of: " - Home", with: "", options: .regularExpression)
    input2 = input2.replacingOccurrences(of: "- Away", with: "", options: .regularExpression)
    input2 = input2.replacingOccurrences(of: "- Home", with: "", options: .regularExpression)
    if input2 == "" {
        return ("CPS v ?")
    } else {
        return ("CPS v \(input2)")
    }
}

func matches(for regex: String, in text: String) -> [String] {
    
    do {
        let regex = try NSRegularExpression(pattern: regex)
        let results = regex.matches(in: text,
                                    range: NSRange(text.startIndex..., in: text))
        return results.map {
            String(text[Range($0.range, in: text)!])
        }
    } catch let error {
        print("invalid regex: \(error.localizedDescription)")
        return []
    }
}
