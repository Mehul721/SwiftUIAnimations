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
        ZStack{
            switch selectedTab {
            case .chat:
                Text("Chat")
            case .search:
                Text("Search")
            case .timer:
                Text("Timer")
            case .bell:
                Text("Bell")
            case .user:
                Text("User")
            }
            TabBar()
        }
        
    }
}

#Preview {
    ContentView()
}
