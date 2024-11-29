//
//  SignInViewModel.swift
//  TaskManagementApp
//
//  Created by Hoang Thi My Huyen on 10/11/24.
//

import Foundation

class SignInViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func login() {
        Task { try await AuthService.shared.login(email: email, password: password) }
    }
}
