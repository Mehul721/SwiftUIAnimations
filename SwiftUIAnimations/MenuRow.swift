//
//  MenuRow.swift
//  SwiftUIAnimations
//
//  Created by Mehul Jain on 09/10/24.
//

import SwiftUI

struct MenuRow: View {
    var item: MenuItems
    @Binding var selectedMenu: SelectedMenu
    
    var body: some View {
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
        .background(
            RoundedRectangle(cornerRadius:10,style: .continuous)
                .fill(.blue)
                .frame(maxWidth:selectedMenu == item.menu ? .infinity : 0)
                .frame(maxWidth:.infinity,alignment:.leading)
        )
        .background(Color(hex: "17203A"))
        .onTapGesture {
            try? item.icon.setInput("active", value: true)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                try? item.icon.setInput("active", value: false)
            }
            withAnimation{
                selectedMenu = item.menu
            }
        }
    }
}

#Preview {
    MenuRow(item:menuItems[0],selectedMenu: .constant(.home))
}
