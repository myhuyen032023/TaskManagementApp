//
//  UserService.swift
//  TaskManagementApp
//
//  Created by Hoang Thi My Huyen on 10/11/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class UserService {
    @Published var currentUser: User?
    let userCollection = Firestore.firestore().collection("users")
    static let shared = UserService()
    
    //get user data from firestore
    func loadUserData() async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let snapshot = userCollection.document(currentUid)
        guard let user = try? await snapshot.getDocument(as: User.self) else { return }
        self.currentUser = user
    }
    
    //get all users
    func getUsers() async throws -> [User] {
        try await userCollection.getDocuments().documents.compactMap({ try? $0.data(as: User.self)})
    }
    
    //get user with id
    func getUser(withUserId uid: String) async throws -> User {
        try await userCollection.document(uid).getDocument(as: User.self)
    }
}
