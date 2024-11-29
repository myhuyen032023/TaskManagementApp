//
//  User.swift
//  TaskManagementApp
//
//  Created by Hoang Thi My Huyen on 10/11/24.
//

import Foundation
import FirebaseFirestore

struct User: Codable, Identifiable {
    //Lam cach nay thi se lay document id de lam id cho user luon
    @DocumentID var userId: String?
    var email: String
    var fullname: String
    
    
    var id: String {
        userId ?? UUID().uuidString
    }
}

extension User {
    static let Mock_Users: [User] = [
        .init(email: "test2@gmail.com", fullname: "test2"),
        .init(email: "test1@gmail.com", fullname: "test1"),
        .init(email: "test3@gmail.com", fullname: "test3"),
        .init(email: "test4@gmail.com", fullname: "test4"),
        .init(email: "test5@gmail.com", fullname: "test5"),
    ]
}
