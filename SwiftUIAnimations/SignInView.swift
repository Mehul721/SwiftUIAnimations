//
//  SignInView.swift
//  SwiftUIAnimations
//
//  Created by Mehul Jain on 14/09/24.
//

import SwiftUI
import RiveRuntime

struct SignInView: View {
    @State var email=""
    @State var password=""
    @State var isLoading=false
    @Binding var showModel:Bool
    let check=RiveViewModel(fileName: "check",stateMachineName: "State Machine 1")
    let confetti=RiveViewModel(fileName: "confetti",stateMachineName: "State Machine 1")
    
    func LogIn() {
        isLoading=true
        if email != ""{
            DispatchQueue.main.asyncAfter(deadline: .now()+1){
                try? check.triggerInput("Check")
            }
            DispatchQueue.main.asyncAfter(deadline: .now()+3){
                isLoading=false
                try? confetti.triggerInput("Trigger explosion")
            }
            DispatchQueue.main.asyncAfter(deadline: .now()+4){
                withAnimation{
                    showModel=false
                }
            }
        }else{
            DispatchQueue.main.asyncAfter(deadline: .now()+1){
                try? check.triggerInput("Error")
            }
            DispatchQueue.main.asyncAfter(deadline: .now()+3){
                isLoading=false
            }
        }
    }
            var body: some View {
                ZStack {
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
                        
                        Button {
                            LogIn()
                        }label:{
                            Label("Sign In",systemImage: "arrow.right")
                                .customFont(.headline)
                                .padding(20)
                                .frame(maxWidth: .infinity)
                                .background(Color(hex: "F77D8E"))
                                .foregroundStyle(Color.white)
                                .cornerRadius(20,corners:[.topRight,.bottomLeft,.bottomRight])
                                .cornerRadius(8, corners: .topLeft)
                                .shadow(color: Color(hex:"F77D8E").opacity(0.5), radius: 20, x: 0, y: 10)
                        }
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
                    .padding(40)
                    .background(.regularMaterial)
                    .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .shadow(color:Color("Shadow").opacity(0.2),radius: 5,x:0,y:4)
                    .shadow(color:Color("Shadow").opacity(0.3),radius: 30,x:0,y:30)
                    .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(.linearGradient(colors:[.white.opacity(0.8),.white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing)))
                    .padding()
                    .overlay(
                        ZStack{
                            if isLoading{
                                check.view()
                                    .frame(width: 100, height: 100)
                                    .allowsHitTesting(false)
                                    .onTapGesture {
                                        print("Check view tapped!")
                                    }
                            }
                            confetti.view()
                                .scaleEffect(3)
                                .allowsHitTesting(false)
                        }
                        
                    )
                }
            }
        }
    
        #Preview {
            SignInView(showModel: .constant(true))
        }
    
