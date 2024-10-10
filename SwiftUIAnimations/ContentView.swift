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
            Color("Background 2")
                .ignoresSafeArea()
            SideMenu()
                .opacity(isOpen ? 1:0)
                .offset(x:isOpen ? 0:-300)
                .rotation3DEffect(.degrees(isOpen ? 0:30), axis: (x:0, y:1, z:0))
            
            Group{
                switch selectedTab {
                case .chat:
                    HomeView()
                case .search:
                    Text("Search")
                case .timer:
                    Text("Timer")
                case .bell:
                    Text("Bell")
                case .user:
                    Text("User")
                }}
            
            .safeAreaInset(edge: .top){
                Color.clear.frame(height: 64)
            }
            .safeAreaInset(edge: .bottom){
                Color.clear.frame(height: 80)
            }
            .mask(RoundedRectangle(cornerRadius:30, style: .continuous))
            .rotation3DEffect(.degrees(isOpen ? 30:0), axis: (x: 0, y: -1, z: 0))
            .offset(x: isOpen ? 265 : 0)
            .scaleEffect(isOpen ? 0.9 : 1)
            .ignoresSafeArea()
            
                button.view()
                    .frame(width: 44, height: 44)
                    .mask(Circle())
                    .shadow(color: .black, radius: 5, x: 0, y: 5)
                    .frame( maxWidth: .infinity, maxHeight: .infinity,alignment: .topLeading)
                    .padding()
                    .offset(x: isOpen ? 216 : 0)
                    .onTapGesture {
                        button.setInput("isOpen", value: isOpen)
                        withAnimation(.spring(response:0.5, dampingFraction:0.7)) {
                            isOpen.toggle()
                        }
                    }
                TabBar()
                   .offset(x: isOpen ? 300 : 0)
            }
        }
        
    }

#Preview {
    ContentView(selectedTab: .chat)
}
