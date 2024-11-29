//
//  ProfileViewModel.swift
//  TaskManagementApp
//
//  Created by Hoang Thi My Huyen on 10/11/24.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var fullname = ""
    @Published var email = ""
    @Published var password = ""
    
    var user: User?
    
    init() {
        user = UserService.shared.currentUser
        fullname = user?.fullname ?? ""
        email = user?.email ?? ""
    }
    
    func logout() {
        Task { try await AuthService.shared.logout() }
    }
}
