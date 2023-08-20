//  Definitions (iOS).swift
//  Schedule.app
//
//  Created by Rahim Malik on 7/11/20.
//  Copyright © 2020 Rahim Malik. All rights reserved.

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

let screenWidth  = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

let opacityLight: Double = 1
let opacityDark: Double = 1

//MARK: BlockHeights
let longBlock = screenHeight * 0.1
//let longBlock = screenHeight * 0.1075
let badBlock = screenHeight * 0.105
let shortBlock = screenHeight * 0.05775
let passingBlock = screenHeight * 0.02
let passingBlock2 = screenHeight * 0.006
let mediumBlock = screenHeight * 0.075
let asynchBlock = screenHeight * 0.08
let assemblyBlock = screenHeight * 0.04
let xBlock = screenHeight * 0.025
let lunchBlock = screenHeight * 0.0875
//let lunchBlock = screenHeight * 0.0879
let halfBlock = screenHeight * 0.051
let fullLength = screenHeight * 0.70
let fullWidth = screenHeight * 0.150

//MARK: BlockColors
let systemBlue = UIColor.systemBlue
let systemGreen = UIColor.systemGreen
let systemOrange = UIColor.systemOrange
let systemIndigo = UIColor.systemIndigo
let systemPurple = UIColor.systemPurple
let systemMagenta = UIColor(red: 1.00, green: 0.00, blue: 0.48, alpha: 1.00)
let systemRed = UIColor.systemRed
let systemYellow = UIColor.systemYellow

let accentTeal = UIColor(Color("AccentColor"))

let systemA = UIColor(Color("Apricot"))
let systemB = UIColor(Color("Hibiscus"))
let systemC = UIColor(Color("Crystal"))
let systemD = UIColor(Color("Sea Foam"))
let systemE = UIColor(Color("Dragon Fruit"))
let systemF = UIColor(Color("Lavender"))
let systemG = UIColor(Color("Clementine"))
let systemH = UIColor(Color("Surf"))

let systemTeal = UIColor(red: 0.06, green: 0.70, blue: 0.91, alpha: 1.00)
let systemGray = UIColor.systemGray4
let systemAdaptive = UIColor.systemGray4
let systemAbsence = UIColor.systemGray4

extension UserDefaults {
    func colorForKey(key: String) -> UIColor? {
        var colorReturned: UIColor?
        if let colorData = data(forKey: key) {
            do {
                if let color = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(colorData) as? UIColor {
                    colorReturned = color
                }
            } catch {
                print("Error UserDefaults")
            }
        }
        return colorReturned
    }
    
    func setColor(color: UIColor?, forKey key: String) {
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

class ImageLoader: ObservableObject {
    var dataPublisher = PassthroughSubject<Data, Never>()
    var data = Data() {
        didSet {
            dataPublisher.send(data)
        }
    }
    init(urlString:String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}

struct ImageView: View {
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()
    init(withURL url:String) {
        imageLoader = ImageLoader(urlString:url)
    }
    var body: some View {
        VStack {
            GeometryReader { geo in
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width)
            }
        }
        .onReceive(imageLoader.dataPublisher) { data in
            self.image = UIImage(data: data) ?? UIImage()
        }
    }
}
