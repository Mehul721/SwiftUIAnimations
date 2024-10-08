//
//  SideMenu.swift
//  SwiftUIAnimations
//
//  Created by Mehul Jain on 06/10/24.
//

import SwiftUI
import RiveRuntime

struct SideMenu: View {
    let icon=RiveViewModel(fileName: "icons", stateMachineName: "HOME_interactivity",artboardName: "HOME")
    var body: some View {
        
        VStack {
            HStack {
                Image(systemName:"person")
                    .padding(12)
                    .background(.white.opacity(0.2))
                    .mask(Circle())
                VStack(alignment:.leading,spacing: 2) {
                    Text("Mehul Jain")
                        .customFont(.body)
                    Text("Mobile Developer")
                        .customFont(.subheadline)
                        .opacity(0.6)
                    
                }
                
                Spacer()
                
            }
            .padding()
            
            Text("BROWSE")
                .customFont(.subheadline2)
                .frame(maxWidth:.infinity,alignment: .leading)
                .padding(.horizontal,24)
                .padding(.top,40)
                .opacity(0.7)
            
            
            VStack(alignment: .leading, spacing: 0){
                ForEach(menuItems) { item in
                    Rectangle()
                        .frame(height:1)
                        .opacity(0.1)
                        .padding(.horizontal)
                    HStack(spacing:14){
                        item.icon.view()
                            .frame(width:32,height:32)
                            .opacity(0.6)
                            .foregroundStyle(Color.white)
                        Text(item.text)
                            .customFont(.subheadline2)
                    }
                    .frame(maxWidth:.infinity,alignment:.leading)
                    .padding(8)
                    .onTapGesture {
                        try? item.icon.setInput("active", value: true)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            try? item.icon.setInput("active", value: false)
                        }
                    }
                }
        }
            .padding(8)
            Spacer()
        }
        .foregroundStyle(Color.white)
        .frame(maxWidth: 288, maxHeight: .infinity)
        .background(Color(hex: "17203A"))
        .mask(RoundedRectangle(cornerRadius: 30,style:.continuous))
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
#Preview {
    SideMenu()
}

struct MenuItems:Identifiable {
    var id:UUID = UUID()
    var text:String
    var icon:RiveViewModel
}
var menuItems:[MenuItems] = [
    MenuItems(text:"Home",icon:RiveViewModel(fileName:"icons",artboardName:"HOME")),
    MenuItems(text:"Search",icon:RiveViewModel(fileName:"icons",artboardName:"SEARCH")),
    MenuItems(text:"Favorites",icon:RiveViewModel(fileName:"icons",artboardName:"LIKE/STAR")),
    MenuItems(text:"Help",icon:RiveViewModel(fileName:"icons",artboardName:"CHAT"))
    ]
