//
//  AppViewModel.swift
//  TaskManagementApp
//
//  Created by Hoang Thi My Huyen on 10/11/24.
//

import Foundation
import FirebaseAuth
import Combine


class AppViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubsribers()
    }
    
    func setupSubsribers() {
        AuthService.shared.$userSession.sink { user in
            self.userSession = user
        }.store(in: &cancellables)
    }
}
