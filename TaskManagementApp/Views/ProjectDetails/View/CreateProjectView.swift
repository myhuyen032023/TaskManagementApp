//
//  CreateProjectView.swift
//  TaskManagementApp
//
//  Created by Hoang Thi My Huyen on 8/11/24.
//

import SwiftUI

struct CreateProjectView: View {
    
    @StateObject var viewModel = CreateProjectViewModel()
    @State private var showAddTeamMember = false
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var homeViewModel: HomeViewModel
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    // MARK: Project Title
                    VStack(alignment: .leading) {
                        Text("Project Title")
                            .font(.system(size: 20).weight(.semibold))
                        
                        TextField("Project Title", text: $viewModel.projectTitle)
                            .font(.system(size: 18))
                            .padding()
                            .frame(maxWidth: .infinity, minHeight: 48)
                            .background(.secondaryBackground)
                    }
                    
                    // MARK: Project Details
                    VStack(alignment: .leading) {
                        Text("Project Details")
                            .font(.system(size: 20).weight(.semibold))
                        
                        TextField("Project Details", text: $viewModel.projectDetails, axis: .vertical)
                            .font(.system(size: 18))
                            .padding()
                            .frame(maxWidth: .infinity, minHeight: 48)
                            .background(.secondaryBackground)
                    }
                    
                    // MARK: Add team members
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Add team members")
                                .font(.system(size: 20).weight(.semibold))
                            
                            Spacer()
                            
                            Button {
                                //MARK: Add team member
                                showAddTeamMember = true
                            } label: {
                                Rectangle()
                                    .fill(.myPrimary)
                                    .frame(width: 41, height: 41)
                                    .overlay {
                                        Image(systemName: "plus.square")
                                            .resizable()
                                            .frame(width: 24, height: 24)
                                            .foregroundStyle(.black)
                                    }
                            }
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(viewModel.members) { member in
                                    HStack {
                                        Image(.ellipse1)
                                        
                                        Text(member.fullname)
                                            .font(.system(size: 14).weight(.medium))
                                        Spacer()
                                        
                                        Button {
                                            // MARK: Remove member
                                            viewModel.members.removeAll(where: {$0.email == member.email})
                                            
                                        } label: {
                                            Image(systemName: "xmark.square")
                                                .foregroundStyle(.white)
                                        }
                                    }
                                    .padding(.leading, 11)
                                    .padding(.trailing, 7)
                                    .frame(width: 150, height: 41)
                                    .background(.secondaryBackground)
                                }
                            
                                
                            }
                            .padding(.bottom)
                        }
                        
                        
                    }
                    
                    // MARK: Time & Date
                    VStack(alignment: .leading) {
                        Text("Time & Date")
                            .font(.system(size: 20).weight(.semibold))
                        
                        HStack {
                            ZStack(alignment: .leading) {
                                DatePicker("Choose Due Time", selection: $viewModel.dueDate, displayedComponents: .hourAndMinute)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .labelsHidden()
                                    .offset(x: 20)
                                
                                
                            }
                            .frame(width: 176, height: 41)
                            .background(.secondaryBackground)
                            .overlay {
                                HStack {
                                    Rectangle()
                                        .fill(.myPrimary)
                                        .frame(width: 41, height: 41)
                                        .overlay {
                                            Image(systemName: "clock")
                                                .resizable()
                                                .frame(width: 24, height: 24)
                                                .foregroundStyle(.black)
                                        }
                                    Spacer()
                                }
                            }
                            
                            HStack {
                                Rectangle()
                                    .fill(.myPrimary)
                                    .frame(width: 41, height: 41)
                                    .overlay {
                                        Image(systemName: "calendar")
                                            .resizable()
                                            .frame(width: 24, height: 24)
                                            .foregroundStyle(.black)
                                    }
                                
                                Spacer()
                            }
                            .frame(width: 176, height: 41)
                            .background(.secondaryBackground)
                            .overlay {
                                DatePicker("Choose Due Time", selection: $viewModel.dueDate, displayedComponents: .date)
                                    .labelsHidden()
                                    .offset(x: 20)
                            }
                        }
                    }
                    
                    Button {
                        // MARK: Create Project
                        viewModel.createProject()
                        dismiss()
                        
                        // MARK: back to home  & show loading view & call api once more
                        homeViewModel.getProjects()
                    } label: {
                        Text("Create")
                            .font(.system(size: 18).weight(.semibold))
                            .frame(maxWidth: .infinity, minHeight: 67)
                            .foregroundStyle(.black)
                            .background(.myPrimary)
                    }
                    .padding(.top, 40)
                    
                    Spacer()
                }
                .padding(.top, 39)
            .padding(.horizontal)
            }
        }
        .navigationTitle("Create New Project")
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
        .sheet(isPresented: $showAddTeamMember) {
            AddTeamMemberModal(teamMembers: $viewModel.members)
                .presentationDetents([.fraction(0.95)])
                .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    NavigationStack {
        CreateProjectView()
            .preferredColorScheme(.dark)
    }
}
