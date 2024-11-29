//
//  TabBar.swift
//  TaskManagementApp
//
//  Created by Hoang Thi My Huyen on 6/11/24.
//

import SwiftUI

struct TabBar: View {
    @State var selectedIndex = 0
    @State var showTabBar = true
    @State var showCreateProject = false
    @StateObject var homeViewModel = HomeViewModel()
    var body: some View {
        ZStack(alignment: .bottom) {
            // MARK: Nav Bar Navigation
            
            TabView(selection: $selectedIndex) {
                HomeView(showTabBar: $showTabBar)
                    .environmentObject(homeViewModel)
                    .toolbar(showTabBar ? .visible : .hidden, for: .tabBar)
                    .tag(0)
                
                MessageView(selectedIndex: $selectedIndex, showTabBar: $showTabBar)
                    .toolbar(showTabBar ? .visible : .hidden, for: .tabBar)
                    .tag(1)
                
                Spacer()
                
                ScheduleView()
                    .tag(2)
                
                NotificationView()
                    .tag(3)
            }
            
            
            // MARK: Nav Bar View
            if showTabBar {
                ZStack {
                    Color.tabBarBackground
                        .frame(height: 87)
                    
                    HStack {
                        Spacer()
                        VStack(spacing: 2) {
                            Image(systemName: "house")
                                .resizable()
                                .frame(width: 24, height: 24)
                            
                            Text("Home")
                                .font(.system(size: 10))
                        }
                        .foregroundStyle(selectedIndex == 0 ? .myPrimary : .tabBarForeground)
                        .onTapGesture {
                            selectedIndex = 0
                        }
                        
                        Spacer()
                        
                        VStack(spacing: 2) {
                            Image(systemName: "ellipsis.message")
                                .resizable()
                                .frame(width: 24, height: 24)
                            
                            Text("Home")
                                .font(.system(size: 10))
                        }
                        .foregroundStyle(selectedIndex == 1 ? .myPrimary : .tabBarForeground)
                        .onTapGesture {
                            selectedIndex = 1
                        }
                        
                        Spacer()
                        
                        Button {
                            showCreateProject = true
                        } label: {
                            Rectangle()
                                .fill(.myPrimary)
                                .frame(width: 54, height: 54)
                                .overlay {
                                    Image(systemName: "plus.square")
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                        .foregroundStyle(.black)
                                }
                        }
                        
                        Spacer()
                        
                        VStack(spacing: 2) {
                            Image(systemName: "calendar")
                                .resizable()
                                .frame(width: 24, height: 24)
                            
                            Text("Home")
                                .font(.system(size: 10))
                        }
                        .foregroundStyle(selectedIndex == 2 ? .myPrimary : .tabBarForeground)
                        .onTapGesture {
                            selectedIndex = 2
                        }
                        
                        Spacer()
                        
                        VStack(spacing: 2) {
                            Image(systemName: "bell")
                                .resizable()
                                .frame(width: 24, height: 24)
                            
                            Text("Home")
                                .font(.system(size: 10))
                        }
                        .foregroundStyle(selectedIndex == 3 ? .myPrimary : .tabBarForeground)
                        .onTapGesture {
                            selectedIndex = 3
                        }
                        
                        Spacer()
                    }
                }
                .frame(maxHeight: 67, alignment: .bottom)
            }
        }
        .tint(.white)
        .fullScreenCover(isPresented: $showCreateProject) {
            NavigationStack {
                CreateProjectView()
                    .environmentObject(homeViewModel)
            }
        }
        .ignoresSafeArea()
    }
    
}

#Preview {
    TabBar()
        .preferredColorScheme(.dark)
}
