//
//  SmallAddButton.swift
//  ToDo
//
//  Created by Lahiru Amarasooriya on 2023-10-08.
//

import SwiftUI

struct SmallAddButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 50)
                .foregroundColor(Color(red: 0.048, green: 0.296, blue: 0.088))
            
            Image(systemName: "plus")
                .font(.title)
                .bold()
                .foregroundColor(.white)
        }
        .frame(height: 50)
    }
}

#Preview {
    SmallAddButton()
}
