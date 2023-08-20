//
//  SplashScreen.swift
//  Schedule (iOS)
//
//  Created by Rahim Malik on 12/14/20.
//  Copyright © 2020 Rahim Malik. All rights reserved.
//

import SwiftUI
import DynamicColor

struct InformationDetailView: View {
    var title: String = "title"
    var subTitle: String = "subTitle"
    var imageName: String = "car"

    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: imageName)
                .font(.largeTitle)
                .foregroundColor(Color("AccentColor"))
                .padding()

            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .padding(.bottom, 0.25)
                Text(subTitle)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(.top)
    }
}

struct IntroductionView: View {
    @Binding var isPresented: Bool
    @Environment(\.openURL) var openURL
    
    var body: some View {
        VStack {
            VStack(alignment: .center) {
                Spacer()
                    .frame(height: 30)
                VStack {
                    Image("DesignIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 160, alignment: .center)
                    Text("Welcome to")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("CPS Schedule")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                Spacer()
                    .frame(height: 30)
                VStack(alignment: .leading) {
                    InformationDetailView(title: "Widgets", subTitle: "Check your current and next classes at a glance, right from your home screen.", imageName: "app")
                    InformationDetailView(title: "Calendar", subTitle: "Pick any date of the year to check out its schedule in either day or week mode.", imageName: "calendar")
                    InformationDetailView(title: "Clubs", subTitle: "Meet the new way to organize and navigate CPS club events.", imageName: "list.bullet")
                }
                Spacer()
                    .frame(height: 20)
                Button(action: {
                    openURL(URL(string: "https://rsuite.wixsite.com/cps-schedule/ios")!)
                }) {
                    HStack(alignment: .center) {
                        Text("And even more")
                        Image(systemName: "arrow.up.forward")
                    }.padding()
                }
                Spacer()
                Button(action: {
                    self.isPresented = false
                    #if os(iOS)
                    let generator = UINotificationFeedbackGenerator()
                    generator.notificationOccurred(.success)
                    #endif
                }) {
                    Text("Continue")
                        .customButton()
                }
            }.padding()
        }
    }
}

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.headline)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color("AccentColor")))
            .padding(.bottom)
    }
}

extension View {
    func customButton() -> ModifiedContent<Self, ButtonModifier> {
        return modifier(ButtonModifier())
    }
}
