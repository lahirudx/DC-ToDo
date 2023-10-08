//
//  ContentView.swift
//  ToDo
//
//  Created by Lahiru Amarasooriya on 2023-10-08.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showAddTaskView = false
    @StateObject private var realmManager = RealmManager()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
                TasksView()
                    .environmentObject(realmManager)
                
                SmallAddButton()
                    .padding()
                    .onTapGesture {
                        showAddTaskView.toggle()
                    }
                       
            
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(Color(hue: 0.017, saturation: 0.197, brightness: 1.0))
        .sheet(isPresented: $showAddTaskView, content: {
            AddTaskView()
                .environmentObject(realmManager)
        })
    }
}

#Preview {
    ContentView()
}
