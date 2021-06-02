//
//  ContentView.swift
//  LearningApp
//
//  Created by Jai Jordan on 1/6/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        ScrollView {
            
            LazyVStack {
                
                //Confirm that currentModule is set
                
                if model.currentModule != nil {
                    
                    ForEach(model.currentModule!.content.lessons) { lesson in
                        
                        ZStack {
                            
                            Rectangle()
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .frame(height: 66)
                            
                            HStack {
                                
                                Text("1")
                                
                                VStack {
                                    
                                    Text("Variables and Constants")
                                        .bold()
                                    Text("17 minutes")
                                    
                                }
                                
                            }
                        }
                    }
                }
                
            }
        }
    }
}

