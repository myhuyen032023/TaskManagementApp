//
//  HomeView.swift
//  TaskManagementApp
//
//  Created by Hoang Thi My Huyen on 6/11/24.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    @Binding var showTabBar: Bool
    @EnvironmentObject var viewModel: HomeViewModel
//    @State private var isLoading = true
    var completedProjects: [Project] {
        viewModel.projects.filter({ $0.progress == 100 })
    }
    var ongoingProjects: [Project] {
        viewModel.projects.filter({ $0.progress < 100 })
    }
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack {
                        Spacer()
                        //MARK: Search Bar
                        HStack {
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundStyle(.secondaryText)
                                TextField("Search Tasks", text: $searchText)
                            }
                            .padding()
                            .frame(height: 58)
                            .background(.secondaryBackground)
                            
                            Rectangle()
                                .fill(.myPrimary)
                                .frame(width: 58, height: 58)
                                .overlay{
                                    Image(.setting4)
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                }
                        }
                        .padding(.top, 30)
                        
                        // MARK: Completed Taskss
                        if !viewModel.completedProjects.isEmpty {
                            VStack(spacing: 16) {
                                HStack {
                                    Text("Completed Tasks")
                                        .font(.system(size: 20).weight(.semibold))
                                    Spacer()
                                    Text("See All")
                                        .font(.system(size: 16))
                                        .foregroundStyle(.myPrimary)
                                }
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    LazyHStack  {
                                        ForEach(viewModel.completedProjects) { project in
                                            NavigationLink {
                                                ProjectDetails(project: project, showTabBar: $showTabBar)
                                                    .navigationBarBackButtonHidden()
                                            } label: {
                                                CompletedTaskCell()
                                            }
                                            
                                        }
                                    }
                                }
                            }
                            .padding(.top)
                        }
                        
                        // MARK: Ongoing Projects
                        VStack(spacing: 16) {
                            HStack {
                                Text("Ongoing Projects")
                                    .font(.system(size: 20).weight(.semibold))
                                Spacer()
                                Text("See All")
                                    .font(.system(size: 16))
                                    .foregroundStyle(.myPrimary)
                            }
                            
                            LazyVStack {
                                ForEach(viewModel.ongoingProjects) { project in
                                    NavigationLink {
                                        ProjectDetails(project: project, showTabBar: $showTabBar)
                                            .navigationBarBackButtonHidden()
                                    } label: {
                                        OngoingProjectCell(project: project)
                                    }
                                    
                                }
                            }
                            
                        }
                        .padding(.top)
                    }
                    .padding(.horizontal)
                }
                
                // MARK: Loading View
//                if viewModel.isLoading {
//                    Color.white.opacity(0.3)
//                        .background(.ultraThinMaterial)
//                        .overlay {
//                            ProgressView()
//                        }
//                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    VStack(alignment: .leading) {
                        Text("Welcome Back!")
                            .font(.subheadline.weight(.medium))
                            .foregroundStyle(.myPrimary)
                        
                        Text("Fazil Laghari")
                            .font(.system(size: 23, weight: .medium, width: .expanded))
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        ProfileView(showTabBar: $showTabBar)
                            .navigationBarBackButtonHidden()
                    } label: {
                        Image(.rectangle6)
                            .resizable()
                            .scaledToFit()
                    }
                }
            }
            .onAppear {
                showTabBar = true
            }
            .ignoresSafeArea(edges: .bottom)
        }
        
    }
}

#Preview {
    NavigationStack {
        HomeView(showTabBar: .constant(true))
            .preferredColorScheme(.dark)
    }
}
