//
//  CreateProjectViewModel.swift
//  TaskManagementApp
//
//  Created by Hoang Thi My Huyen on 11/11/24.
//

import Foundation

class CreateProjectViewModel: ObservableObject {
    @Published var projectTitle = ""
    @Published var projectDetails = ""
    @Published var members: [User] = []
    @Published var dueDate: Date = Date.now
    
    init() {
        if let currentUser = UserService.shared.currentUser {
            members.append(currentUser)
        }
    }
    
    
    func createProject() {
        Task { try await ProjectService.shared.createProject(projectTitle: projectTitle, projectDetails: projectDetails, dueDate: dueDate, members: members) }
    }
}
