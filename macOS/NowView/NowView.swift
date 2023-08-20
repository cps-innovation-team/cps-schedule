//  NowView.swift
//  Schedule.app
//
//  Created by Rahim Malik on 7/2/20.
//  Copyright © 2020 Rahim Malik. All rights reserved.

import SwiftUI
import WidgetKit
import Combine
import DynamicColor

struct ProgressBar: View {
    @Binding var date: Date
    //    @State var progress = Date().timeIntervalSince(nowModel(weekofyear: currentWeekofYear, currentDate: Date()).startBlockDate)
    @Binding var weekofyear: Int
    //    @State var maxprogress = nowModel(weekofyear: currentWeekofYear, currentDate: Date()).currentBlockDate.timeIntervalSince(nowModel(weekofyear: currentWeekofYear, currentDate: Date()).startBlockDate)
    @State var color = nowModel(weekofyear: currentWeekofYear, currentDate: Date()).currentBlockColor
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                HStack {
                    Capsule()
                        .frame(width: geo.size.width, height: 20)
                        .foregroundColor(colorScheme == .light ? .white : .black)
                }
                
                HStack {
                    Capsule()
                        .frame(width: geo.size.width*CGFloat(((date.timeIntervalSince(nowModel(weekofyear: currentWeekofYear, currentDate: date).startBlockDate))/(nowModel(weekofyear: currentWeekofYear, currentDate: date).currentBlockDate.timeIntervalSince(nowModel(weekofyear: currentWeekofYear, currentDate: date).startBlockDate)))), height: 20)
                        .foregroundColor(.clear)
                        .background(colorScheme == .light ? LinearGradient(gradient: Gradient(colors: [Color((nowModel(weekofyear: currentWeekofYear, currentDate: date).currentBlockColor).shaded(amount: 0.25)), Color((nowModel(weekofyear: currentWeekofYear, currentDate: date).currentBlockColor).shaded(amount: 0))]), startPoint: .leading, endPoint: .trailing) : LinearGradient(gradient: Gradient(colors: [Color((nowModel(weekofyear: currentWeekofYear, currentDate: date).currentBlockColor).tinted(amount: 0)), Color((nowModel(weekofyear: currentWeekofYear, currentDate: date).currentBlockColor).tinted(amount: 0.25))]), startPoint: .leading, endPoint: .trailing))
                        .clipShape(Capsule())
                        .animation(.linear)
                    Spacer()
                }
            }
        }.clipShape(Capsule())
    }
}

let fontsize = CGFloat(15)

struct NowQuickLink: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var currentDate = Date()
    @State var weekofyear = Calendar.current.component(.weekOfYear, from: Date())
    
    @State var timer = Timer.publish(every: 2, tolerance: 0, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing: 15) {
            if nowModel(weekofyear: weekofyear, currentDate: currentDate).currentBlockName == "No Class" && nowModel(weekofyear: weekofyear, currentDate: currentDate).nextBlockName == "No Class" {
                HStack {
                    Text("NOW")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .foregroundColor(Color("SystemGray2"))
                    Spacer()
                    Text("No Classes")
                        .font(.system(size: 16))
                }
            } else {
                HStack {
                    Text("NOW")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .foregroundColor(Color("SystemGray2"))
                    Spacer()
                }
                VStack(spacing: 15) {
                    if nowModel(weekofyear: weekofyear, currentDate: currentDate).currentBlockName == "No Class" {
                        HStack {
                            Text("No Classes")
                                .font(.system(size: fontsize))
                            Spacer()
                        }
                    } else {
                        HStack {
                            VStack {
                                HStack {
                                    Text(nowModel(weekofyear: weekofyear, currentDate: currentDate).currentBlockName)
                                        .foregroundColor(colorScheme == .light ? Color(nowModel(weekofyear: weekofyear, currentDate: currentDate).currentBlockColor.shaded(amount: 0.4)) : Color(nowModel(weekofyear: weekofyear, currentDate: currentDate).currentBlockColor.tinted(amount: 0.4)))
                                        .font(.system(size: fontsize))
                                        .fontWeight(.bold)
                                    Spacer()
                                }
                                HStack {
                                    Text(nowModel(weekofyear: weekofyear, currentDate: currentDate).currentBlockTime)
                                        .foregroundColor(colorScheme == .light ? Color(nowModel(weekofyear: weekofyear, currentDate: currentDate).currentBlockColor.shaded(amount: 0.4)) : Color(nowModel(weekofyear: weekofyear, currentDate: currentDate).currentBlockColor.tinted(amount: 0.4)))
                                        .font(.system(size: fontsize))
                                    Spacer()
                                }
                                if nowModel(weekofyear: weekofyear, currentDate: currentDate).currentBlockTeacher != "" && nowModel(weekofyear: weekofyear, currentDate: currentDate).currentBlockRoom != "" {
                                    HStack {
                                        Text("\(nowModel(weekofyear: weekofyear, currentDate: currentDate).currentBlockTeacher) | \(nowModel(weekofyear: weekofyear, currentDate: currentDate).currentBlockRoom)")
                                            .foregroundColor(colorScheme == .light ? Color(nowModel(weekofyear: weekofyear, currentDate: currentDate).currentBlockColor.shaded(amount: 0.4)) : Color(nowModel(weekofyear: weekofyear, currentDate: currentDate).currentBlockColor.tinted(amount: 0.4)))
                                            .font(.system(size: fontsize))
                                        Spacer()
                                    }
                                }
                                else if nowModel(weekofyear: weekofyear, currentDate: currentDate).currentBlockTeacher != "" {
                                    HStack {
                                        Text(nowModel(weekofyear: weekofyear, currentDate: currentDate).currentBlockTeacher)
                                            .foregroundColor(colorScheme == .light ? Color(nowModel(weekofyear: weekofyear, currentDate: currentDate).currentBlockColor.shaded(amount: 0.4)) : Color(nowModel(weekofyear: weekofyear, currentDate: currentDate).currentBlockColor.tinted(amount: 0.4)))
                                            .font(.system(size: fontsize))
                                        Spacer()
                                    }
                                }
                                else if nowModel(weekofyear: weekofyear, currentDate: currentDate).currentBlockRoom != "" {
                                    HStack {
                                        Text(nowModel(weekofyear: weekofyear, currentDate: currentDate).currentBlockRoom)
                                            .foregroundColor(colorScheme == .light ? Color(nowModel(weekofyear: weekofyear, currentDate: currentDate).currentBlockColor.shaded(amount: 0.4)) : Color(nowModel(weekofyear: weekofyear, currentDate: currentDate).currentBlockColor.tinted(amount: 0.4)))
                                            .font(.system(size: fontsize))
                                        Spacer()
                                    }
                                }
                            }
                            Spacer()
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(colorScheme == .light ? Color(nowModel(weekofyear: weekofyear, currentDate: currentDate).currentBlockColor.tinted(amount: 0.25)) : Color(nowModel(weekofyear: weekofyear, currentDate: currentDate).currentBlockColor.shaded(amount: 0.25)))
                                    .frame(height: (shortBlock))
                                Text(nowModel(weekofyear: weekofyear, currentDate: currentDate).currentBlockDate, style: .timer)
                                    .font(.system(size: fontsize))
                                    .fontWeight(.medium)
                                    .animation(nil)
                            }.frame(width: 100)
                        }
                        ProgressView(value: (currentDate.timeIntervalSince(nowModel(weekofyear: currentWeekofYear, currentDate: currentDate).startBlockDate))/(nowModel(weekofyear: currentWeekofYear, currentDate: currentDate).currentBlockDate.timeIntervalSince(nowModel(weekofyear: currentWeekofYear, currentDate: currentDate).startBlockDate)))
                            .progressViewStyle(LinearProgressViewStyle())
                            .accentColor(ProgressColor(weekofyear: weekofyear, currentDate: currentDate))
                            .animation(.linear)
                        if nowModel(weekofyear: weekofyear, currentDate: currentDate).currentBlockDate != nowModel(weekofyear: weekofyear, currentDate: currentDate).nextBlockDate {
                            HStack {
                                Text("Passing Period: \(Calendar.current.dateComponents([.minute], from: nowModel(weekofyear: weekofyear, currentDate: currentDate).currentBlockDate, to: nowModel(weekofyear: weekofyear, currentDate: currentDate).nextBlockDate).minute ?? 100) min")
                                    .font(.system(size: fontsize))
                                Spacer()
                            }
                        }
                    }
                }
                VStack(spacing: 15) {
                    if nowModel(weekofyear: weekofyear, currentDate: currentDate).nextBlockName == "No Class" {
                        HStack {
                            Text("No Classes")
                                .font(.system(size: fontsize))
                            Spacer()
                        }
                    } else {
                        HStack {
                            VStack {
                                HStack {
                                    Text(nowModel(weekofyear: weekofyear, currentDate: currentDate).nextBlockName)
                                        .foregroundColor(colorScheme == .light ? Color(nowModel(weekofyear: weekofyear, currentDate: currentDate).nextBlockColor.shaded(amount: 0.4)) : Color(nowModel(weekofyear: weekofyear, currentDate: currentDate).nextBlockColor.tinted(amount: 0.4)))
                                        .font(.system(size: fontsize))
                                        .fontWeight(.bold)
                                    Spacer()
                                }
                                HStack {
                                    Text(nowModel(weekofyear: weekofyear, currentDate: currentDate).nextBlockTime)
                                        .foregroundColor(colorScheme == .light ? Color(nowModel(weekofyear: weekofyear, currentDate: currentDate).nextBlockColor.shaded(amount: 0.4)) : Color(nowModel(weekofyear: weekofyear, currentDate: currentDate).nextBlockColor.tinted(amount: 0.4)))
                                        .font(.system(size: fontsize))
                                    Spacer()
                                }
                                if nowModel(weekofyear: weekofyear, currentDate: currentDate).nextBlockTeacher != "" && nowModel(weekofyear: weekofyear, currentDate: currentDate).nextBlockRoom != "" {
                                    HStack {
                                        Text("\(nowModel(weekofyear: weekofyear, currentDate: currentDate).nextBlockTeacher) | \(nowModel(weekofyear: weekofyear, currentDate: currentDate).nextBlockRoom)")
                                            .foregroundColor(colorScheme == .light ? Color(nowModel(weekofyear: weekofyear, currentDate: currentDate).nextBlockColor.shaded(amount: 0.4)) : Color(nowModel(weekofyear: weekofyear, currentDate: currentDate).nextBlockColor.tinted(amount: 0.4)))
                                            .font(.system(size: fontsize))
                                        Spacer()
                                    }
                                }
                                else if nowModel(weekofyear: weekofyear, currentDate: currentDate).nextBlockTeacher != "" {
                                    HStack {
                                        Text(nowModel(weekofyear: weekofyear, currentDate: currentDate).nextBlockTeacher)
                                            .foregroundColor(colorScheme == .light ? Color(nowModel(weekofyear: weekofyear, currentDate: currentDate).nextBlockColor.shaded(amount: 0.4)) : Color(nowModel(weekofyear: weekofyear, currentDate: currentDate).nextBlockColor.tinted(amount: 0.4)))
                                            .font(.system(size: fontsize))
                                        Spacer()
                                    }
                                }
                                else if nowModel(weekofyear: weekofyear, currentDate: currentDate).nextBlockRoom != "" {
                                    HStack {
                                        Text(nowModel(weekofyear: weekofyear, currentDate: currentDate).nextBlockRoom)
                                            .foregroundColor(colorScheme == .light ? Color(nowModel(weekofyear: weekofyear, currentDate: currentDate).nextBlockColor.shaded(amount: 0.4)) : Color(nowModel(weekofyear: weekofyear, currentDate: currentDate).nextBlockColor.tinted(amount: 0.4)))
                                            .font(.system(size: fontsize))
                                        Spacer()
                                    }
                                }
                            }
                            Spacer()
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(colorScheme == .light ? Color(nowModel(weekofyear: weekofyear, currentDate: currentDate).nextBlockColor.tinted(amount: 0.25)) : Color(nowModel(weekofyear: weekofyear, currentDate: currentDate).nextBlockColor.shaded(amount: 0.25)))
                                    .frame(height: (shortBlock))
                                Text(nowModel(weekofyear: weekofyear, currentDate: currentDate).nextBlockDate, style: .timer)
                                    .font(.system(size: fontsize))
                                    .fontWeight(.medium)
                                    .animation(nil)
                            }.frame(width: 100)
                        }
                    }
                }
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 15).foregroundColor(Color(.gridColor)))
        .onReceive(timer) { _ in
            currentDate = Date()
        }
        .onAppear {
            currentDate = Date()
            timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
        }
        .onDisappear {
            self.timer.upstream.connect().cancel()
        }
    }
}

func ProgressColor(weekofyear: Int, currentDate: Date) -> Color {
    if Color(nowModel(weekofyear: weekofyear, currentDate: currentDate).currentBlockColor) == Color(systemAbsence) {
        return Color("SystemGray2")
    }
    else {
        return Color(nowModel(weekofyear: weekofyear, currentDate: currentDate).currentBlockColor)
    }
}


struct RoundedCorners: Shape {
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let w = rect.size.width
        let h = rect.size.height
        
        // Make sure we do not exceed the size of the rectangle
        let tr = min(min(self.tr, h/2), w/2)
        let tl = min(min(self.tl, h/2), w/2)
        let bl = min(min(self.bl, h/2), w/2)
        let br = min(min(self.br, h/2), w/2)
        
        path.move(to: CGPoint(x: w / 2.0, y: 0))
        path.addLine(to: CGPoint(x: w - tr, y: 0))
        path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr,
                    startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
        
        path.addLine(to: CGPoint(x: w, y: h - br))
        path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br,
                    startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
        
        path.addLine(to: CGPoint(x: bl, y: h))
        path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl,
                    startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
        
        path.addLine(to: CGPoint(x: 0, y: tl))
        path.addArc(center: CGPoint(x: tl, y: tl), radius: tl,
                    startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
        
        return path
    }
}

struct DynamicQuickLink: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.openURL) var openURL
    @State var date = Date()
    @Binding var day: Int
    @Binding var array: [Entry]
    @ObservedObject var qlManager = QLFetcher()
    let timer = Timer.publish(every: 5, tolerance: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            if array.filter { entry in if entry.title.t.contains("C") && entry.content.t == convertDatetoString(input: date) {
                return true
            } else {
                return false
            } } != [] {
                VStack {
                    ForEach(array, id: \.id) { entry in
                        if entry.title.t.contains("C") && entry.content.t == convertDatetoString(input: date) {
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
                                        if array.filter({ entry1 in if entry1.title.t.filter("0123456789.".contains) == entry.title.t.filter("0123456789.".contains) && entry1.title.t.contains("A") {
                                            return true
                                        } else {
                                            return false
                                        } }) != [] && array.filter({ entry1 in if entry1.title.t.filter("0123456789.".contains) == entry.title.t.filter("0123456789.".contains) && entry1.title.t.contains("D") {
                                            return true
                                        } else {
                                            return false
                                        } }) != [] && (array.filter { entry1 in if entry1.title.t.filter("0123456789.".contains) == entry.title.t.filter("0123456789.".contains) && entry1.title.t.contains("D") {return true} else {return false} }[0].content.t) != "All Blocks" {
                                            Text("(\(array.filter { entry1 in if entry1.title.t.filter("0123456789.".contains) == entry.title.t.filter("0123456789.".contains) && entry1.title.t.contains("D") {return true} else {return false} }[0].content.t)) \(array.filter { entry1 in if entry1.title.t.filter("0123456789.".contains) == entry.title.t.filter("0123456789.".contains) && entry1.title.t.contains("A") {return true} else {return false} }[0].content.t)")
                                                .font(.system(size: fontsize))
                                                .fontWeight(.medium)
                                        } else if array.filter({ entry1 in if entry1.title.t.filter("0123456789.".contains) == entry.title.t.filter("0123456789.".contains) && entry1.title.t.contains("A") {
                                            return true
                                        } else {
                                            return false
                                        } }) != [] {
                                            Text(array.filter { entry1 in if entry1.title.t.filter("0123456789.".contains) == entry.title.t.filter("0123456789.".contains) && entry1.title.t.contains("A") {return true} else {return false} }[0].content.t)
                                                .font(.system(size: fontsize))
                                                .fontWeight(.medium)
                                        }
                                        Spacer()
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
                                            .font(.system(size: fontsize))
                                            .foregroundColor(Color("AccentColor"))
                                        } else {
                                            Image(systemName: "link")
                                                .font(.system(size: fontsize))
                                                .foregroundColor(Color("AccentColor"))
                                        }
                                    }.padding()
                                    .background(RoundedRectangle(cornerRadius: 11).foregroundColor(Color(.windowBackgroundColor)))
                                }).buttonStyle(ScaleButtonStyle())
                        }
                    }
                }
                .padding(7)
                .background(RoundedRectangle(cornerRadius: 15).foregroundColor(Color(.gridColor)))
            } else {
                HStack {
                    Text("QUICKLINKS")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .foregroundColor(Color("SystemGray2"))
                    Spacer()
                    Text("No QuickLinks")
                        .font(.system(size: 16))
                }.padding()
                .background(RoundedRectangle(cornerRadius: 15).foregroundColor(Color(.gridColor)))
            }
        }
        .onReceive(timer, perform: { _ in
            array = getQLData(input: qlManager)
        })
    }
}

struct BookmarksQuickLink: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.openURL) var openURL
    
    let columns = [
        GridItem(.flexible(), spacing: 7),
        GridItem(.flexible(), spacing: 7)
    ]
    
    let frameheight = CGFloat(77.5)
    
    var body: some View {
        VStack {
            LazyVGrid(columns: columns) {
                Button (action: {
                    openURL(URL(string: "https://www.college-prep.org/2020-21-school-year")!)
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12.5)
                            .foregroundColor(colorScheme == .light ? Color(NSColor(Color("QLGreen")).tinted(amount: 0.25)) : Color(NSColor(Color("QLGreen")).shaded(amount: 0.25)))
                            .frame(height: frameheight)
                        BookmarksCell(name: "COVID-19 Info", image: "info.circle")
                    }
                }).buttonStyle(ScaleButtonStyle())
                Button (action: {
                    openURL(URL(string: "https://sites.google.com/thecollegepreparatoryschool.org/unofficialcpscovid/home")!)
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12.5)
                            .foregroundColor(colorScheme == .light ? Color(NSColor(Color("QLGreen")).tinted(amount: 0.25)) : Color(NSColor(Color("QLGreen")).shaded(amount: 0.25)))
                            .frame(height: frameheight)
                        BookmarksCell(name: "COVID-19 Data", image: "chart.bar.xaxis")
                    }
                }).buttonStyle(ScaleButtonStyle())
                Button (action: {
                    openURL(URL(string: "https://college-prep.myschoolapp.com/app/student#studentmyday/progress")!)
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12.5)
                            .foregroundColor(colorScheme == .light ? Color(NSColor(Color("AccentColor")).tinted(amount: 0.25)) : Color(NSColor(Color("AccentColor")).shaded(amount: 0.25)))
                            .frame(height: frameheight)
                        BookmarksCell(name: "Portal", image: "network")
                    }
                }).buttonStyle(ScaleButtonStyle())
                Button (action: {
                    openURL(URL(string: "https://cpsradar.com")!)
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12.5)
                            .foregroundColor(colorScheme == .light ? Color(NSColor(Color("AccentColor")).tinted(amount: 0.25)) : Color(NSColor(Color("AccentColor")).shaded(amount: 0.25)))
                            .frame(height: frameheight)
                        BookmarksCell(name: "Radar", image: "newspaper.fill")
                    }
                }).buttonStyle(ScaleButtonStyle())
                Button (action: {
                    openURL(URL(string: "https://sites.google.com/thecollegepreparatoryschool.org/digitallc/home")!)
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12.5)
                            .foregroundColor(colorScheme == .light ? Color(NSColor(Color(.systemPink)).tinted(amount: 0.25)) : Color(NSColor(Color(.systemPink)).shaded(amount: 0.25)))
                            .frame(height: frameheight)
                        BookmarksCell(name: "Learning Center", image: "studentdesk")
                    }
                }).buttonStyle(ScaleButtonStyle())
                Button (action: {
                    openURL(URL(string: "https://collegepreplibrary.com")!)
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12.5)
                            .foregroundColor(colorScheme == .light ? Color(NSColor(Color(.systemPink)).tinted(amount: 0.25)) : Color(NSColor(Color(.systemPink)).shaded(amount: 0.25)))
                            .frame(height: frameheight)
                        BookmarksCell(name: "Library", image: "books.vertical.fill")
                    }
                }).buttonStyle(ScaleButtonStyle())
            }
            Button (action: {
                openURL(URL(string: "https://docs.google.com/forms/d/e/1FAIpQLSdeFnyD4Ti1A5pKaLisd81IeX0WBtQ6aBZFa47CeNaw3trS3Q/viewform?usp=sf_link")!)
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 12.5)
                        .foregroundColor(colorScheme == .light ? Color(NSColor(Color(.systemPurple)).tinted(amount: 0.25)) : Color(NSColor(Color(.systemPurple)).shaded(amount: 0.25)))
                        .frame(height: frameheight)
                    BookmarksCell(name: "Feedback", image: "exclamationmark.bubble.fill")
                }
            }).buttonStyle(ScaleButtonStyle())
        }
        .padding(7)
        .background(RoundedRectangle(cornerRadius: 15).foregroundColor(Color(.gridColor)))
    }
}

struct BookmarksCell: View {
    @Environment(\.colorScheme) var colorScheme
    let name: String
    let image: String
    
    var body: some View {
        ZStack {
            HStack {
                VStack(spacing: 7) {
                    HStack {
                        Image(systemName: image)
                            .foregroundColor(.white)
                            .font(Font.system(size: 17, weight: .medium))
                        Spacer()
                    }
                    HStack {
                        Text(name)
                            .foregroundColor(.white)
                            .font(.system(size: fontsize))
                            .fontWeight(.medium)
                        Spacer()
                    }
                }
                Spacer()
            }.padding()
        }
    }
}

struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.97 : 1)
    }
}

struct NowView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.openURL) var openURL
    let timer = Timer.publish(every: 5, tolerance: 1, on: .main, in: .common).autoconnect()
    @Binding var authstatus: Bool
    @State var currentDate = Date()
    @Binding var clubsArray: [EventCalModel.Item]
    @Binding var sportsArray: [EventCalModel.Item]
    @Binding var qlArray: [Entry]
    @State var day = Calendar.current.component(.weekday, from: Date())
    
    @State var selection: String? = "dashboard"
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack(spacing: 20) {
                NowQuickLink()
                if authstatus {
                    DynamicQuickLink(day: $day, array: $qlArray)
                        ClubsQuickLink(date: $currentDate, array: $clubsArray)
                        SportsQuickLink(date: $currentDate, array: $sportsArray)
                    BookmarksQuickLink()
                }
            }.padding()
        })
    }
}
