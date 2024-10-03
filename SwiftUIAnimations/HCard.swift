//
//  HCard.swift
//  SwiftUIAnimations
//
//  Created by Mehul Jain on 03/10/24.
//

import SwiftUI

struct HCard: View {
    var section:CourseSection
    var body: some View {
        HStack(spacing:20){
            VStack(alignment: .leading,spacing:8){
                Text(section.title)
                    .customFont(.title2)
                    .frame(maxWidth: .infinity,alignment: .leading)
                Text(section.caption)
                    .customFont(.body)
            }
            Divider()
            section.image
        }
        .padding(30)
        .frame(maxWidth: .infinity, maxHeight: 110)
        .background(section.color)
        .foregroundStyle(Color.white)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        
        
        
    }
}
#Preview {
    HCard(section:courseSections[0])
}
