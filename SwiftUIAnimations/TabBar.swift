//
//  TabBar.swift
//  SwiftUIAnimations
//
//  Created by Mehul Jain on 25/09/24.
//

import SwiftUI
import RiveRuntime
struct TabBar: View {
    let icon = RiveViewModel(fileName: "icons", stateMachineName: "CHAT_Interactivity",artboardName: "CHAT")
    var body: some View {
        VStack {
            Spacer()
            HStack{
                content
            }
            .padding(12)
            .background(Color("Background 2").opacity(0.8))
            .background(.ultraThinMaterial)
            .mask(RoundedRectangle(cornerRadius: 25,style:.continuous))
            .shadow(color:Color("Background 2").opacity(0.45),radius:20,x:0,y:20)
            .overlay(
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .stroke(.linearGradient(Gradient(colors: [.white.opacity(0.5),.white.opacity((0))]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2)
         )
        }
    }
}
var content:some View{

        ForEach(items) { item in
            Button{
                try? item.icon.setInput("active", value: true)
                DispatchQueue.main.asyncAfter(deadline: .now()+1){
                    try? item.icon.setInput("active", value: false)
                }
            }label:{
                item.icon.view()
                    .frame(width:60,height:36)
            }
        }
        
    }

#Preview {
    TabBar()
}
struct TabItem:Identifiable{
    var id=UUID()
    var icon:RiveViewModel
}
var items=[
    TabItem(icon:RiveViewModel(fileName: "icons", stateMachineName: "CHAT_Interactivity",artboardName: "CHAT")),
    TabItem(icon:RiveViewModel(fileName: "icons", stateMachineName: "SEARCH_Interactivity",artboardName: "SEARCH")),
    TabItem(icon:RiveViewModel(fileName: "icons", stateMachineName: "TIMER_Interactivity",artboardName: "TIMER")),
    TabItem(icon:RiveViewModel(fileName: "icons", stateMachineName: "BELL_Interactivity",artboardName: "BELL")),
    TabItem(icon:RiveViewModel(fileName: "icons", stateMachineName: "USER_Interactivity",artboardName: "USER")),
]

