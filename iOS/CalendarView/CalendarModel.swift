//  CalendarModel.swift
//  Schedule.app
//
//  Created by Rahim Malik on 7/11/20.
//  Copyright © 2020 Rahim Malik. All rights reserved.

import Foundation

struct EventCalModel {
    var items: [Item]
    
    struct Item: Codable  {
        let id: String
        let status: String
        let summary: String
        let description: String
        let location: String
        let clubCategory: String
        let start: String
        let dateTime: String
        let timeZone: String
        let end: String
        let endDateTime: String
        let sort: String
    }
    
    init() {
        self.items = [Item]()
    }
    
    init(model: EventCal) {
        self.init()
        
        for index in 0..<model.items.count {
            let id = model.items[index].id
            let status = model.items[index].status
            let summary = model.items[index].summary ?? ""
            let description = model.items[index].description ?? ""
            let location = model.items[index].location ?? ""
            let clubCategory = (model.items[index].sportType ?? "")
            let start = model.items[index].start?.date ?? ""
            let dateTime = model.items[index].start?.dateTime ?? ""
            let timeZone = model.items[index].start?.timeZone ?? ""
            let end = model.items[index].end?.date ?? ""
            let endDateTime = model.items[index].end?.dateTime ?? ""
            let sort = model.items[index].start?.date ?? model.items[index].start?.dateTime
            if model.items[index].status == "cancelled" {
                
            } else {
                var sorted = ""
                if start == "" {
                    sorted = getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "dd", convertDate: sort!)
                } else if dateTime == "" {
                    sorted = getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd", conVertFormate: "dd", convertDate: sort!)
                }
                self.items.append(Item(id: id, status: status, summary: summary, description: description, location: location, clubCategory: clubCategory, start: start, dateTime: dateTime, timeZone: timeZone, end: end, endDateTime: endDateTime, sort: sorted))
            }
        }
    }
}
