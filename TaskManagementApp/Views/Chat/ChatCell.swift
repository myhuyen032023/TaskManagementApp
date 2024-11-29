//
//  ChatCell.swift
//  TaskManagementApp
//
//  Created by Hoang Thi My Huyen on 8/11/24.
//

import SwiftUI

struct ChatCell: View {
    var isFromCurrent: Bool = false
    var background: Color {
        isFromCurrent ? .myPrimary : .tabBarBackground
    }
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            if isFromCurrent {
                HStack {
                    Spacer()
                    Text("Hi, please check ")
                        .padding(EdgeInsets(top: 13, leading: 12, bottom: 14, trailing: 25))
                        .foregroundStyle(isFromCurrent ? .black : .white)
                        .background(isFromCurrent ? .myPrimary : .tabBarBackground)
                        .frame(maxWidth: UIScreen.main.bounds.width * 0.62, alignment: .trailing)
                }
                Text("Seen")
                    .font(.system(size: 8).weight(.medium))
                    .foregroundStyle(.black)
                    .padding(.trailing, 5)
            } else {
                HStack {
                    Text("Hi, please check ")
                        .padding(EdgeInsets(top: 13, leading: 12, bottom: 14, trailing: 25))
                        .foregroundStyle(isFromCurrent ? .black : .white)
                        .background(isFromCurrent ? .myPrimary : .tabBarBackground)
                        .frame(maxWidth: UIScreen.main.bounds.width * 0.62, alignment: .leading)
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    ChatCell()
        .preferredColorScheme(.dark)
}
