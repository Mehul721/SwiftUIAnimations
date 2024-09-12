//
//  CustomFont.swift
//  SwiftUIAnimations
//
//  Created by Mehul Jain on 12/09/24.
//

import SwiftUI

struct CustomFont: ViewModifier{
    var textStyle: TextStyle
    
    var name:String{
        switch textStyle {
        case .title:
            return "Poppins Bold"
        case .body:
            return "Inter Regular"
        }
    }
    
    var size:CGFloat{
        switch textStyle {
        case .title:
            return 28
        case .body:
            return 17
        }
    }
    
    func body(content: Content)-> some View{
        content.font(.custom("Inter Regular", size: 17,relativeTo: .body))
    }
}
extension View{
    func customFont(_ textStyle:TextStyle)-> some View{
        modifier(CustomFont(textStyle:textStyle))
    }
}
enum TextStyle{
    case title
    case body
}
