//
//  AuthService.swift
//  TaskManagementApp
//
//  Created by Hoang Thi My Huyen on 10/11/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthService {
    @Published var userSession: FirebaseAuth.User?
    static let shared = AuthService()
    let userCollection = Firestore.firestore().collection("users")
    
    init() {
        userSession = Auth.auth().currentUser
        Task { try await UserService.shared.loadUserData() }
    }
    
    
    //create user in fireAuth
    @MainActor
    func createUser(email: String, password: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            userSession = result.user
            
            //upload user data
            try await uploadUserData(email: email, fullname: fullname, id: result.user.uid)
            Task { try await UserService.shared.loadUserData() }
        } catch {
            print("Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    //create user in firestore
    func uploadUserData(email: String, fullname: String, id: String) async throws {
        let snapshot = userCollection.document(id)
        let user = User(email: email, fullname: fullname)
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await snapshot.setData(userData)
    }
    
    //login
    @MainActor
    func login(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            userSession = result.user
            
            // get user data
            Task { try await UserService.shared.loadUserData() }
        } catch {
            print("Failed to login user with error \(error.localizedDescription)")
        }
    }
    
    
    
    //logout
    @MainActor
    func logout() throws {
        do {
            try Auth.auth().signOut()
            userSession = nil
        } catch {
            print("Failed to logout with error \(error.localizedDescription)")
        }
    }
}
