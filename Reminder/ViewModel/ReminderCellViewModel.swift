//
//  ReminderCellViewModel.swift
//  Reminder
//
//  Created by Goutham on 18/06/22.
//

import SwiftUI

class ReminderCellViewModel: ObservableObject {
    @Published var reminder: Reminder
    
    init(reminder: Reminder) {
        self.reminder = reminder
    }
    
    func setReminder() {
        ReminderManager.shared.set(reminder: reminder)
    }
    
    func deleteCell() {
        ReminderManager.shared.delete(reminder: reminder)
    }
}
