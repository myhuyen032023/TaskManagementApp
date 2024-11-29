//
//  Task.swift
//  TaskManagementApp
//
//  Created by Hoang Thi My Huyen on 13/11/24.
//

import Foundation
import FirebaseFirestore

struct ProjectTask: Codable, Identifiable {
    @DocumentID var taskId: String?
    let taskTitle: String
    let taskDetails: String
    let dueDate: Date
    var isDone: Bool
    
    var members: [User] = []
    
    var id: String {
        taskId ?? UUID().uuidString
    }
}
