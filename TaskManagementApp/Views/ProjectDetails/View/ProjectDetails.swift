//
//  SwiftUIView.swift
//  TaskManagementApp
//
//  Created by Hoang Thi My Huyen on 6/11/24.
//

import SwiftUI

struct ProjectDetails: View {
    @Environment(\.dismiss) var dismiss
    @Binding var showTabBar: Bool
    @State private var showAddTask = false
    var project: Project
    @StateObject var viewModel: ProjectDetailsViewModel
    
    init(project: Project, showTabBar: Binding<Bool>) {
        self.project = project
        _showTabBar = showTabBar
        _viewModel = StateObject(wrappedValue: ProjectDetailsViewModel(project: project))
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.background
                .ignoresSafeArea()
            
            ScrollView {
                // MARK: Project Title
                VStack(alignment: .leading, spacing: 13) {
                    Text(project.projectTitle)
                        .font(.system(size: 21, weight: .medium, width: .expanded))
                        .padding(.bottom, 14)
                        .padding(.top, 40)
                    
                    HStack {
                        // MARK: Project Due & Team Members
                        HStack {
                            Rectangle()
                                .fill(.myPrimary)
                                .frame(width: 54, height: 54)
                                .overlay {
                                    Image(systemName: "plus.square")
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                        .foregroundStyle(.black)
                                }
                            
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Due Date")
                                    .font(.system(size: 11).weight(.medium))
                                
                                Text("\(project.dueDate.formatted(.dateTime.month().day()))")
                                    .font(.system(size: 17).weight(.semibold))
                            }
                            
                            Spacer()
                            
                            Rectangle()
                                .fill(.myPrimary)
                                .frame(width: 54, height: 54)
                                .overlay {
                                    Image(.profile2User)
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                        .foregroundStyle(.black)
                                }
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Project Team")
                                    .font(.system(size: 11).weight(.medium))
                                
                                ZStack {
                                    Image(.ellipse1)
                                    Image(.ellipse2)
                                        .offset(x: 13)
                                    Image(.ellipse3)
                                        .offset(x: 13 * 2)
                                }
                            }
                        }
                    }
                    .padding(.bottom, 17)
                    
                    // MARK: Project Details
                    VStack(alignment: .leading, spacing: 9) {
                        Text("Project Details")
                            .font(.system(size: 18).weight(.semibold))
                        
                        Text(project.projectDetails)
                            .font(.system(size: 12))
                            .foregroundStyle(.secondaryText)
                    }
                    
                    // MARK: Project Progress
                    HStack {
                        Text("Project Progress")
                            .font(.system(size: 18).weight(.medium))
                        
                        Spacer()
                        
                        Circle()
                            .stroke(Color.background, lineWidth: 2)
                            .overlay {
                                Circle()
                                    .trim(from: 0, to: project.progress)
                                    .stroke(lineWidth: 2)
                                    .rotationEffect(.degrees(60))
                                    .foregroundStyle(.myPrimary)
                            }
                            .frame(width: 59, height: 59)
                            .overlay{
                                Text("\(Int(project.progress * 100))%")
                                    .font(.system(size: 11).weight(.semibold))
                            }
                            .offset(y: 8)
                    }
                    .padding(.bottom, 15)
                    
                    // MARK: All Tasks
                    VStack(alignment: .leading, spacing: 22) {
                        Text("All Tasks")
                            .font(.system(size: 18).weight(.medium))
                        
                            VStack(spacing: 12) {
                                ForEach(viewModel.tasks) { task in
                                    NavigationLink {
                                        TaskDetails(task: task, viewModel: viewModel)
                                    } label: {
                                        // MARK: Task Cell
                                        HStack {
                                            VStack(alignment: .leading) {
                                                Text(task.taskTitle)
                                                    .font(.system(size: 18).weight(.medium))
                                                
                                                Text(task.dueDate.formatted(date: .abbreviated, time: .complete))
                                                    .font(.system(size: 12))
                                            }
                                            .foregroundStyle(task.isDone ? .black : .white)
                                            
                                            Spacer()
                                            
                                            ZStack {
                                                Image(.ellipse1)
                                                Image(.ellipse2)
                                                    .offset(x: 13)
                                                Image(.ellipse3)
                                                    .offset(x: 13 * 2)
                                            }
                                            .padding(.trailing, 40)
                                        }
                                        .padding(.leading, 22)
                                        .frame(height: 72)
                                        .background(task.isDone ? Color.myPrimary : Color.tabBarBackground)
                                        .overlay {
                                            HStack {
                                                Rectangle()
                                                    .fill(Color.myPrimary)
                                                    .frame(width: 11, height: 72)
                                                
                                                Spacer()
                                            }
                                        }
                                    }

                                }
                            }
                        
                    }
                }
                .padding(.horizontal, 29)
                .padding(.bottom, 120)
            }
            
            Button {
                // MARK: Add Task
                showAddTask = true
            } label: {
                Rectangle()
                    .fill(Color.background)
                    .frame(height: 104)
                    .overlay {
                        Rectangle()
                            .fill(Color.myPrimary)
                            .frame(width: 318, height: 57)
                            
                    }
                    .overlay {
                        Text("Add Task")
                            .font(.system(size: 18).weight(.semibold))
                            .foregroundStyle(.black)
                    }
            }
        }
        .onAppear {
            showTabBar = false
        }
//        .navigationDestination(for: ProjectTask.self, destination: { task in
//            TaskDetails(task: task, viewModel: viewModel)
//        })
        .navigationTitle("Project Details")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(.arrowleft)
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Image(.edit)
            }
        }
        .sheet(isPresented: $showAddTask) {
            NavigationStack {
                CreateTaskView(viewModel: viewModel)
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    NavigationStack {
        ProjectDetails(project: Project(projectTitle: "", projectDetails: "", dueDate: .now), showTabBar: .constant(true))
            .preferredColorScheme(.dark)
    }
}
