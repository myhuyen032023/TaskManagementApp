//
//  SignUpViewModel.swift
//  TaskManagementApp
//
//  Created by Hoang Thi My Huyen on 10/11/24.
//

import Foundation

class SignUpViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    
    func createUser() {
        Task { try await AuthService.shared.createUser(email: email, password: password, fullname: fullname) }
        
    }
}
