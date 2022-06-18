//
//  ContentView.swift
//  Reminder
//
//  Created by Goutham on 18/06/22.
//

import SwiftUI

struct ContentView: View {
    //    @State private var reminders = [Reminder]()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                List(mockData, id: \.id) { reminder in
                    Text(reminder.name)
                }
                .padding(.horizontal, -20)
                Button(action: {
                    
                },
                label: {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 25, height: 25, alignment: .center)
                        Text("New Reminder")
                    }
                    .padding()
                })
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
