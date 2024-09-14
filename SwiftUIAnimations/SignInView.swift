//
//  SignInView.swift
//  SwiftUIAnimations
//
//  Created by Mehul Jain on 14/09/24.
//

import SwiftUI

struct SignInView: View {
    var body: some View {
        VStack(spacing:24) {
            Text("Sign In")
                .customFont(.largeTitle)
            Text("Access to 240+ hrs of content.")
                .customFont(.headline)
            Divider()
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
        .padding()
    }
}

#Preview {
    SignInView()
}
