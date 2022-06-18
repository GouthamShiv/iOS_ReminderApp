//
//  Reminder.swift
//  Reminder
//
//  Created by Goutham on 18/06/22.
//

import Foundation

struct Reminder: Identifiable, Codable {
    var id = UUID().uuidString
    var name: String
    var completed: Bool
    var date: Date
    
    static func template() -> Reminder {
        return Reminder(name: "", completed: false, date: Date())
    }
}

#if DEBUG
    let mockData = [
        Reminder(name: "Book tickets", completed: false, date: Date().addingTimeInterval(TimeInterval(5000))),
        Reminder(name: "Buy grocery", completed: false, date: Date().addingTimeInterval(TimeInterval(9000))),
        Reminder(name: "Prepare dish", completed: false, date: Date().addingTimeInterval(TimeInterval(12000))),
        Reminder(name: "Holiday plan", completed: false, date: Date().addingTimeInterval(TimeInterval(19000))),
        Reminder(name: "Research for thesis", completed: false, date: Date().addingTimeInterval(TimeInterval(22000))),
        Reminder(name: "Publish app to AppStore", completed: false, date: Date().addingTimeInterval(TimeInterval(40000))),
    ]
#endif
