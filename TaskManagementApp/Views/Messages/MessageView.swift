//
//  ChatView.swift
//  TaskManagementApp
//
//  Created by Hoang Thi My Huyen on 6/11/24.
//

import SwiftUI

struct MessageView: View {
    @State private var selection = 0
    @Binding var selectedIndex: Int
    @Binding var showTabBar: Bool
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                
                VStack(spacing: 32) {
                    HStack {
                        Rectangle()
                            .fill(selection == 0 ? .myPrimary : .tabBarBackground)
                            .frame(width: 175, height: 47)
                            .overlay {
                                Text("Chat")
                                    .font(.system(size: 14).weight(.medium))
                                    .foregroundStyle(selection == 0 ? .black : .white)
                            }
                            .onTapGesture {
                                selection = 0
                            }
                        
                        Rectangle()
                            .fill(selection == 1 ? .myPrimary : .tabBarBackground)
                            .frame(width: 175, height: 47)
                            .overlay {
                                Text("Groups")
                                    .font(.system(size: 14).weight(.medium))
                                    .foregroundStyle(selection == 1 ? .black : .white)
                            }
                            .onTapGesture {
                                selection = 1
                            }
                    }
                    
                    ScrollView {
                        VStack(spacing: 33) {
                            ForEach(0..<10, id: \.self) { _ in
                                NavigationLink {
                                    ChatView()
                                        .navigationBarBackButtonHidden()
                                        
                                } label: {
                                    MessageCell()
                                }

                            }
                        }
                    }
                }
                .padding(.top, 36)
                .padding(.horizontal, 29)
            }
            .onAppear {
                showTabBar = false
            }
            .navigationTitle("Messages")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        selectedIndex = 0
                        showTabBar = true
                    } label: {
                        Image(.arrowleft)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        NewMessageView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Image(.edit)
                    }

                }
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

#Preview {
    NavigationStack {
        MessageView(selectedIndex: .constant(1), showTabBar: .constant(true))
            .preferredColorScheme(.dark)
    }
}
