//
//  AddTeamMemberModal.swift
//  TaskManagementApp
//
//  Created by Hoang Thi My Huyen on 10/11/24.
//

import SwiftUI

struct AddTeamMemberModal: View {
    @State private var searchText = ""
    @Binding var teamMembers: [User]
    @Environment(\.dismiss) var dismiss
    
    @State var users: [User] = []
    
    var body: some View {
        VStack {
            Text("Add Team Memeber")
                .font(.headline)
                .padding(.bottom)
            
            HStack {
                Image(systemName: "magnifyingglass")
                
                TextField("Search team member by email", text: $searchText)
            }
            .padding(12)
            .background(Color.secondaryBackground)
            
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(users) { user in
                        HStack(spacing: 12) {
                            Image(.ellipse40)
                            
                            Text(user.fullname)
                                .font(.subheadline)
                            Spacer()
                            
                            Button {
                                // MARK: Add a member
                                if !teamMembers.contains(where: {$0.email == user.email}) {
                                    
                                    teamMembers.append(user)
                                }
                                dismiss()
                            } label: {
                                Image(systemName: "plus.square")
                                    .foregroundStyle(.myPrimary)
                            }
                        }
                        .frame(maxWidth: .infinity, minHeight: 50)
                    }
                }
            }
            .padding(.top)
        }
        .padding(20)
        .background(Color.background)
        .onAppear {
            Task { users = try await UserService.shared.getUsers() }
        }
    }
}

#Preview {
    AddTeamMemberModal(teamMembers: .constant([]))
        .preferredColorScheme(.dark)
}
