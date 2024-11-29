//
//  ProjectDetailsViewModel.swift
//  TaskManagementApp
//
//  Created by Hoang Thi My Huyen on 13/11/24.
//

import Foundation

@MainActor
class ProjectDetailsViewModel: ObservableObject {
    @Published var tasks: [ProjectTask] = []
    @Published var taskTitle = ""
    @Published var taskDetails = ""
    @Published var members: [User] = []
    @Published var dueDate: Date = Date.now
    var project: Project
    
    init(project: Project) {
        self.project = project
        if let currentUser = UserService.shared.currentUser {
            members.append(currentUser)
        }
        
        getTasks()
    }
    
    func getTasks() {
        Task { tasks = try await ProjectService.shared.getAllTasks(for: project.id) }
    }
    
    func createTask() {
        Task {
            let task = ProjectTask(taskTitle: taskTitle, taskDetails: taskDetails, dueDate: dueDate, isDone: false, members: members)
            try await ProjectService.shared.createTask(withTaskObj: task, for: project.id)
            getTasks()
        }
    }
    
    func markTaskDone(taskId: String) {
        Task {
            try await ProjectService.shared.markTaskDone(withTaskId: taskId, fromProjectId: project.id)
            getTasks()
        }
    }
    
    
}
