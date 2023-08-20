//  GetCalendar.swift
//  Schedule.app
//
//  Created by Rahim Malik on 7/11/20.
//  Copyright © 2020 Rahim Malik. All rights reserved.

import SwiftUI
import Combine
import Foundation

class GetCalClubs: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    
    var event = EventCalModel() {
        willSet {
            self.objectWillChange.send()
        }
    }
    
    init() {
        getData()
    }
    
    func getData() {
        let testDate = Date()
        let myDateFormatter = DateFormatter()
        myDateFormatter.locale = Locale(identifier: "en_US_POSIX")
        myDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let startMO = testDate.startOfMonth()
        let endMO = testDate.endOfMonth()
        let calendarID = "ur_mom"
        let apiKey = "ur_mom"
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "www.googleapis.com"
        components.path = "/calendar/v3/calendars/\(calendarID)/events"
        components.queryItems = [
            URLQueryItem(name: "key", value: apiKey),
            URLQueryItem(name: "timeMin", value: myDateFormatter.string(from: startMO)),
            URLQueryItem(name: "timeMax", value: myDateFormatter.string(from: endMO)),
            URLQueryItem(name: "showDeleted", value: "false"),
            URLQueryItem(name: "singleEvents", value: "true")
        ]
        
        let urlFormat = components.url
        
        URLSession.shared.dataTask(with: urlFormat!) { (data, response, error) in
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    if let data = data {
                        DispatchQueue.main.async {
                            do {
                                let test = try JSONDecoder().decode(EventCal.self, from: data)
                                self.event = EventCalModel(model: test)
                            } catch {
                                print(error.localizedDescription)
                            }
                        }
                    }
                }
            }
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
        }.resume()
    }
}

class GetCalSports: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    var event = EventCalModel() {
        willSet {
            self.objectWillChange.send()
        }
    }
    
    init() {
        getData()
    }
    
    func getData() {
//                let testDate = Date()
        let myDateFormatter = DateFormatter()
        myDateFormatter.locale = Locale(identifier: "en_US_POSIX")
        myDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//                let startMO = testDate.startOfMonth()
//                let endMO = testDate.endOfMonth()
        let calendarID = "ur_mom"
        let apiKey = "ur_mom"
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "www.googleapis.com"
        components.path = "/calendar/v3/calendars/\(calendarID)/events"
        components.queryItems = [
            URLQueryItem(name: "key", value: apiKey),
//                        URLQueryItem(name: "timeMin", value: myDateFormatter.string(from: startMO)),
//                        URLQueryItem(name: "timeMax", value: myDateFormatter.string(from: endMO)),
            URLQueryItem(name: "showDeleted", value: "false"),
            URLQueryItem(name: "singleEvents", value: "true")
        ]
        
        let urlFormat = components.url
        
        URLSession.shared.dataTask(with: urlFormat!) { (data, response, error) in
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    if let data = data {
                        DispatchQueue.main.async {
                            do {
                                let test = try JSONDecoder().decode(EventCal.self, from: data)
                                self.event = EventCalModel(model: test)
                            } catch {
                                print(error.localizedDescription)
                            }
                        }
                    }
                }
            }
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
        }.resume()
    }
}
