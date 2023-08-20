//  ScheduleModel.swift
//  Schedule.app
//
//  Created by Rahim Malik on 7/18/20.
//  Copyright © 2020 Rahim Malik. All rights reserved.

import SwiftUI
import DynamicColor
import Foundation
import Combine

let cornerRad = 13.5

struct passingBlockScheduleView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        Capsule()
            .foregroundColor(Color("SystemGray5"))
    }
}

struct universalBlock: View {
    
    var boolValue: Bool
    var height: CGFloat
    var color: NSColor
    var name: String
    var timeRange: String
    var block: String?
    var date: Date
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.openURL) var openURL
    @Binding var array: [Entry]
    
    var body: some View {
        ZStack {
            if boolValue == false {
                RoundedRectangle(cornerSize: CGSize(width: cornerRad, height: cornerRad))
                    .foregroundColor(colorScheme == .light ? Color(color.tinted(amount: 0.25)) : Color(color.shaded(amount: 0.25)))
                VStack {
                    Text(name)
                        .font(.headline)
                        .foregroundColor(colorScheme == .light ? Color(color.shaded(amount: 0.4)) : Color(color.tinted(amount: 0.6)))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .minimumScaleFactor(0.5)
                    Text(timeRange)
                        .font(.headline)
                        .foregroundColor(colorScheme == .light ? Color(color.shaded(amount: 0.4)) : Color(color.tinted(amount: 0.6)))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .minimumScaleFactor(0.5)
                }.padding([.leading,.trailing], 5)
            } else {
                RoundedRectangle(cornerSize: CGSize(width: cornerRad, height: cornerRad))
                    .foregroundColor(Color("SystemGray5"))
                VStack {
                    Text(name)
                        .font(.headline)
                        .foregroundColor(Color("SystemGray"))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .minimumScaleFactor(0.5)
                    Text(timeRange)
                        .font(.headline)
                        .foregroundColor(Color("SystemGray"))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .minimumScaleFactor(0.5)
                }.padding([.leading,.trailing], 5)
            }
        }
        .contextMenu(ContextMenu(menuItems: {
            if (UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.bool(forKey: "AuthStatus")) == true {
                ForEach(array, id: \.id) { entry in
                    if entry.title.t.contains("C") && entry.content.t == convertDatetoString(input: date) {
                        if array.filter({ entry1 in if entry1.title.t.filter("0123456789.".contains) == entry.title.t.filter("0123456789.".contains) && entry1.title.t.contains("D") {
                            return true
                        } else {
                            return false
                        } }) != [] && ( array.filter { entry1 in if entry1.title.t.filter("0123456789.".contains) == entry.title.t.filter("0123456789.".contains) && entry1.title.t.contains("D") {
                            return true
                        } else {
                            return false
                        } }[0].content.t.lowercased() == block?.lowercased() || array.filter { entry1 in if entry1.title.t.filter("0123456789.".contains) == entry.title.t.filter("0123456789.".contains) && entry1.title.t.contains("D") {
                            return true
                        } else {
                            return false
                        } }[0].content.t.lowercased() == "all blocks" ) {
                            Button(action: {
                                if array.filter({ entry1 in if entry1.title.t.filter("0123456789.".contains) == entry.title.t.filter("0123456789.".contains) && entry1.title.t.contains("B") {
                                    return true
                                } else {
                                    return false
                                } }) != [] {
                                    openURL(URL(string: array.filter { entry1 in if entry1.title.t.filter("0123456789.".contains) == entry.title.t.filter("0123456789.".contains) && entry1.title.t.contains("B") {
                                        return true
                                    } else {
                                        return false
                                    } }[0].content.t)!)
                                }
                            }, label: {
                                HStack {
                                    if array.filter({ entry1 in if entry1.title.t.filter("0123456789.".contains) == entry.title.t.filter("0123456789.".contains) && entry1.title.t.contains("E") {
                                        return true
                                    } else {
                                        return false
                                    } }) != [] {
                                        Image(systemName: array.filter { entry1 in if entry1.title.t.filter("0123456789.".contains) == entry.title.t.filter("0123456789.".contains) && entry1.title.t.contains("E") {
                                            return true
                                        } else {
                                            return false
                                        } }[0].content.t)
                                    } else {
                                        Image(systemName: "link")
                                    }
                                    if array.filter({ entry1 in if entry1.title.t.filter("0123456789.".contains) == entry.title.t.filter("0123456789.".contains) && entry1.title.t.contains("A") {
                                        return true
                                    } else {
                                        return false
                                    } }) != [] {
                                        Text(array.filter { entry1 in if entry1.title.t.filter("0123456789.".contains) == entry.title.t.filter("0123456789.".contains) && entry1.title.t.contains("A") {
                                            return true
                                        } else {
                                            return false
                                        } }[0].content.t)
                                    }
                                }
                            })
                        }
                    }
                }
            }
        }))
    }
}

func convertDatetoString(input: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "M/d/YYYY"
    return(formatter.string(from: input))
}

func getQLData(input: QLFetcher) -> [Entry] {
    let url = URL(string: "https://spreadsheets.google.com/feeds/cells/1-ekIMl2ALgbwIL3bu09kTZT7ZZIUyrWo69sycAJWaSc/1/public/full?alt=json")!
    
    URLSession.shared.dataTask(with: url) {data,response,error in
        do {
            if let d = data {
                let decodedLists = try JSONDecoder().decode(PurpleData.self, from: d)
                DispatchQueue.main.async {
                    input.QLArray = decodedLists.feed.entry
                }
            } else {
                print("No Data")
            }
        } catch {
            print(error)
        }
        
    }.resume()
    
    return input.QLArray
}

class QLFetcher: ObservableObject {
    
    @Published var QLArray = [Entry]()
    
    init(){
        load()
    }
    
    func load() {
        let url = URL(string: "https://spreadsheets.google.com/feeds/cells/1-ekIMl2ALgbwIL3bu09kTZT7ZZIUyrWo69sycAJWaSc/1/public/full?alt=json")!
        
        URLSession.shared.dataTask(with: url) {data,response,error in
            do {
                if let d = data {
                    let decodedLists = try JSONDecoder().decode(PurpleData.self, from: d)
                    DispatchQueue.main.async {
                        self.QLArray = decodedLists.feed.entry
                    }
                } else {
                    print("No Data")
                }
            } catch {
                print(error)
            }
            
        }.resume()
        
    }
}

struct QuickLink {
    let name: String
    let URL: String
    let date: String
    let block: String?
}

struct PurpleData: Codable {
    let feed: Feed
}

struct Feed: Codable {
    //    let xmlns, xmlnsOpenSearch, xmlnsBatch, xmlnsGs: String
    //    let id, updated: GsColCount
    //    let category: [Category]
    //    let title: Title
    //    let link: [Link]
    //    let author: [Author]
    //    let openSearchTotalResults, openSearchStartIndex, gsRowCount, gsColCount: GsColCount
    let entry: [Entry]
    
    enum CodingKeys: String, CodingKey {
        //        case xmlns
        //        case xmlnsOpenSearch = "xmlns$openSearch"
        //        case xmlnsBatch = "xmlns$batch"
        //        case xmlnsGs = "xmlns$gs"
        //        case id, updated, category, title, link, author
        //        case openSearchTotalResults = "openSearch$totalResults"
        //        case openSearchStartIndex = "openSearch$startIndex"
        //        case gsRowCount = "gs$rowCount"
        //        case gsColCount = "gs$colCount"
        case entry = "entry"
    }
}
struct Author: Codable {
    let name, email: GsColCount
}

struct GsColCount: Codable, Hashable {
    let t: String
    
    enum CodingKeys: String, CodingKey {
        case t = "$t"
    }
}

struct Category: Codable {
    let scheme, term: String
}

struct Entry: Codable, Identifiable {
    let id = UUID()
    
    //    let id, updated: GsColCount
    //    let category: [Category]
    let title, content: Title
    //    let link: [Link]
    //    let gsCell: GsCell
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case content = "content"
        //        case gsCell = "gs$cell"
    }
}

struct Title: Codable {
    //    let type: TitleType
    let t: String
    
    enum CodingKeys: String, CodingKey {
        //        case type
        case t = "$t"
    }
}

enum TitleType: String, Codable {
    case text = "text"
}

struct GsCell: Codable {
    let row, col: String
    let inputValue, t: String
    let numericValue: String?
    
    enum CodingKeys: String, CodingKey {
        case row, col, inputValue
        case t = "$t"
        case numericValue
    }
}

struct Link: Codable {
    let rel: String
    let type: LinkType
    let href: String
}

enum LinkType: String, Codable {
    case applicationAtomXML = "application/atom+xml"
}
