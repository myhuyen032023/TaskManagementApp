//
//  CompletedTaskCell.swift
//  TaskManagementApp
//
//  Created by Hoang Thi My Huyen on 6/11/24.
//

import SwiftUI


struct CompletedTaskCell: View {
    @State var isSelected = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Real Estate Website Design")
                .font(.system(size: 21, weight: .medium, width: .expanded))
                .frame(minHeight: 77)
                .multilineTextAlignment(.leading)
            
            
            HStack {
                Text("Team members")
                    .font(.system(size: 11))
                
                ZStack {
                    Image(.ellipse1)
                    Image(.ellipse2)
                        .offset(x: 13)
                    Image(.ellipse3)
                        .offset(x: 13 * 2)
                    Image(.ellipse4)
                        .offset(x: 13 * 3)
                    Image(.ellipse5)
                        .offset(x: 13 * 4)
                }
            }
            .padding(.top)
            
            VStack(alignment: .leading, spacing: 3) {
                HStack {
                    Text("Completed")
                        .font(.system(size: 11))
                    Spacer()
                    
                    Text("100%")
                        .font(.system(size: 9).weight(.semibold))
                }
                
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 163, height: 6)
            }
            .padding(.top, 12)
        }
        .padding(.horizontal, 10)
        .padding(.top)
        .padding(.bottom, 17)
        .frame(width: 183, height: 175)
    }
}

#Preview {
    CompletedTaskCell()
        .preferredColorScheme(.dark)
}
