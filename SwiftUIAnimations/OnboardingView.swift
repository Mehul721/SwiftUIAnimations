//
//  OnboardingView.swift
//  SwiftUIAnimations
//
//  Created by Mehul Jain on 08/09/24.
//

import SwiftUI
import RiveRuntime

struct OnboardingView: View {
    let button = RiveViewModel(fileName: "button")
    
    var body: some View {
        ZStack {
            background
            VStack(alignment:.leading, spacing: 16) {
                Text("Learn design & code")
                    .font(.custom("Poppins Bold", size: 60, relativeTo: .largeTitle))
                    
                Text("Don't skip design.")
                    .customFont(.body)
                    .opacity(0.7)
                    .frame(maxWidth: .infinity,alignment: .leading)
                Spacer()
                
                button.view()
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
                        try? button.play(animationName: "active")
                    }
                Text("Purchase includes access.")
                    .customFont(.footnote)
                    .opacity(0.7)
            }
            .padding(40)
            .padding(.top,40)
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
#Preview {
    OnboardingView()
}
