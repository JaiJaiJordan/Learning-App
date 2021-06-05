//
//  HomeViewRow.swift
//  LearningApp
//
//  Created by Jai Jordan on 30/5/21.
//

import SwiftUI

struct HomeViewRow: View {
    
    var image: String
    var title: String
    var description: String
    var count: String
    var time: String
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
            
            HStack {
                
                Image(image)
                    .resizable()
                    .frame(width: 116, height: 116)
                    .clipShape(Circle())
                
                Spacer()
                
                VStack (alignment: .leading, spacing: 10) {
                    
                    Text(title)
                        .bold()
                    
                    Text(description)
                        .padding(.bottom, 20)
                        .font(Font.system(size: 8))
                    
                    HStack {
                        
                        Image(systemName: "text.book.closed")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(count)
                            .font(Font.system(size: 8))
                        
                        Spacer()
                        
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(time)
                            .font(Font.system(size: 8))
                        
                    }
                    
                }
                .padding(.leading, 20)
                
            }
            .padding(.horizontal, 20)
        }
        .padding()
        
    }
}

struct HomeViewRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewRow(image: "swift", title: "Learn Swift", description: "some decription", count: "2 lessons", time: "3 hours")
    }
}