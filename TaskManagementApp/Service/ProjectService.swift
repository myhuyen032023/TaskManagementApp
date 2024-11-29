//
//  ProjectService.swift
//  TaskManagementApp
//
//  Created by Hoang Thi My Huyen on 11/11/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProjectService {
    
    static let shared = ProjectService()
    
    let projectsCollection = Firestore.firestore().collection("projects")
    
    func createProject(projectTitle: String, projectDetails: String, dueDate: Date, members: [User]) async throws {
        // save project infor in project collection
        let project = Project(projectTitle: projectTitle, projectDetails: projectDetails, dueDate: dueDate)
        guard let projectData = try? Firestore.Encoder().encode(project) else { return }
        
        let projectRef = projectsCollection.document()
        try await projectRef.setData(projectData)
        
        // save team member in member collection (which is in project document)
        let memberRef = projectRef.collection("members")
        for i in 0..<members.count {
            let uid = members[i].id
            try await memberRef.document(uid).setData([:])
        }
    }
    
    func getProject(withProjectId pid: String) async throws -> Project {
        var project = try await  projectsCollection.document(pid).getDocument().data(as: Project.self)
        print("project: \(project)")
        
        //get project members
        let snapshot = try await projectsCollection.document(pid).collection("members").getDocuments()
        let memberIds = snapshot.documents.map({ $0.documentID} )
        for i in 0..<memberIds.count {
            let uid = memberIds[i]
            let member = try await UserService.shared.getUser(withUserId: uid)
            project.members.append(member)
        }
        
        //get project tasks
        let tasks = try await getAllTasks(for: pid)
        project.tasks.append(contentsOf: tasks)
        
        return project
    }
    
    func getAllProjects() async throws -> [Project] {
        var projects: [Project] = []
        let projectIds = try await projectsCollection.getDocuments().documents.map({ $0.documentID })
        
        for i in 0..<projectIds.count {
            let pid = projectIds[i]
            let project = try await getProject(withProjectId: pid)
            projects.append(project)
        }
        print("projects: \(projects)")
        return projects
        
//        try await projectsCollection.getDocuments().documents.compactMap({ try? $0.data(as: Project.self)})
    }
    
    // MARK: - Task Services
    func createTask(withTaskObj taskObj: ProjectTask, for projectId: String) async throws {
        let task = ProjectTask(taskTitle: taskObj.taskTitle, taskDetails: taskObj.taskDetails, dueDate: taskObj.dueDate, isDone: taskObj.isDone)
        
        guard let taskData = try? Firestore.Encoder().encode(task) else { return }
        let taskRef = projectsCollection.document(projectId).collection("tasks").document()
        try await taskRef.setData(taskData)
        
        //save member for task
        let taskMemberRef = taskRef.collection("task-members")
        for i in 0..<taskObj.members.count {
            let uid = taskObj.members[i].id
            try await taskMemberRef.document(uid).setData([:])
        }
    }
    
    func getTask(withTaskId taskId: String, fromProjectId pid: String) async throws -> ProjectTask {
        let tasksCollection = projectsCollection.document(pid).collection("tasks")
        var task = try await tasksCollection.document(taskId).getDocument().data(as: ProjectTask.self)
        print("Task: \(task)")
        let snapshot = try await tasksCollection.document(taskId).collection("task-members").getDocuments()
        let memberIds = snapshot.documents.map({ $0.documentID })
        for i in 0..<memberIds.count {
            let uid = memberIds[i]
            let member = try await UserService.shared.getUser(withUserId: uid)
            task.members.append(member)
        }
        
        return task
    }

    func getAllTasks(for projectId: String) async throws -> [ProjectTask] {
        var tasks: [ProjectTask] = []
        let taksIds = try await projectsCollection.document(projectId).collection("tasks").getDocuments().documents.map({$0.documentID})
        
        var doneTasks = 0
        for i in 0..<taksIds.count {
            let tid = taksIds[i]
            let task = try await getTask(withTaskId: tid, fromProjectId: projectId)
            if task.isDone {
                doneTasks += 1
            }
            tasks.append(task)
        }
        
        return tasks
    }
    
    func markTaskDone(withTaskId tid: String, fromProjectId pid: String) async throws {
        let tasksCollection = projectsCollection.document(pid).collection("tasks")
        try await tasksCollection.document(tid).updateData([
            "isDone": true
        ])
    }
    
}
