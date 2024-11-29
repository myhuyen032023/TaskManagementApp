//
//  OngoingProjectCell.swift
//  TaskManagementApp
//
//  Created by Hoang Thi My Huyen on 6/11/24.
//

import SwiftUI

struct OngoingProjectCell: View {
    let project: Project
    var body: some View {
        VStack(alignment: .leading, spacing: 7) {
            Text(project.projectTitle)
                .font(.system(size: 21, weight: .medium, width: .expanded))
            
            Text("Team members count: \(project.members.count)")
                .font(.system(size: 14))
            
            ZStack {
                Image(.ellipse1)
                Image(.ellipse2)
                    .offset(x: 13)
                Image(.ellipse3)
                    .offset(x: 13 * 2)
            }
            
            Text("Due on : \(project.dueDate.formatted(.dateTime.month().day()))")
                .font(.system(size: 14))
                .padding(.top, 5)
        }
        .padding(.horizontal, 10)
        .frame(maxWidth: .infinity, minHeight: 125, alignment: .leading)
        .background(.secondaryBackground)
        .foregroundStyle(.white)
        .overlay {
            Circle()
                .stroke(Color.background, lineWidth: 2)
                .overlay {
                    Circle()
                        .trim(from: 0, to: project.progress)
                        .stroke(lineWidth: 2)
                        .rotationEffect(.degrees(60))
                        .foregroundStyle(.myPrimary)
                }
                .frame(width: 59, height: 59)
                .overlay{
                    Text("\(Int(project.progress * 100))%")
                        .font(.system(size: 11).weight(.semibold))
                }
                .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                .offset(x: -16, y: 20)
        }
    }
}

#Preview {
    OngoingProjectCell(project: .init(projectTitle: "Mobile App Frameword", projectDetails: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled", dueDate: Date.now, members: User.Mock_Users))
        .preferredColorScheme(.dark)
}
