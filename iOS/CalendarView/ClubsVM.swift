//  CalendarRowView.swift
//  Schedule.app
//
//  Created by Rahim Malik on 7/11/20.
//  Copyright © 2020 Rahim Malik. All rights reserved.

import SwiftUI
import DynamicColor
import UIKit

struct QLCalendarView: View {
   
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.openURL) var openURL
    
    var ClubsArray: [EventCalModel.Item]
    @Binding var date: Date
    
    var body: some View {
        
        VStack(spacing: 15) {
            ForEach(ClubsArray.sorted { $0.dateTime < $1.dateTime }, id: \.id) { item in
                VStack() {
                    HStack {
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: 8.5)
                            .foregroundColor(Color("AccentColor"))
                        VStack(spacing: 0) {
                            if item.dateTime != "" && item.endDateTime != "" {
                                HStack {
                                    Text(item.summary)
                                        .font(.system(size: 14))
                                        .fontWeight(.semibold)
                                    Spacer()
                                    if "\(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "h:mm", convertDate: item.dateTime)) - \(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "h:mm", convertDate: item.endDateTime))" == "12:00 - 12:00" {
                                        Text("all-day")
                                            .font(.system(size: 14))
                                    }
                                    else {
                                        Text("\(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "h:mm", convertDate: item.dateTime)) - \(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "h:mm", convertDate: item.endDateTime))")
                                            .font(.system(size: 14))
                                    }
                                }.padding(.leading, 5)
                                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                            }
                            else {
                                HStack {
                                    Text(item.summary)
                                        .fontWeight(.semibold)
                                        .font(.system(size: 14))
                                    Spacer()
                                    Text("all-day")
                                        .font(.system(size: 14))
                                }.padding(.leading, 5)
                                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                            }
                            if detectLocation(input: item.location, agenda: false).text != "No Location" {
                                TagCloudView(tags: [detectLocation(input: item.location, agenda: false), detectCategory(input: item.summary, agenda: false)])
                                    .padding(.top, 5)
                            } else {
                                TagCloudView(tags: [detectCategory(input: item.summary, agenda: false)])
                                    .padding(.top, 5)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct AgendaView: View {
    
    @Binding var ClubsArray: [EventCalModel.Item]
    @State var absence: Bool = true
    @Binding var show: Bool
    @Binding var date: Date
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.openURL) var openURL
    
    @Binding var affinitiesPresented: Bool
    @Binding var activismPresented: Bool
    @Binding var stemPresented: Bool
    @Binding var poleconPresented: Bool
    @Binding var lifestylePresented: Bool
    @Binding var artsPresented: Bool
    
    var body: some View {
        
        GeometryReader { geo in
            ScrollView(.vertical) {
                Spacer().frame(height: 10)
                ForEach(ClubsArray.sorted { $0.dateTime < $1.dateTime }.filter {
                    if ($0.dateTime != "" && getDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "yyyy-MM-dd'T'HH:mm:ssZ", convertDate: $0.dateTime) >= Calendar.current.date(byAdding: .hour, value: -1, to: Date()) ?? Date()) || ($0.start != "" && getDate(currentDateFormate: "yyyy-MM-dd", conVertFormate: "yyyy-MM-dd", convertDate: $0.start) >= Date()) {
                        return true
                    } else {
                        return false
                    }
                }, id: \.id) { item in
                    if (detectCategory(input: item.summary, agenda: true).text == "affinities" && affinitiesPresented == true) || (detectCategory(input: item.summary, agenda: true).text == "activism" && activismPresented == true) || (detectCategory(input: item.summary, agenda: true).text == "stem" && stemPresented == true) || (detectCategory(input: item.summary, agenda: true).text == "politics" && poleconPresented == true) || (detectCategory(input: item.summary, agenda: true).text == "lifestyle" && lifestylePresented == true) || (detectCategory(input: item.summary, agenda: true).text == "arts" && artsPresented == true) || (detectCategory(input: item.summary, agenda: true).text == "club" && (affinitiesPresented == true && activismPresented == true && stemPresented == true && poleconPresented == true && lifestylePresented == true && artsPresented == true)) {
                        VStack {
                            HStack {
                                if item.dateTime != "" {
                                    Text("\(convertDate(input: (getDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "yyyy-MM-dd'T'HH:mm:ssZ", convertDate: item.dateTime)), converter: "EEEE")), \(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "MMMM", convertDate: item.dateTime)) \(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "d", convertDate: item.dateTime))")
                                        .font(.system(size: 16, design: .rounded))
                                        .fontWeight(.medium)
                                        .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(Color("AccentColor"))
                                }
                                if item.start != "" {
                                    Text("\(convertDate(input: (getDate(currentDateFormate: "yyyy-MM-dd", conVertFormate: "yyyy-MM-dd", convertDate: item.dateTime)), converter: "EEEE")), \(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd", conVertFormate: "MMMM", convertDate: item.start)) \(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd", conVertFormate: "d", convertDate: item.start))")
                                        .font(.system(size: 16, design: .rounded))
                                        .fontWeight(.medium)
                                        .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(Color("AccentColor"))
                                }
                                Spacer()
                            }
                            HStack {
                                RoundedRectangle(cornerRadius: 50)
                                    .frame(width: 8.5)
                                    .foregroundColor(Color("AccentColor"))
                                VStack(spacing: 0) {
                                    if item.dateTime != "" && item.endDateTime != "" {
                                        HStack {
                                            Text(item.summary)
                                                .font(.system(size: 14))
                                                .fontWeight(.semibold)
                                                .lineLimit(2)
                                            Spacer()
                                            if "\(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "h:mm", convertDate: item.dateTime)) - \(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "h:mm", convertDate: item.endDateTime))" == "12:00 - 12:00" {
                                                Text("all-day")
                                                    .font(.system(size: 14))
                                            }
                                            else {
                                                Text("\(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "h:mm", convertDate: item.dateTime)) - \(getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "h:mm", convertDate: item.endDateTime))")
                                                    .font(.system(size: 14))
                                            }
                                        }.padding(.leading, 5)
                                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                    }
                                    else {
                                        HStack {
                                            Text(item.summary)
                                                .fontWeight(.semibold)
                                                .font(.system(size: 14))
                                                .lineLimit(2)
                                            Spacer()
                                            Text("all-day")
                                                .font(.system(size: 14))
                                        }.padding(.leading, 5)
                                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                    }
//                                    if self.show == true {
//                                        if cleanDescription(input: item.description) != "" {
//                                            HStack {
//                                                Text(cleanDescription(input: item.description))
//                                                    .font(.system(size: 14))
//                                                    .padding([.top,.leading,.trailing], 5)
//                                                    .lineLimit(2)
//                                                Spacer()
//                                            }
//                                        }
//                                    }
                                    if detectLocation(input: item.location, agenda: true).text != "No Location" {
                                        TagCloudView(tags: [detectLocation(input: item.location, agenda: true), detectCategory(input: item.summary, agenda: true)])
                                            .padding(.top, 5)
                                    } else {
                                        TagCloudView(tags: [detectCategory(input: item.summary, agenda: true)])
                                            .padding(.top, 5)
                                    }
                                }
                            }
                            Spacer().frame(height: 20)
                        }
                        .padding(.horizontal)
//                        .onAppear(perform: {
//                            self.absence = false
//                        })
//                        .onDisappear(perform: {
//                            self.absence = true
//                        })
                    }
                }.frame(width: geo.size.width)
                Spacer().frame(height: 10)
            }
        }
    }
}

func cleanDescription(input: String) -> String {
    var input2 = input
    var urlextract = "urlextract"
    input2 = input2.replacingOccurrences(of: "<br>", with: " ")
    input2 = input2.replacingOccurrences(of: "<span>", with: "")
    input2 = input2.replacingOccurrences(of: "</span>", with: "")
    input2 = input2.replacingOccurrences(of: "&nbsp;", with: "")
    input2 = input2.replacingOccurrences(of: "<i>", with: "")
    input2 = input2.replacingOccurrences(of: "</i>", with: "")
    input2 = input2.replacingOccurrences(of: "<b>", with: "")
    input2 = input2.replacingOccurrences(of: "</b>", with: "")
    input2 = input2.replacingOccurrences(of: "</a>", with: "")
    input2 = input2.replacingOccurrences(of: "\">", with: "")
    urlextract = "(?i)https?://(?:www\\.)?\\S+(?:/|\\b)"
    input2 = input2.replacingOccurrences(of: urlextract, with: "", options: .regularExpression)
    input2 = input2.replacingOccurrences(of: "<a href=\"", with: "")
    return input2
}

func detectLocation(input: String, agenda: Bool) -> ClubTag {
    var location = input
    location = location.replacingOccurrences(of: "Clubs Calendar", with: "")
    location = location.replacingOccurrences(of: ",", with: "")
    location = location.trimmingCharacters(in: .whitespacesAndNewlines)
    if location.contains("http") {
        if location.contains("zoom") {
            return(ClubTag(text: "zoom", symbol: "video.fill", color: .systemBlue, sharebool: true, sharelink: location, agenda: agenda))
        } else {
            return(ClubTag(text: "website", symbol: "safari.fill", color: .systemBlue, sharebool: true, sharelink: location, agenda: agenda))
        }
    }
    else if location == "" {
        return(ClubTag(text: "No Location", symbol: "mappin", color: .systemGreen, sharebool: false, sharelink: input, agenda: agenda))
    }
    else {
        return(ClubTag(text: location, symbol: "location.fill", color: .systemGreen, sharebool: false, sharelink: input, agenda: agenda))
    }
}

func detectCategory(input: String, agenda: Bool) -> ClubTag {
    let inputmod = input.lowercased()
    
    let affinities = ["asian american association", "aaa", "black student union", "bsu", "chinese", "men's group", "feminist", "femu", "muslim", "msa", "interracial", "swirl", "gender", "gsa", "hate", "nphc", "south asian", "saa", "korean", "jewish", "latinx", "surj"]
    let activism = ["women's shelter", "men's shelter", "human trafficking", "catfood", "tiny house", "green team", "community action team", "cat", "animal welfare", "bring change 2 mind", "bc2m", "food bank", "storytelling with seniors"]
    let stem = ["scioly", "science", "girls who code", "math", "robotics", "maker's", "coding"]
    let polecon = ["cpsmun", "libertarian", "cpslp", "pac", "politic", "coffee", "investing", "finance", "mock", "current events"]
    let lifestyle = ["latin club", "latin clvb", "be body positive", "lifting", "cooking", "garden", "tv", "hip hop"]
    let arts = ["origami", "creative", "war and teas", "war & teas", "disney", "wacky", "destruction", "poetry"]
    let assembly = ["assembly"]
    let common = ["common"]
    
    let affinitiesBool = affinities.contains(where: inputmod.contains)
    let activismBool = activism.contains(where: inputmod.contains)
    let stemBool = stem.contains(where: inputmod.contains)
    let poleconBool = polecon.contains(where: inputmod.contains)
    let lifestyleBool = lifestyle.contains(where: inputmod.contains)
    let artsBool = arts.contains(where: inputmod.contains)
    let assemblyBool = assembly.contains(where: inputmod.contains)
    let commonBool = common.contains(where: inputmod.contains)
    
    if affinitiesBool { return(ClubTag(text: "affinities", symbol: "tag.fill", color: UIColor(Color("AccentColor")), sharebool: false, sharelink: input, agenda: agenda)) }
    else if activismBool { return(ClubTag(text: "activism", symbol: "tag.fill", color: UIColor(Color("AccentColor")), sharebool: false, sharelink: input, agenda: agenda)) }
    else if stemBool { return(ClubTag(text: "stem", symbol: "tag.fill", color: UIColor(Color("AccentColor")), sharebool: false, sharelink: input, agenda: agenda)) }
    else if poleconBool { return(ClubTag(text: "politics", symbol: "tag.fill", color: UIColor(Color("AccentColor")), sharebool: false, sharelink: input, agenda: agenda)) }
    else if lifestyleBool { return(ClubTag(text: "lifestyle", symbol: "tag.fill", color: UIColor(Color("AccentColor")), sharebool: false, sharelink: input, agenda: agenda)) }
    else if artsBool { return(ClubTag(text: "arts", symbol: "tag.fill", color: UIColor(Color("AccentColor")), sharebool: false, sharelink: input, agenda: agenda)) }
    else if assemblyBool { return(ClubTag(text: "community", symbol: "person.fill", color: UIColor(Color("AccentColor")), sharebool: false, sharelink: input, agenda: agenda)) }
    else if commonBool { return(ClubTag(text: "community", symbol: "person.fill", color: UIColor(Color("AccentColor")), sharebool: false, sharelink: input, agenda: agenda)) }
    else { return(ClubTag(text: "club", symbol: "tag.fill", color: UIColor(Color("AccentColor")), sharebool: false, sharelink: input, agenda: agenda)) }
}

class ClubTag: Hashable {
    static func == (lhs: ClubTag, rhs: ClubTag) -> Bool {
        lhs.text == rhs.text
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(text)
    }
    
    var text: String
    var symbol: String
    var color: UIColor
    var sharebool: Bool
    var sharelink: String
    var agenda: Bool
    
    init(text: String, symbol: String, color: UIColor, sharebool: Bool, sharelink: String, agenda: Bool) {
        self.text = text
        self.symbol = symbol
        self.color = color
        self.sharebool = sharebool
        self.sharelink = sharelink
        self.agenda = agenda
    }
}

struct TagCloudView: View {
    var tags: [ClubTag]
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.openURL) var openURL
    @State private var totalHeight
        = CGFloat.zero       // << variant for ScrollView/List
    //    = CGFloat.infinity   // << variant for VStack
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
        .frame(height: totalHeight)// << variant for ScrollView/List
        //.frame(maxHeight: totalHeight) // << variant for VStack
    }
    
    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        return ZStack(alignment: .topLeading) {
            ForEach(self.tags, id: \.self) { tag in
                self.item(for: tag)
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width)
                        {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if tag == self.tags.last! {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if tag == self.tags.last! {
                            height = 0 // last item
                        }
                        return result
                    })
            }
        }.background(viewHeightReader($totalHeight))
    }
    
    private func item(for tag: ClubTag) -> some View {
        if tag.text != "No Location" {
            if tag.sharebool == true {
                if tag.agenda == true {
                    return AnyView (
                        Button(action: {
                            if URL(string: tag.sharelink) != nil {
                                openURL(URL(string: tag.sharelink)!)
//                                UIPasteboard.general.string = tag.sharelink
                            }
                        }, label: {
                            if tag.text == "zoom" {
                                Text("Join")
                                    .fontWeight(.medium)
                                    .padding(.all, 6)
                                    .padding([.leading,.trailing], 6)
                                    .font(.body)
                                    .foregroundColor(.white)
                                    .background(colorScheme == .light ? Color((tag.color).tinted(amount: 0.15)) : Color((tag.color).tinted(amount: 0.15)))
                                    .clipShape(Capsule())
                            } else {
                                Text("Open")
                                    .fontWeight(.medium)
                                    .padding(.all, 6)
                                    .padding([.leading,.trailing], 6)
                                    .font(.body)
                                    .foregroundColor(.white)
                                    .background(colorScheme == .light ? Color((tag.color).tinted(amount: 0.15)) : Color((tag.color).tinted(amount: 0.15)))
                                    .clipShape(Capsule())
                            }
                        })
                    )
                } else {
                    return AnyView (
                        Button(action: {
                            if URL(string: tag.sharelink) != nil {
                                openURL(URL(string: tag.sharelink)!)
//                                UIPasteboard.general.string = tag.sharelink
                            }
                        }, label: {
                            if tag.text == "zoom" {
                                Text("Join")
                                    .fontWeight(.medium)
                                    .padding(.all, 6)
                                    .padding([.leading,.trailing], 6)
                                    .font(.body)
                                    .foregroundColor(.white)
                                    .background(colorScheme == .light ? Color((tag.color).tinted(amount: 0.15)) : Color((tag.color).tinted(amount: 0.15)))
                                    .clipShape(Capsule())
                            } else {
                                Text("Open")
                                    .fontWeight(.medium)
                                    .padding(.all, 6)
                                    .padding([.leading,.trailing], 6)
                                    .font(.body)
                                    .foregroundColor(.white)
                                    .background(colorScheme == .light ? Color((tag.color).tinted(amount: 0.15)) : Color((tag.color).tinted(amount: 0.15)))
                                    .clipShape(Capsule())
                            }
                        })
                    )
                }
            } else {
                if tag.agenda == true {
                    return AnyView (
                        Text("#\(tag.text)")
                            .fontWeight(.medium)
                            .padding(.all, 6)
                            .padding([.leading,.trailing], 6)
                            .font(.body)
                            .foregroundColor(colorScheme == .light ? Color((tag.color).tinted(amount: 0.15)) : Color((tag.color).tinted(amount: 0.15)))
                            .background(Color("SystemGray6"))
                            .clipShape(Capsule())
                    )
                } else {
                    return AnyView (
                        Text("#\(tag.text)")
                            .fontWeight(.medium)
                            .padding(.all, 6)
                            .padding([.leading,.trailing], 6)
                            .font(.body)
                            .foregroundColor(colorScheme == .light ? Color((tag.color).tinted(amount: 0.15)) : Color((tag.color).tinted(amount: 0.15)))
                            .background(colorScheme == .light ? .white : Color("SystemGray5"))
                            .clipShape(Capsule())
                    )
                }
            }
        } else {
            return(AnyView(Text("").frame(width: 0, height: 0)))
        }
    }
    
    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
}

func getDate(currentDateFormate: String, conVertFormate: String, convertDate: String) -> Date {
    let formatter = DateFormatter()
    formatter.dateFormat = currentDateFormate
    let finalDate = formatter.date(from: convertDate) ?? Date()
    return finalDate
}

func convertDate(input: Date, converter: String) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = converter
    let dateString = formatter.string(from: input)
    return dateString
    
}

func DateChecker(dateRow: Date, bindDate: Date) -> Bool {
    let calendar = Calendar.current
    let componentsRow = calendar.dateComponents([.day,.month,.year], from: dateRow)
    let dayRow = componentsRow.day
    let monthRow = componentsRow.month
    let yearRow = componentsRow.year
    let componentsBind = calendar.dateComponents([.day,.month,.year], from: bindDate)
    let dayBind = componentsBind.day
    let monthBind = componentsBind.month
    let yearBind = componentsBind.year
    if (dayRow == dayBind) && (monthRow == monthBind) && (yearRow == yearBind) { return(true) } else { return(false) }
}

func getOnlyDateMonthYearFromFullDate(currentDateFormate: String, conVertFormate: String, convertDate: String ) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = currentDateFormate
    let finalDate = formatter.date(from: convertDate)
    formatter.dateFormat = conVertFormate
    let dateString = formatter.string(from: finalDate!)
    
    return dateString
}
