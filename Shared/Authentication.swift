//
//  GoogleSignIn.swift
//  Schedule
//
//  Created by Rahim Malik on 1/27/21.
//  Copyright © 2021 Rahim Malik. All rights reserved.
//

import SwiftUI
import Foundation

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

struct AuthView: View {
    @State private var pin: String = ""
    @State var dismiss: Bool = false
    @Binding var authenticated: Bool
    @Environment(\.presentationMode) var presentationMode
//    #if os(iOS)
    @State private var alertItem: AlertItem? = nil
//    #endif
    let timer = Timer.publish(every: 1, tolerance: 1, on: .main, in: .common).autoconnect()
    @Binding var clubsArray: [EventCalModel.Item]
    @ObservedObject var clubsManager = GetCalClubs()
    @Binding var sportsArray: [EventCalModel.Item]
    @ObservedObject var sportsManager = GetCalSports()
    @Binding var qlArray: [Entry]
    @ObservedObject var qlManager = QLFetcher()
    
    var body: some View {
        #if os(iOS)
        VStack(spacing: 0) {
            Spacer()
            Text("Authentication")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Text("Starting March, The College Preparatory School students and faculty will have to be authenticated to view certain information. If you're a CPS student who wants access to features like Clubs View, Sports View, and QuickLinks, then enter the 6-Digit PIN sent to your Campus News inbox. Alternatively, you can continue as a guest user and authenticate later in the Settings tab.")
                .foregroundColor(Color("SystemGray"))
                .multilineTextAlignment(.center)
                .padding()
            TextField("6-Digit PIN", text: $pin)
                .onChange(of: pin, perform: { _ in
                    if pin.count >= 6 {
                        #if canImport(UIKit)
                        self.hideKeyboard()
                        #endif
                    }
                })
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12, style: .circular)
                        .foregroundColor(Color(.tertiarySystemFill))
                )
                .keyboardType(.numberPad)
                .padding([.top, .leading, .trailing])
            if pin.count < 6 {
                Button(action: {
                    self.dismiss = true
                }) {
                    HStack {
                        Spacer()
                        Text("Authenticate PIN")
                            .foregroundColor(Color(.secondarySystemFill))
                        Spacer()
                    }
                }
                .padding()
                .background(Color(.tertiarySystemFill))
                .cornerRadius(12)
                .disabled(pin.count < 6)
                .padding()
            } else {
                Button(action: {
                    if pin == "724469" {
                        authenticated = true
                        self.presentationMode.wrappedValue.dismiss()
                        UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.set(false, forKey: "AuthSheetStatus")
                    } else {
                        alertItem = AlertItem(title: "Incorrect PIN", message: "Please enter the correct 6-Digit PIN.")
                    }
                }) {
                    HStack {
                        Spacer()
                        Text("Authenticate PIN")
                            .foregroundColor(.white)
                        Spacer()
                    }
                }
                .padding()
                .background(Color("AccentColor"))
                .cornerRadius(12)
                .disabled(pin.count < 6)
                .padding()
            }
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
                UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.set(false, forKey: "AuthSheetStatus")
            }) {
                HStack {
                    Spacer()
                    Text("Continue as Guest")
                        .foregroundColor(Color("AccentColor"))
                    Spacer()
                }
            }
            .padding()
            .background(Color(.tertiarySystemFill))
            .cornerRadius(12)
            .padding()
            Spacer()
        }
        .onReceive(timer, perform: { _ in
            clubsArray = getDataClubs(input: clubsManager).items
            sportsArray = getDataSports(input: sportsManager).items
            qlArray = getQLData(input: qlManager)
        })
        .onDisappear(perform: {
            timer.upstream.connect().cancel()
        })
        .alert(item: $alertItem) { alert -> Alert in
            Alert(
                title: Text(alert.title),
                message: Text(alert.message)
            )
        }
        #endif
        #if os(macOS)
        VStack(spacing: 0) {
            Spacer()
            Text("Authentication")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Text("Starting March, The College Preparatory School students and faculty will have to be authenticated to view certain information. If you're a CPS student who wants access to features like Clubs View, Sports View, and QuickLinks, then enter the 6-Digit PIN sent to your Campus News inbox. Alternatively, you can continue as a guest user and authenticate later in the Settings tab.")
                .foregroundColor(Color("SystemGray"))
                .multilineTextAlignment(.center)
                .padding()
            TextField("6-Digit PIN", text: $pin)
                .onChange(of: pin, perform: { _ in
                    if pin.count >= 6 {
                        #if canImport(UIKit)
                        self.hideKeyboard()
                        #endif
                    }
                })
                .frame(width: 287.5)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            HStack {
            if pin.count < 6 {
                Button(action: {
                    self.dismiss = true
                }) {
                    HStack {
                        Spacer()
                        Text("Authenticate PIN")
//                            .foregroundColor(Color(.secondarySystemFill))
                        Spacer()
                    }
                }
//                .padding([.leading])
                .disabled(pin.count < 6)
//                .padding()
            } else {
                Button(action: {
                    if pin == "724469" {
                        authenticated = true
                        self.presentationMode.wrappedValue.dismiss()
                        UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.set(false, forKey: "AuthSheetStatus")
                    } else {
                        alertItem = AlertItem(title: "Incorrect PIN", message: "Please enter the correct 6-Digit PIN.")
                    }
                }) {
                    HStack {
                        Spacer()
                        Text("Authenticate PIN")
                            .foregroundColor(Color("AccentColor"))
                        Spacer()
                    }
                }
//                .padding([.leading])
                .disabled(pin.count < 6)
//                .padding()
            }
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
                UserDefaults(suiteName: "group.TheCollegePreparatorySchool.ScheduleApp")?.set(false, forKey: "AuthSheetStatus")
            }) {
                HStack {
                    Spacer()
                    Text("Continue as Guest")
                        .foregroundColor(Color("SystemContrast"))
                    Spacer()
                }
            }
//            .padding([.trailing])
            }
            Spacer()
        }
        .frame(width: 500, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .alert(item: $alertItem) { alert -> Alert in
            Alert(
                title: Text(alert.title),
                message: Text(alert.message)
            )
        }
        #endif
    }
}

struct AlertItem: Identifiable {
    var id = UUID()
    var title: String
    var message: String
}

#if os(iOS)
struct MbModalHackView: UIViewControllerRepresentable {
    var dismissable: () -> Bool = { false }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<MbModalHackView>) -> UIViewController {
        MbModalViewController(dismissable: self.dismissable)
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}

extension MbModalHackView {
    private final class MbModalViewController: UIViewController, UIAdaptivePresentationControllerDelegate {
        let dismissable: () -> Bool
        
        init(dismissable: @escaping () -> Bool) {
            self.dismissable = dismissable
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func didMove(toParent parent: UIViewController?) {
            super.didMove(toParent: parent)
            
            setup()
        }
        
        func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
            dismissable()
        }
        
        // set delegate to the presentation of the root parent
        private func setup() {
            guard let rootPresentationViewController = self.rootParent.presentationController, rootPresentationViewController.delegate == nil else { return }
            rootPresentationViewController.delegate = self
        }
    }
}

extension UIViewController {
    fileprivate var rootParent: UIViewController {
        if let parent = self.parent {
            return parent.rootParent
        }
        else {
            return self
        }
    }
}

/// make the call the SwiftUI style:
/// view.allowAutDismiss(...)
extension View {
    /// Control if allow to dismiss the sheet by the user actions
    public func allowAutoDismiss(_ dismissable: @escaping () -> Bool) -> some View {
        self
            .background(MbModalHackView(dismissable: dismissable))
    }
    
    /// Control if allow to dismiss the sheet by the user actions
    public func allowAutoDismiss(_ dismissable: Bool) -> some View {
        self
            .background(MbModalHackView(dismissable: { dismissable }))
    }
}
#endif
