//
//  ReminderCell.swift
//  Reminder
//
//  Created by Goutham on 18/06/22.
//

import SwiftUI

struct ReminderCellView: View {
    
    @ObservedObject private var reminderCellVM: ReminderCellViewModel
    
    init(vm: ReminderCellViewModel) {
        self.reminderCellVM = vm
    }
    
    var body: some View {
        HStack {
            Image(systemName: "circle")
                .resizable()
                .frame(width: Constants.Icons.width, height: Constants.Icons.height)
                .foregroundColor(Color(UIColor.lightGray))
            
            Text(reminderCellVM.reminder.name)
            Spacer()
            Text(reminderCellVM.reminder.date.formatted(date: .abbreviated, time: .omitted))
        }
    }
}

struct ReminderCellEdit: View {
    
    @ObservedObject private var reminderCellVM: ReminderCellViewModel
    
    init(vm: ReminderCellViewModel) {
        self.reminderCellVM = vm
    }
    
    var body: some View {
        HStack {
            Image(systemName: "circle")
                .resizable()
                .frame(width: Constants.Icons.width, height: Constants.Icons.height)
                .foregroundColor(Color(UIColor.lightGray))
            
            TextField("Enter new reminder", text: $reminderCellVM.reminder.name)
                .onSubmit {
                reminderCellVM.setReminder()
            }
            DatePicker("", selection: $reminderCellVM.reminder.date, displayedComponents: DatePickerComponents.date)
        }
    }
}

struct ReminderCell_Previews: PreviewProvider {
    static var previews: some View {
        let reminder = mockData[0]
        VStack {
            ReminderCellView(vm: ReminderCellViewModel(reminder: reminder))
            
            ReminderCellEdit(vm: ReminderCellViewModel(reminder: reminder))
        }
    }
}
