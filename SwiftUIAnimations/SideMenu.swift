//
//  SideMenu.swift
//  SwiftUIAnimations
//
//  Created by Mehul Jain on 06/10/24.
//

import SwiftUI
import RiveRuntime

struct SideMenu: View {
    
    @State var selectedMenu:SelectedMenu = .home
    @State var isDarkMode:Bool = false
    
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
                    MenuRow(item: item, selectedMenu: $selectedMenu)
                }
        }
            .padding(8)
            Text("HISTORY")
                .customFont(.subheadline2)
                .frame(maxWidth:.infinity,alignment: .leading)
                .padding(.horizontal,24)
                .padding(.top,40)
                .opacity(0.7)
            
            VStack(alignment: .leading, spacing: 0){
                ForEach(menuItems2) { item in
                    Rectangle()
                        .frame(height:1)
                        .opacity(0.1)
                        .padding(.horizontal)
                    MenuRow(item: item, selectedMenu: $selectedMenu)
                }
        }
            .padding(8)
            
            HStack(spacing:14) {
                menuItems3[0].icon.view()
                    .frame(width:32,height:32)
                    .opacity(0.6)
                    .onChange(of: isDarkMode) {
                        newValue in
                        if newValue {
                            try? menuItems3[0].icon.setInput("active",value:true)
                        }else{
                            try? menuItems3[0].icon.setInput("active",value:false)
                        }
                    }
                Text(menuItems3[0].text)
                    .customFont(.headline)
                Toggle("",isOn: $isDarkMode)
                    .padding(.trailing,30)
            }
            .padding()
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
    var menu:SelectedMenu
}
var menuItems:[MenuItems] = [
    MenuItems(text:"Home",icon:RiveViewModel(fileName:"icons",artboardName:"HOME"),menu:.home),
    MenuItems(text:"Search",icon:RiveViewModel(fileName:"icons",artboardName:"SEARCH"),menu:.search),
    MenuItems(text:"Favorites",icon:RiveViewModel(fileName:"icons",artboardName:"LIKE/STAR"),menu:.favorites),
    MenuItems(text:"Help",icon:RiveViewModel(fileName:"icons",artboardName:"CHAT"),menu:.help)
    ]
var menuItems2:[MenuItems] = [
    MenuItems(text:"History",icon:RiveViewModel(fileName:"icons",artboardName:"TIMER"),menu:.history),
    MenuItems(text:"Notifications",icon:RiveViewModel(fileName:"icons",artboardName:"BELL"),menu:.notifications),
    ]
var menuItems3:[MenuItems] = [
    MenuItems(text:"Dark Mode",icon:RiveViewModel(fileName:"icons",artboardName:"SETTINGS"),menu:.darkMode),
    ]
enum SelectedMenu:String{
    case home
    case search
    case favorites
    case help
    case history
    case notifications
    case darkMode
}
