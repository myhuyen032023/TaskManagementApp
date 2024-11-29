//
//  NewMessageView.swift
//  TaskManagementApp
//
//  Created by Hoang Thi My Huyen on 8/11/24.
//

import SwiftUI

struct NewMessageView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                ScrollView {
                    HStack {
                        Image(.profile2User)
                            .frame(width: 47, height: 47)
                            .background(Color.myPrimary, in: Circle())
                        
                        Text("Create a group")
                            .font(.system(size: 14).weight(.semibold))
                        
                        Spacer()
                    }
                    .padding(.bottom, 29)
                    
                    VStack(spacing: 23) {
                        ForEach(0..<10) { _ in
                            HStack {
                                Image(.ellipse47)
                                    .resizable()
                                    .frame(width: 47, height: 47)
                                    .background(Color.myPrimary, in: Circle())
                                
                                Text("Create a group")
                                    .font(.system(size: 14).weight(.semibold))
                                
                                Spacer()
                            }
                        }
                    }
                    
                }
            }
            .padding(.leading, 27)
            .padding(.top, 39)
        }
        .navigationTitle("New Message")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(.arrowleft)
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Image(.searchnormal1)
            }
        }
    }
}

#Preview {
    NavigationStack {
        NewMessageView()
            .preferredColorScheme(.dark)
    }
}
