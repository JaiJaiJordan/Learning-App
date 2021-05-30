//
//  ContentView.swift
//  LearningApp
//
//  Created by Jai Jordan on 29/5/21.
//

import SwiftUI

struct HomeView: View {
    
   @EnvironmentObject var model: ContentModel 
    
    var body: some View {
        
        ScrollView {
            
            LazyVStack {
                
                ForEach(model.modules) { module in
                    
                    ZStack {
                        
                        Rectangle()
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
                        
                        HStack {
                            
                            Image("swift")
                                .resizable()
                                .frame(width: 116, height: 116)
                                .clipShape(Circle())
                            
                            Spacer()
                            
                            VStack (alignment: .leading, spacing: 10) {
                                
                                Text("Learn Swift")
                                    .bold()
                                
                                Text("some description")
                                    .padding(.bottom, 20)
                                
                                HStack {
                                    
                                    Image(systemName: "text.book.closed")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                    Text("20 lessons")
                                        .font(.caption)
                                    Image(systemName: "clock")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                    Text("2 hours")
                                        .font(.caption)
                                    
                                    
                                }
                                
                            }
                            
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding()
                }
            }
        }
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
