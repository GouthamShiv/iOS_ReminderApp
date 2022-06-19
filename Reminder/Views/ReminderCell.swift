//
//  ReminderCell.swift
//  Reminder
//
//  Created by Goutham on 18/06/22.
//

import SwiftUI

struct ReminderCell: View {
    
    @ObservedObject private var reminderCellVM: ReminderCellViewModel
    
    init(vm: ReminderCellViewModel) {
        self.reminderCellVM = vm
    }
    
    var body: some View {
        HStack {
            Image(systemName: reminderCellVM.reminder.completed ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: Constants.Icons.width, height: Constants.Icons.height)
                .foregroundColor(reminderCellVM.reminder.completed ? .red : Color(UIColor.lightGray))
                .onTapGesture {
                    reminderCellVM.reminder.completed.toggle()
                    reminderCellVM.setReminder()
                }
            
            TextField("Enter new reminder", text: $reminderCellVM.reminder.name)
                .onSubmit {
                    if reminderCellVM.reminder.name.isEmpty {
                        reminderCellVM.deleteCell()
                    } else {
                        reminderCellVM.setReminder()
                    }
                }
            DatePicker("", selection: $reminderCellVM.reminder.date, displayedComponents: DatePickerComponents.date)
        }
    }
}

struct ReminderCell_Previews: PreviewProvider {
    static var previews: some View {
        let reminder = mockData[0]
        VStack {
            ReminderCell(vm: ReminderCellViewModel(reminder: reminder))
        }
    }
}
