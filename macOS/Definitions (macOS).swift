//
//  Separate.swift
//  Schedule
//
//  Created by Rahim Malik on 8/18/20.
//  Copyright © 2020 Rahim Malik. All rights reserved.
//

import SwiftUI
import Combine
import Foundation

class TimerWrapper : ObservableObject {
    let objectWillChange = ObservableObjectPublisher()

    var timer : Timer!
    func start(withTimeInterval interval: Double = 0.1) {
        self.timer?.invalidate()
        self.timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
            self.objectWillChange.send()
        }
    }
    
    func stop() {
        self.timer?.invalidate()
    }
}

var screenWidth  = NSScreen.main!.frame.height * 0.60
var screenHeight = NSScreen.main!.frame.height * 0.60


let opacityLight: Double = 1
let opacityDark: Double = 1

//MARK: BlockHeights
let longBlock = screenHeight * 0.1
let shortBlock = screenHeight * 0.057
let passingBlock = screenHeight * 0.02
let mediumBlock = screenHeight * 0.075
let asynchBlock = screenHeight * 0.0775
let assemblyBlock = screenHeight * 0.04
let xBlock = screenHeight * 0.025
let lunchBlock = screenHeight * 0.0875
let fullLength = screenHeight
let fullWidth = screenHeight * 0.150

//MARK: BlockColors
let systemBlue = NSColor.systemBlue
let systemGreen = NSColor.systemGreen
let systemOrange = NSColor.systemOrange
let systemIndigo = NSColor.systemIndigo
let systemPurple = NSColor.systemPurple
let systemMagenta = NSColor(red: 1.00, green: 0.00, blue: 0.48, alpha: 1.00)
let systemRed = NSColor.systemRed
let systemYellow = NSColor.systemYellow

let systemA = NSColor(Color("Apricot"))
let systemB = NSColor(Color("Hibiscus"))
let systemC = NSColor(Color("Crystal"))
let systemD = NSColor(Color("Sea Foam"))
let systemE = NSColor(Color("Dragon Fruit"))
let systemF = NSColor(Color("Lavender"))
let systemG = NSColor(Color("Clementine"))
let systemH = NSColor(Color("Surf"))

let systemTeal = NSColor(red: 0.06, green: 0.70, blue: 0.91, alpha: 1.00)
let accentTeal = NSColor(Color("AccentColor"))
let systemGray = NSColor(Color("SystemGray4"))
let systemAdaptive = NSColor(Color("SystemGray4"))
let systemAbsence = NSColor(Color("SystemGray2"))

extension UserDefaults {
    func colorForKey(key: String) -> NSColor? {
        var colorReturned: NSColor?
        if let colorData = data(forKey: key) {
            do {
                if let color = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(colorData) as? NSColor {
                    colorReturned = color
                }
            } catch {
                print("Error UserDefaults")
            }
        }
        return colorReturned
    }
    
    func setColor(color: NSColor?, forKey key: String) {
        var colorData: NSData?
        if let color = color {
            do {
                let data = try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: false) as NSData?
                colorData = data
            } catch {
                print("Error UserDefaults")
            }
        }
        set(colorData, forKey: key)
    }
}

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }
    
    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}
