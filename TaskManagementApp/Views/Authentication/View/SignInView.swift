//
//  SignInView.swift
//  TaskManagementApp
//
//  Created by Hoang Thi My Huyen on 5/11/24.
//

import SwiftUI

struct SignInView: View {
    @StateObject var viewModel = SignInViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            Image(.icon)
                .resizable()
                .frame(width: 139, height: 92)
            
            Text("Welcome Back!")
                .font(.system(size: 26).weight(.semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 23)
                .padding(.top)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Email Address")
                    .font(.system(size: 18))
                    .foregroundStyle(Color.secondaryText)
                
                HStack {
                    Image(.usertag)
                    TextField("Your email address", text: $viewModel.email)
                        .foregroundStyle(.white)
                }
                .padding(.leading, 18)
                .frame(maxWidth: .infinity, minHeight: 48)
                .background(.secondaryBackground)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Password")
                    .font(.system(size: 18))
                    .foregroundStyle(Color.secondaryText)
                
                HStack {
                    Image(.lock1)
                    SecureField("password", text: $viewModel.password)
                        .foregroundStyle(.white)
                }
                .padding(.leading, 18)
                .frame(maxWidth: .infinity, minHeight: 48)
                .background(.secondaryBackground)
                .padding(.bottom, -10)
                
                Text("Forgot Password?")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .foregroundStyle(.secondaryText)
            }
            .padding(.top, 20)
            
            Button {
                // MARK: Login
                viewModel.login()
                
            } label: {
                Text("Log In")
                    .font(.system(size: 18).weight(.semibold))
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity, maxHeight: 57)
                    .background(.myPrimary)
            }
            .padding(.top, 30)
            
            HStack {
                Rectangle()
                    .fill(.secondaryText)
                    .frame(maxWidth: UIScreen.main.bounds.width / 4, maxHeight: 1)
                
                Text(" Or continue with")
                    .font(.callout.weight(.medium))
                    .foregroundStyle(.secondaryText)
                
                Rectangle()
                    .fill(.secondaryText)
                    .frame(maxWidth: UIScreen.main.bounds.width / 4, maxHeight: 1)
            }
            .padding(.vertical, 17)
            
            HStack(spacing: 12) {
                Image(.google)
                
                Text("Google")
            }
            .frame(maxWidth: .infinity, minHeight: 57)
            .overlay {
                Rectangle()
                    .stroke(lineWidth: 2)
            }
            .padding(.bottom, 25)
            
            NavigationLink {
                SignUpView()
            } label: {
                Text("Don't have an account?")
                    .foregroundStyle(.secondaryText)
                    
                +
                
                Text(" Sign Up")
                    .fontWeight(.semibold)
                    .foregroundStyle(.myPrimary)
            }

        }
        .padding(.horizontal, 26)
        .frame(maxHeight: .infinity, alignment: .top)
        .ignoresSafeArea(edges: .top)
        .padding(.top)
        .navigationBarBackButtonHidden()
        .background(Color.background)
    }
}

#Preview {
    SignInView()
        .preferredColorScheme(.dark)
}
