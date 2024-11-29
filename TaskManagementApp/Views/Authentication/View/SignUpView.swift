//
//  SignUpView.swift
//  TaskManagementApp
//
//  Created by Hoang Thi My Huyen on 5/11/24.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel = SignUpViewModel()
    @State private var checked = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 0) {
            Image(.icon)
                .resizable()
                .frame(width: 139, height: 92)
            
            Text("Create your account!")
                .font(.system(size: 26).weight(.semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 23)
                .padding(.top)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Full Name")
                    .font(.system(size: 18))
                    .foregroundStyle(Color.secondaryText)
                
                HStack {
                    Image(.user)
                    TextField("Your fullname", text: $viewModel.fullname)
                        .foregroundStyle(.white)
                }
                .padding(.leading, 18)
                .frame(maxWidth: .infinity, minHeight: 48)
                .background(.secondaryBackground)
            }
            
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
            .padding(.top, 20)
            
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
                
                
                
                HStack(alignment: .top) {
                    Image(systemName: checked ? "checkmark.square.fill" : "square")
                        .foregroundColor(.myPrimary)
                        .onTapGesture {
                            self.checked.toggle()
                        }
                    
                    Text("I have read & agreed to DayTask ")
                        .font(.system(size: 14))
                    
                    +
                    
                    Text("Privacy Policy,\nTerms & Condition")
                        .font(.system(size: 14))
                        .foregroundStyle(.myPrimary)
                }
                .frame(height: 38)
            }
            .padding(.top, 20)
            
            Button {
                // MARK: Create User
                viewModel.createUser()
                
            } label: {
                Text("Sign Up")
                    .font(.system(size: 18).weight(.semibold))
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity, minHeight: 57)
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
            
            Button {
                dismiss()
            } label: {
                Text("Already have an account?")
                    .foregroundStyle(.secondaryText)
                
                +
                
                Text(" Log In")
                    .fontWeight(.semibold)
                    .foregroundStyle(.myPrimary)
            }
        }
        .ignoresSafeArea(edges: .top)
        .padding(.horizontal, 26)
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(.top)
        .navigationBarBackButtonHidden()
        .background(Color.background)
    }
}



#Preview {
    SignUpView()
        .preferredColorScheme(.dark)
}
