//
//  ReminderManager.swift
//  Reminder
//
//  Created by Goutham on 18/06/22.
//

import Foundation

class ReminderManager: ObservableObject {
    static let shared = ReminderManager()
    
    @Published var reminders = [Reminder]()
    
    private init() {
        loadReminders()
    }
    
    private func loadReminders() {
        
    }
    
    func set(reminder: Reminder) {
        reminders.append(reminder)
    }
}
