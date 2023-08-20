//
//  ScheduleWidget_iOS_.swift
//  ScheduleWidget(iOS)
//
//  Created by Rahim Malik on 2/12/21.
//  Copyright © 2021 Rahim Malik. All rights reserved.
//

import WidgetKit
import SwiftUI
import DynamicColor

func setDate(hour: Int, minute: Int) -> Date {
    var components = DateComponents()
    components.hour = hour
    components.minute = minute
    components.day = Calendar.current.component(.day, from: Date())
    components.month = Calendar.current.component(.month, from: Date())
    components.year = Calendar.current.component(.year, from: Date())
    let userCalendar = Calendar.current
    let someDateTime = userCalendar.date(from: components)
    return(someDateTime) ?? Date()
}

func createDate2(hour: Int, minute: Int) -> Date {
    var components = DateComponents()
    components.hour = hour
    components.minute = minute
    components.day = Calendar.current.component(.day, from: Date())
    components.month = Calendar.current.component(.month, from: Date())
    components.year = Calendar.current.component(.year, from: Date())
    components.timeZone = TimeZone(abbreviation: "PDT")
    let userCalendar = Calendar.current
    let someDateTime = userCalendar.date(from: components)
    return(someDateTime) ?? Date()
}

struct Provider: TimelineProvider {
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), relevance: nil)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        let entry = SimpleEntry(date: Date(), relevance: nil)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        var entries: [SimpleEntry] = []
        
        let timeDates : [Date] = [createDate2(hour: 7, minute: 00), createDate2(hour: 11, minute: 20), createDate2(hour: 11, minute: 35), createDate2(hour: 11, minute: 45), createDate2(hour: 11, minute: 55), createDate2(hour: 15, minute: 30), Calendar.current.date(byAdding: .hour, value: 24, to: createDate2(hour: 6, minute: 00))!]
        
        let relevance = TimelineEntryRelevance(score: 1, duration: 15)
        for date in timeDates {
            let entryDate = date
            let entry = SimpleEntry(date: entryDate, relevance: relevance)
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let relevance: TimelineEntryRelevance?
}

struct WidgetCell: View {
    let color: Color
    let title: String
    let timestamp: String
    let sizebool: Bool
    
    var body: some View {
        HStack {
            Capsule()
                .foregroundColor(color)
                .frame(width: 5, height: 17)
            Text(title)
                .foregroundColor(color)
                .fontWeight(.semibold)
                .font(.system(size: 13))
                .lineLimit(1)
            Spacer()
            if sizebool {
                Text(timestamp)
                    .foregroundColor(color)
                    .fontWeight(.medium)
                    .font(.system(size: 13))
                    .lineLimit(1)
            }
        }
    }
}


struct ScheduleWidget_iOS_EntryView : View {
    @State var entry: Provider.Entry
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.widgetFamily) var family
    @Environment(\.openURL) var openURL
    
    var body: some View {
        switch family {
            case .systemSmall:
                return AnyView(
                    ZStack {
                        VStack(spacing: 0) {
                            HStack {
                                Text("SCHEDULE")
                                    .font(.system(size: 16))
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(.secondaryLabel))
                                Spacer()
//                                Link(destination: URL(string: "cps-schedule://dashboard/")!, label: {
//                                    Image(systemName: "calendar")
//                                        .foregroundColor(Color("AccentColor"))
//                                        .font(.system(size: 20))
//                                })
                            }
                            if widgetModel(weekofyear: Calendar.current.component(.weekOfYear, from: Date()), currentDate: Date(), sizebool: false) == [] { Spacer() }
                            else {
                                Spacer()
                                VStack(spacing: 5) {
                                    ForEach(widgetModel(weekofyear: Calendar.current.component(.weekOfYear, from: Date()), currentDate: Date(), sizebool: false)) { block in
                                        WidgetCell(color: colorScheme == .light ? Color(block.currentBlockColor.shaded(amount: 0.25)) : Color(block.currentBlockColor.tinted(amount: 0.25)), title: block.currentBlockName, timestamp: block.currentBlockTime, sizebool: false)
                                    }
                                }
                                .padding(.leading, -2)
                                if widgetModel(weekofyear: Calendar.current.component(.weekOfYear, from: Date()), currentDate: Date(), sizebool: false)[0].currentBlockTime.contains("8:30") {
                                    Text("+4 Classes")
                                        .foregroundColor(colorScheme == .light ? Color(systemGray.shaded(amount: 0.5)) : Color(systemGray.tinted(amount: 0.5)))
                                        .fontWeight(.regular)
                                        .font(.system(size: 11))
                                        .padding(.top, 4)
                                } else {
                                    Spacer()
                                }
                            }
                        }.padding()
                        if widgetModel(weekofyear: Calendar.current.component(.weekOfYear, from: Date()), currentDate: Date(), sizebool: false) == [] {
                            Spacer()
                            VStack {
                                Text("No Classes")
                                    .font(.system(size: 16))
                            }
                            Spacer()
                        }
                    }.background(Color("WidgetBackground"))
                )
            case .systemMedium:
                return AnyView(
                    ZStack {
                        VStack(spacing: 0) {
                            HStack {
                                Text("SCHEDULE")
                                    .font(.system(size: 16))
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(.secondaryLabel))
                                Spacer()
                                Link(destination: URL(string: "cps-schedule://schedule/")!, label: {
                                    Image(systemName: "calendar")
                                        .foregroundColor(Color("AccentColor"))
                                        .font(.system(size: 20))
                                })
                            }
                            if widgetModel(weekofyear: Calendar.current.component(.weekOfYear, from: Date()), currentDate: Date(), sizebool: false) == [] { Spacer() }
                            else {
                                Spacer()
                                VStack(spacing: 5) {
                                    ForEach(widgetModel(weekofyear: Calendar.current.component(.weekOfYear, from: Date()), currentDate: Date(), sizebool: false)) { block in
                                        WidgetCell(color: colorScheme == .light ? Color(block.currentBlockColor.shaded(amount: 0.25)) : Color(block.currentBlockColor.tinted(amount: 0.25)), title: block.currentBlockName, timestamp: block.currentBlockTime, sizebool: true)
                                    }
                                }
                                .padding(.leading, -2)
                                if widgetModel(weekofyear: Calendar.current.component(.weekOfYear, from: Date()), currentDate: Date(), sizebool: false)[0].currentBlockTime.contains("8:30") {
                                    Text("+4 Classes")
                                        .foregroundColor(colorScheme == .light ? Color(systemGray.shaded(amount: 0.5)) : Color(systemGray.tinted(amount: 0.5)))
                                        .fontWeight(.regular)
                                        .font(.system(size: 11))
                                        .padding(.top, 4)
                                } else {
                                    Spacer()
                                }
                            }
                        }.padding()
                        if widgetModel(weekofyear: Calendar.current.component(.weekOfYear, from: Date()), currentDate: Date(), sizebool: false) == [] {
                            Spacer()
                            VStack {
                                Text("No Classes")
                                    .font(.system(size: 16))
                            }
                            Spacer()
                        }
                    }.background(Color("WidgetBackground"))
                )
            case .systemLarge:
                return AnyView(
                    ZStack {
                        VStack(spacing: 0) {
                            HStack {
                                Text("SCHEDULE")
                                    .font(.system(size: 16))
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(.secondaryLabel))
                                Spacer()
                                Link(destination: URL(string: "cps-schedule://schedule/")!, label: {
                                    Image(systemName: "calendar")
                                        .foregroundColor(Color("AccentColor"))
                                        .font(.system(size: 20))
                                })
                            }
                            if widgetModel(weekofyear: Calendar.current.component(.weekOfYear, from: Date()), currentDate: Date(), sizebool: true) == [] { Spacer() }
                            else {
                                Spacer()
                                VStack(spacing: 5) {
                                    ForEach(widgetModel(weekofyear: Calendar.current.component(.weekOfYear, from: Date()), currentDate: Date(), sizebool: true)) { block in
                                        WidgetCell(color: colorScheme == .light ? Color(block.currentBlockColor.shaded(amount: 0.25)) : Color(block.currentBlockColor.tinted(amount: 0.25)), title: block.currentBlockName, timestamp: block.currentBlockTime, sizebool: true)
                                    }
                                }
                                .padding(.leading, -2)
                                Spacer()
                            }
                        }.padding()
                        if widgetModel(weekofyear: Calendar.current.component(.weekOfYear, from: Date()), currentDate: Date(), sizebool: false) == [] {
                            Spacer()
                            VStack {
                                Text("No Classes")
                                    .font(.system(size: 16))
                            }
                            Spacer()
                        }
                    }.background(Color("WidgetBackground"))
                )
            default:
                return AnyView(
                    ZStack {
                        VStack(spacing: 0) {
                            HStack {
                                Text("SCHEDULE")
                                    .font(.system(size: 16))
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(.secondaryLabel))
                                Spacer()
                                Link(destination: URL(string: "cps-schedule://schedule/")!, label: {
                                    Image(systemName: "calendar")
                                        .foregroundColor(Color("AccentColor"))
                                        .font(.system(size: 20))
                                })
                            }
                            if widgetModel(weekofyear: Calendar.current.component(.weekOfYear, from: Date()), currentDate: Date(), sizebool: true) == [] { Spacer() }
                            else {
                                Spacer()
                                VStack(spacing: 5) {
                                    ForEach(widgetModel(weekofyear: Calendar.current.component(.weekOfYear, from: Date()), currentDate: Date(), sizebool: true)) { block in
                                        WidgetCell(color: colorScheme == .light ? Color(block.currentBlockColor.shaded(amount: 0.25)) : Color(block.currentBlockColor.tinted(amount: 0.25)), title: block.currentBlockName, timestamp: block.currentBlockTime, sizebool: true)
                                    }
                                }
                                .padding(.leading, -2)
                                Spacer()
                            }
                        }.padding()
                        if widgetModel(weekofyear: Calendar.current.component(.weekOfYear, from: Date()), currentDate: Date(), sizebool: false) == [] {
                            Spacer()
                            VStack {
                                Text("No Classes")
                                    .font(.system(size: 16))
                            }
                            Spacer()
                        }
                    }.background(Color("WidgetBackground"))
                )
        }
    }
}

@main
struct ScheduleWidget_iOS_: Widget {
    let kind: String = "ScheduleWidget_iOS_"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            ScheduleWidget_iOS_EntryView(entry: entry)
        }
        .configurationDisplayName("Schedule")
        .description("Check your day's classes at a glance.")
        .supportedFamilies([.systemSmall,.systemMedium])
    }
}
