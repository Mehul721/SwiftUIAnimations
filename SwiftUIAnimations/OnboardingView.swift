//
//  OnboardingView.swift
//  SwiftUIAnimations
//
//  Created by Mehul Jain on 08/09/24.
//

import SwiftUI
import RiveRuntime

struct OnboardingView: View {
    let b1 = RiveViewModel(fileName: "button")
    @State var showModel = false

    var body: some View {
        ZStack {
            background
            content
                .offset(y:showModel ? -50:0)
            
            Color("Shadow")
                .opacity(showModel ? 0.4 : 0)
                .ignoresSafeArea()
            if showModel {
                SignInView()
                    .transition(.move(edge: .top).combined(with: .opacity))
                
                    .overlay(
                        Button{
                            withAnimation(.spring()){
                                showModel=false
                            }
                        }
                        label:{
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width:20,height:20)
                                .foregroundStyle(Color.black)
                                .padding(10)
                                .background(.white)
                                .mask(Circle())
                            .shadow(color:
                                Color("Shadow").opacity(0.3),
                                radius: 9,x:0,y:3)
                        }
                            .frame(maxHeight: .infinity, alignment: .bottom)
                    )
                    .zIndex(1)
            }
        }
    }

    var content: some View {
        VStack(spacing: 16) {
            Spacer()
            Text("Learn design & code")
                .font(.custom("Poppins Bold", size: 75, relativeTo: .largeTitle))

            Text("Don't skip design.")
                .customFont(.body)
                .opacity(0.7)
                .frame(maxWidth: .infinity)
            
            Spacer()

            b1.view()
                .frame(width: 236, height: 64)
                .overlay(
                    Label("Start the course", systemImage: "arrow.forward")
                        .offset(x: 4, y: 4)
                        .font(.headline)
                )
                .background(
                    Color.black
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .blur(radius: 10)
                        .opacity(0.3)
                        .offset(y: 10)
                )
                .onTapGesture {
                    b1.play(animationName: "active")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                        withAnimation(.easeInOut(duration: 0.4)) {
                            showModel = true
                        }
                    }
                }
                .padding(30)
                .padding(.top, 15)

            Text("Purchase includes access.")
                .customFont(.footnote)
                .frame(maxWidth: .infinity,alignment: .center)
                .opacity(0.7)
        }
        
    }

    var background: some View {
        RiveViewModel(fileName: "shapes").view()
            .ignoresSafeArea()
            .blur(radius: 30)
            .background(
                Image("Spline")
                    .blur(radius: 50)
                    .offset(x: 200, y: 100)
            )
    }
    
}
