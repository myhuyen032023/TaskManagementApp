//
//  TaskDetails.swift
//  TaskManagementApp
//
//  Created by Hoang Thi My Huyen on 26/11/24.
//

import SwiftUI

struct TaskDetails: View {
    var task: ProjectTask
    @ObservedObject var viewModel: ProjectDetailsViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.background
                .ignoresSafeArea()
            
            ScrollView {
                // MARK: Project Title
                VStack(alignment: .leading, spacing: 13) {
                    Text(task.taskTitle)
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
                                
                                Text("\(task.dueDate.formatted(.dateTime.month().day()))")
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
                        
                        Text(task.taskDetails)
                            .font(.system(size: 12))
                            .foregroundStyle(.secondaryText)
                    }
                   
                }
                .padding(.horizontal, 29)
                .padding(.bottom, 120)
            }
            
            Button {
                // MARK: Mark as Done task
                viewModel.markTaskDone(taskId: task.id)
                dismiss()
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
                        Text("Mark as Done")
                            .font(.system(size: 18).weight(.semibold))
                            .foregroundStyle(.black)
                    }
            }
            .disabled(task.isDone)
        }
        .navigationTitle("Task Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        TaskDetails(task: ProjectTask(taskTitle: "", taskDetails: "", dueDate: .now, isDone: false), viewModel: ProjectDetailsViewModel(project: Project(projectTitle: "", projectDetails: "", dueDate: .now)))
            .preferredColorScheme(.dark)
    }
}
