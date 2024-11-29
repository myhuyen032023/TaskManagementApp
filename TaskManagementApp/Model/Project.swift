//
//  Project.swift
//  TaskManagementApp
//
//  Created by Hoang Thi My Huyen on 11/11/24.
//

import Foundation
import FirebaseFirestore

struct Project: Codable, Identifiable {
    @DocumentID var projectId: String?
    let projectTitle: String
    let projectDetails: String
    let dueDate: Date
    
    var members: [User] = []
    var tasks: [ProjectTask] = []
    var progress: Double {
        if tasks.isEmpty {
            return 0
        } else {
            var doneTasks = 0
            for i in 0..<tasks.count {
                if tasks[i].isDone {
                    doneTasks += 1
                }
            }
            return Double(doneTasks)/Double(tasks.count)
        }
    }
    
    var id: String {
        projectId ?? UUID().uuidString
    }
}
