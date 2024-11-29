//
//  TaskManagementAppApp.swift
//  TaskManagementApp
//
//  Created by Hoang Thi My Huyen on 5/11/24.
//

import SwiftUI
import FirebaseCore
import SwiftData


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct TaskManagementApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var viewModel = AppViewModel()
    
    var body: some Scene {
        WindowGroup {
            if viewModel.userSession == nil {
                SplashView()
            } else {
                TabBar()
                    .modelContainer(for: TodoTask.self)
            }
        }
        
    }
}
