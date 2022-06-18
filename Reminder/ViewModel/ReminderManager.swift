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
        if let data = UserDefaults.standard.data(forKey: Constants.appKey),
           let reminders = try? JSONDecoder().decode([Reminder].self, from: data) {
            self.reminders = self.sort(reminders: reminders)
        }
    }
    
    func set(reminder: Reminder) {
        var reminders = self.reminders
        if !reminders.filter({$0.id == reminder.id}).isEmpty {
            update(reminder: reminder)
        } else {
            reminders.append(reminder)
            save(reminders: reminders)
        }
        
    }
    
    func save(reminders: [Reminder]) {
        let encodedData = try? JSONEncoder().encode(reminders)
        UserDefaults.standard.set(encodedData, forKey: Constants.appKey)
        self.reminders = self.sort(reminders: reminders)
    }
    
    func sort(reminders: [Reminder]) -> [Reminder] {
        return reminders.sorted(by: { !$0.completed && $1.completed })
    }
    
    func update (reminder: Reminder) {
        var reminders = self.reminders
        if let index = reminders.firstIndex(where: {$0.id == reminder.id}) {
            reminders[index] = reminder
        }
        save(reminders: reminders)
    }
}
