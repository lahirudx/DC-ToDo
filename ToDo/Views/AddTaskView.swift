//
//  AddTaskView.swift
//  ToDo
//
//  Created by Lahiru Amarasooriya on 2023-10-08.
//

import SwiftUI

struct AddTaskView: View {
    @State private var title: String = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var realmManager: RealmManager
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Crate a new task")
                .bold()
                .font(.title3)
            
            TextField("Enter your task here", text: $title)
                .textFieldStyle(.roundedBorder)
            
            Button {
                
                if title != "" {
                    realmManager.addTask(taskTitle: title)
                }
                dismiss()
            } label: {
                Text("Add task")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color(red: 0.048, green: 0.296, blue: 0.088))
                    .cornerRadius(30)
            }
            
            Spacer()

        }
        .padding(.top, 40)
        .padding(.horizontal)
        .background(Color(hue: 0.017, saturation: 0.197, brightness: 1.0))
        
    }
}

#Preview {
    AddTaskView()
        .environmentObject(RealmManager())
}
