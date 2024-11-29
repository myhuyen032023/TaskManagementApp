//
//  AddTeamMemberViewModel.swift
//  TaskManagementApp
//
//  Created by Hoang Thi My Huyen on 11/11/24.
//

import Foundation

class AddTeamMemberViewModel: ObservableObject {
    @Published var users: [User] = []
    
    init() {
        getUsers()
    }
    
    func getUsers() {
        Task { users = try await UserService.shared.getUsers() }
    }
}
