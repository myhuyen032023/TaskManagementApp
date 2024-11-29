//
//  HomeViewModel.swift
//  TaskManagementApp
//
//  Created by Hoang Thi My Huyen on 12/11/24.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    @Published var projects: [Project] = [] {
        didSet {
            for i in 0..<projects.count {
                let project = projects[i]
                if projects[i].progress == 100 {
                    completedProjects.append(project)
                } else {
                    ongoingProjects.append(project)
                }
            }
        }
    }
    @Published var completedProjects: [Project] = []
    @Published var ongoingProjects: [Project] = []
    @Published var isLoading = false
    @Published var progress = 0.0
    init() {
        getProjects()
        print("projects: \(projects)")
    }
    
    func getProjects() {
        isLoading = true
        Task {
            projects = try await ProjectService.shared.getAllProjects()
            isLoading = false
        }
    }
    
    
}
