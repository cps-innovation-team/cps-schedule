//
//  QuickLinksWidgetiOS.swift
//  QuickLinksWidgetiOS
//
//  Created by Rahim Malik on 3/20/21.
//  Copyright © 2021 Rahim Malik. All rights reserved.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: QuickLinkSelectionIntent(), quickLink: .dashboard)
    }

    func getSnapshot(for configuration: QuickLinkSelectionIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration, quickLink: quicklink(for: configuration))
        completion(entry)
    }
    
    func quicklink(for configuration: QuickLinkSelectionIntent) -> QuickLinkEnum {
        switch configuration.QuickLinks {
            case .dashboard: return .dashboard
            case .schedule: return .schedule
//            case .clubs: return .clubs
//            case .sports: return .sports
            default: return .dashboard
        }
    }

    func getTimeline(for configuration: QuickLinkSelectionIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration, quickLink: quicklink(for: configuration))
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: QuickLinkSelectionIntent
    let quickLink: QuickLinkEnum
}

enum QuickLinkEnum {
    case dashboard, schedule, clubs, sports
}

struct QuickLinksWidgetiOSEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var family
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
                switch entry.quickLink {
                    case .dashboard: return AnyView(
                        VStack {
                            HStack{
                                Image(systemName: "speedometer")
                                    .font(.largeTitle)
                                    .foregroundColor(Color("Clementine"))
                                Spacer()
                            }.padding()
                            Spacer()
                            HStack {
                                Text("Dashboard")
                                    .fontWeight(.bold)
                                Spacer()
                            }.padding()
                        }.background(Color("SystemGray6"))
                        .widgetURL(URL(string: "cps-schedule://dashboard/"))
                    )
                    case .schedule: return AnyView(
                        VStack {
                            HStack{
                                Image(systemName: "calendar")
                                    .font(.largeTitle)
                                    .foregroundColor(Color("AccentColor"))
                                Spacer()
                            }.padding()
                            Spacer()
                            HStack {
                                Text("Schedule")
                                    .fontWeight(.bold)
                                Spacer()
                            }.padding()
                        }.background(Color("SystemGray6"))
                        .widgetURL(URL(string: "cps-schedule://schedule/"))
                    )
                    default: return AnyView(
                        VStack {
                            HStack{
                                Image(systemName: "speedometer")
                                    .font(.largeTitle)
                                    .foregroundColor(Color("Clementine"))
                                Spacer()
                            }.padding()
                            Spacer()
                            HStack {
                                Text("Dashboard")
                                    .fontWeight(.bold)
                                Spacer()
                            }.padding()
                        }.background(Color("SystemGray6"))
                        .widgetURL(URL(string: "cps-schedule://dashboard/"))
                    )
//                    case .clubs: return AnyView(
//                        VStack {
//                            HStack{
//                                Image(systemName: "person.2.fill")
//                                    .font(.largeTitle)
//                                    .foregroundColor(Color("AccentColor"))
//                                Spacer()
//                            }.padding()
//                            Spacer()
//                            HStack {
//                                Text("Clubs")
//                                    .fontWeight(.bold)
//                                Spacer()
//                            }.padding()
//                        }.background(Color("SystemGray6"))
//                        .widgetURL(URL(string: "cps-schedule://clubs/"))
//                    )
//                    case .sports: return AnyView(
//                        VStack {
//                            HStack{
//                                Image(systemName: "rosette")
//                                    .font(.largeTitle)
//                                    .foregroundColor(Color("QLGreen"))
//                                Spacer()
//                            }.padding()
//                            Spacer()
//                            HStack {
//                                Text("Sports")
//                                    .fontWeight(.bold)
//                                Spacer()
//                            }.padding()
//                        }.background(Color("SystemGray6"))
//                        .widgetURL(URL(string: "cps-schedule://sports/"))
//                    )
                }
    }
}

@main
struct QuickLinksWidgetiOS: Widget {
    let kind: String = "QuickLinksWidgetiOS"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: QuickLinkSelectionIntent.self, provider: Provider()) { entry in
            QuickLinksWidgetiOSEntryView(entry: entry)
        }
        .configurationDisplayName("QuickLink")
        .description("Access a configurable QuickLink.")
        .supportedFamilies([.systemSmall])
    }
}
