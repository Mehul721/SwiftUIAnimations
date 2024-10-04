//
//  HomeView.swift
//  SwiftUIAnimations
//
//  Created by Mehul Jain on 04/10/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(alignment:.leading,spacing:0){
            Text("Courses")
                .customFont(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal,20)
            
            ScrollView(.horizontal,showsIndicators:false){
                HStack(spacing:20){
                    ForEach(courses){course in
                        VCard(course: course)
                        
                    }
                }
                .padding(20)
                .padding(.bottom,10)
            }
            Text("Recent")
                .customFont(.title3)
                .padding(.horizontal,20)
        }
    }
}

#Preview {
    HomeView()
}
