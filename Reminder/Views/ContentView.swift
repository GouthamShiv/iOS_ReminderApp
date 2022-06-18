//
//  ContentView.swift
//  Reminder
//
//  Created by Goutham on 18/06/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var reminderManager = ReminderManager.shared
    @State private var hideCompleted = false
    @State private var addReminder = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                List {
                    Toggle("Hide Completed", isOn: $hideCompleted)
                    ForEach(reminderManager.reminders, id: \.id) { reminder in
                        ReminderCell(vm: ReminderCellViewModel(reminder: reminder))
                    }
                    if addReminder {
                        ReminderCell(vm: ReminderCellViewModel(reminder: Reminder.template()))
                    }
                }
                .padding(.horizontal, -20)
                
                HStack {
                    Button(action: {addReminder.toggle()},
                           label: {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: Constants.Icons.width, height: Constants.Icons.height, alignment: .center)
                            Text("New Reminder")
                        }
                        .padding()
                    })
                    
                    if addReminder {
                        Spacer()
                        Button(action: {
                            addReminder.toggle()
                        }, label: {
                            Text("Done")
                        })
                        .padding()
                    }
                }
            }
            .navigationBarTitle("Reminders")
            .toolbar(content: {
                EditButton()
            })
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
