//
//  TaskRow.swift
//  ToDo
//
//  Created by Lahiru Amarasooriya on 2023-10-08.
//

import SwiftUI

struct TaskRow: View {
    var task: String
    var completed: Bool
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: completed ? "checkmark.circle" : "circle")
            
            Text(task)
        }
    }
}

#Preview {
    TaskRow(task: "Do coding", completed: true)
}
