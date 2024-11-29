//
//  NotificationView.swift
//  TaskManagementApp
//
//  Created by Hoang Thi My Huyen on 9/11/24.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack {
                        VStack(alignment: .leading, spacing: 16) {
                            Text("New")
                                .font(.system(size: 20).weight(.medium))
                            
                            VStack(spacing: 23) {
                                ForEach(0..<3) { _ in
                                    NotificationCell()
                                }
                            }
                            
                        }
                        .padding(.bottom, 36)
                        
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Earlier")
                                .font(.system(size: 20).weight(.medium))
                            
                            VStack(spacing: 23) {
                                ForEach(0..<3) { _ in
                                    NotificationCell()
                                }
                            }
                            
                        }
                    }
                    .padding(EdgeInsets(top: 31, leading: 20, bottom: 16, trailing: 17))
                }
            }
            .navigationTitle("Notifications")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(.arrowleft)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        NotificationView()
            .preferredColorScheme(.dark)
    }
}
