//
//  ProfileView.swift
//  TaskManagementApp
//
//  Created by Hoang Thi My Huyen on 9/11/24.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var showTabBar: Bool
    
    @StateObject var viewModel = ProfileViewModel()
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack {
                        Image(.ellipse36)
                            .overlay {
                                Circle()
                                    .stroke(Color.myPrimary, lineWidth: 2)
                                    .frame(width: 133, height: 133)
                                
                            }
                            .overlay {
                                ZStack {
                                    Circle()
                                        .fill(Color.black)
                                        .frame(width: 33, height: 33)
                                    
                                    Image(systemName: "plus.square")
                                        .imageScale(.large)
                                }
                                .offset(x: 46, y: 46)
                            }
                        
                        
                        VStack(spacing: 26) {
                            HStack(spacing: 14) {
                                Image(.useradd)
                                
                                TextField("Fullname", text: $viewModel.fullname)
                                
                                Image(.edit)
                            }
                            .padding(.horizontal, 14)
                            .frame(maxWidth: .infinity, minHeight: 54)
                            .background(.secondaryBackground)
                            
                            HStack(spacing: 14) {
                                Image(.usertag)
                                
                                TextField("Email Adress", text: $viewModel.email)
                                
                                Image(.edit)
                            }
                            .padding(.horizontal, 14)
                            .frame(maxWidth: .infinity, minHeight: 54)
                            .background(.secondaryBackground)
                            
                            HStack(spacing: 14) {
                                Image(.lock)
                                
                                TextField("Password", text: $viewModel.password)
                                
                                Image(.edit)
                            }
                            .padding(.horizontal, 14)
                            .frame(maxWidth: .infinity, minHeight: 54)
                            .background(.secondaryBackground)
                            
                            HStack(spacing: 14) {
                                Image(.task)
                                
                                Text("My Tasks")
                                
                                Spacer()
                                
                                Image(systemName: "chevron.down")
                            }
                            .padding(.horizontal, 14)
                            .frame(maxWidth: .infinity, minHeight: 54)
                            .background(.secondaryBackground)
                            
                            HStack(spacing: 14) {
                                Image(.securitycard)
                                
                                Text("Privacy")
                                
                                Spacer()
                                
                                Image(systemName: "chevron.down")
                            }
                            .padding(.horizontal, 14)
                            .frame(maxWidth: .infinity, minHeight: 54)
                            .background(.secondaryBackground)
                            
                            HStack(spacing: 14) {
                                Image(.setting2)
                                
                                Text("Settings")
                                
                                Spacer()
                                
                                Image(systemName: "chevron.down")
                            }
                            .padding(.horizontal, 14)
                            .frame(maxWidth: .infinity, minHeight: 54)
                            .background(.secondaryBackground)
                        }
                        .padding(.top, 12)
                        .padding(.bottom, 26)
                        
                        Button {
                            //MARK: Logout
                            viewModel.logout()
                            
                        } label: {
                            Label("Logout", systemImage: "rectangle.portrait.and.arrow.right")
                                .font(.system(size: 18).weight(.medium))
                                .frame(maxWidth: .infinity, minHeight: 54)
                                .background(.myPrimary)
                                .foregroundStyle(.black)
                            
                        }
                    }
                    .padding(.top, 12)
                    .padding(.horizontal, 20)
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(.arrowleft)
                    }
                }
            }
            .onAppear {
                showTabBar = false
            }
        }
        
    }
}

#Preview {
    NavigationStack {
        ProfileView(showTabBar: .constant(true))
            .preferredColorScheme(.dark)
    }
}
