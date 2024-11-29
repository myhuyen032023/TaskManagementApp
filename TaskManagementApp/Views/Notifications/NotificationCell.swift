//
//  SwiftUIView.swift
//  TaskManagementApp
//
//  Created by Hoang Thi My Huyen on 9/11/24.
//

import SwiftUI

struct NotificationCell: View {
    var body: some View {
        HStack(spacing: 17) {
            Image(.ellipse42)
            
            Text("Olivia Anna")
                .font(.system(size: 14).weight(.semibold))
            +
            Text(" left a comment in task")
                .font(.system(size: 14))
                .foregroundStyle(.secondaryText)
            +
            Text(" Mobile App Design Project")
                .font(.system(size: 14))
                .foregroundStyle(.myPrimary)
                
            
            Text("31 min")
                .font(.system(size: 8).weight(.semibold))
                .padding(.leading, 36)
        }
        .frame(maxWidth: .infinity, minHeight: 47)
    }
}

#Preview {
    NotificationCell()
        .preferredColorScheme(.dark)
}
