//
//  ContentView.swift
//  SwiftUIAnimations
//
//  Created by Mehul Jain on 08/09/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .chat
    var body: some View {
        OnboardingView()
    }
}

#Preview {
    OnboardingView()
}
