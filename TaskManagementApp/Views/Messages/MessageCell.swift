//
//  MessageCell.swift
//  TaskManagementApp
//
//  Created by Hoang Thi My Huyen on 7/11/24.
//

import SwiftUI

struct MessageCell: View {
    var body: some View {
        HStack(spacing: 17) {
            Image(.ellipse41)
                .resizable()
                .scaledToFit()
                .frame(width: 47, height: 47)
            
            VStack(alignment: .leading) {
                Text("Olivia Anna")
                    .font(.system(size: 14).weight(.semibold))
                
                Text("Hi, please check the last task, that IHi, please check the last task, that IHi, please check the last task, that I....")
                    .font(.system(size: 14))
                    .frame(width: 220, height: 20)
                    .foregroundStyle(.messageText)
            }
            
            Spacer()
            
            VStack {
                Text("43 min")
                    .font(.system(size: 8).weight(.semibold))
                
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 6, height: 6)
                    .foregroundStyle(.myPrimary)
            }
        }
        .frame(maxWidth: .infinity, minHeight: 47)
    }
}

#Preview {
    MessageCell()
        .preferredColorScheme(.dark)
}
