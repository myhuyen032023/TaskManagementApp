//
//  SpashView.swift
//  TaskManagementApp
//
//  Created by Hoang Thi My Huyen on 5/11/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Image(.icon)
                    
                    Spacer()
                }
                .padding(.top)
                
                Image(.pana)
                    .frame(width: 369, height: 330)
                    .background(.white)
                    .padding(.top, 20)
                
                Spacer()
                
                VStack {
                    Text("Manage your Task with ")
                        .font(.system(size: 50, weight: .semibold, width: .expanded)) +
                    
                    Text("DayTask")
                        .font(.system(size: 52, weight: .semibold, width: .expanded))
                        .foregroundStyle(.myPrimary)
                }
                .frame(width: 376, height: 240)
                .padding(.top, -20)
                .padding(.bottom, 20)
                
                NavigationLink {
                    SignInView()
                } label: {
                    Text("Let's Start")
                        .font(.system(size: 18).weight(.semibold))
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity, minHeight: 67)
                        .background(.myPrimary)
                    
                }
                Spacer()
            }
            .padding(.top, 32)
            .padding(.bottom)
            .padding(.horizontal)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    SplashView()
        .preferredColorScheme(.dark)
}
