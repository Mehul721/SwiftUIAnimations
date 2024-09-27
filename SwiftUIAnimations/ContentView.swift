//
//  ContentView.swift
//  SwiftUIAnimations
//
//  Created by Mehul Jain on 08/09/24.
//
import SwiftUI
import RiveRuntime

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .chat
    @State var isOpen = false
    let button=RiveViewModel(fileName: "menu_button",animationName: "open",autoPlay: false)
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
            button.view()
                .frame(width: 44, height: 44)
                .mask(Circle())
                .shadow(color: .black, radius: 5, x: 0, y: 5)
                .frame( maxWidth: .infinity, maxHeight: .infinity,alignment: .topLeading)
                .padding(12)
                .onTapGesture {
                    try? button.setInput("isOpen", value: isOpen)
                    isOpen.toggle()
                }
            TabBar()
        }
        
    }
}

#Preview {
    ContentView()
}
