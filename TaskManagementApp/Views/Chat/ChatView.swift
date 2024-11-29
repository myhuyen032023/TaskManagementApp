//
//  ChatView.swift
//  TaskManagementApp
//
//  Created by Hoang Thi My Huyen on 7/11/24.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.background
                .ignoresSafeArea()
            
            ScrollView {
                VStack {
                    ForEach(0..<15) { _ in
                        ChatCell(isFromCurrent: .random())
                    }
                }
                .padding(.top, 54)
                .padding(.horizontal, 20)
            }
            .padding(.bottom, 74)
            
            HStack {
                HStack {
                    Image(.element)
                    TextField("Type a message", text: $messageText, axis: .vertical)
                        .font(.system(size: 16))
                    Image(.send)
                }
                .padding()
                .frame(width: 300)
                .background(.tabBarBackground)
                
                Image(.microphone2)
                    .frame(width: 57, height: 57)
                    .background(.tabBarBackground)
    
                    
            }
            .padding(.bottom, 1)
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                HStack(spacing: 43) {
                    Button {
                        dismiss()
                    } label: {
                        Image(.arrowleft)
                    }
                    
                    HStack(spacing: 17) {
                        Image(.ellipse38)
                            .resizable()
                            .scaledToFit()
                            
                        VStack(alignment: .leading) {
                            Text("Olivia Anna")
                                .font(.system(size: 14).weight(.semibold))
                            
                            Text("Online")
                                .font(.system(size: 14))
                                .foregroundStyle(.messageText)
                        }
                    }
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                HStack(spacing: 19) {
                    Image(.callcalling)
                    
                    Image(.video)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ChatView()
            .preferredColorScheme(.dark)
    }
}
