//
//  TasksView.swift
//  ToDo
//
//  Created by Lahiru Amarasooriya on 2023-10-08.
//

import SwiftUI

struct TasksView: View {
    var body: some View {
        VStack {
            Text("My Tasks")
                .font(.title3)
                .bold()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        }
        .padding()
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(Color(hue: 0.017, saturation: 0.197, brightness: 1.0))
    }
}

#Preview {
    TasksView()
}
