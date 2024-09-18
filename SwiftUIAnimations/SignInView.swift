//
//  SignInView.swift
//  SwiftUIAnimations
//
//  Created by Mehul Jain on 14/09/24.
//

import SwiftUI

struct SignInView: View {
    @State var email=""
    @State var password=""
    var body: some View {
        VStack(spacing:24) {
            Text("Sign In")
                .customFont(.largeTitle)
            Text("Access to 240+ hrs of content.")
                .customFont(.headline)
            
            
            VStack(alignment: .leading) {
                Text("Email")
                    .customFont(.subheadline)
                    .foregroundColor(.secondary)
                
                TextField("", text: $email)
                    .customTextField()
                    }
            VStack(alignment: .leading) {
                Text("Password")
                    .customFont(.subheadline)
                    .foregroundColor(.secondary)
                
                SecureField("", text: $password)
                .customTextField(image:Image("Icon Lock"))}
        
            Label("Sign In",systemImage: "arrow.right")
                .padding(20)
                .frame(maxWidth: .infinity)
                .background(.pink)
                .foregroundStyle(Color.white)
                .cornerRadius(20,corners:[.topRight,.bottomLeft,.bottomRight])
                .cornerRadius(8, corners: .topLeft)
            HStack {
                Rectangle().frame(height:1).opacity(0.1)
                
                Text("OR").customFont(.subheadline2)
                    .foregroundStyle(Color.black.opacity(0.3))
                Rectangle().frame(height:1).opacity(0.1)
            }
            
            Text("Sign-up with E-mail,Apple or Google")
                .customFont(.subheadline)
            HStack{
                Image("Logo Email")
                Spacer()
                Image("Logo Apple")
                Spacer()
                Image("Logo Google")
                
            }
        }
        .padding(30)
        .background(.regularMaterial)//blur background
        .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))//the region around signin area highlighted.
        .shadow(color:Color("Shadow").opacity(0.3),radius: 5,x:0,y:4)
        .shadow(color:Color("Shadow").opacity(0.3),radius: 30,x:0,y:30)
        .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous)
            .stroke(.linearGradient(colors:[.white.opacity(0.8),.white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing)))
        .padding()
    }
}

#Preview {
    SignInView()
}
