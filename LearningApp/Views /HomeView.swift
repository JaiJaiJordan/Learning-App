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
        
        NavigationView {
            
            VStack(alignment: .leading) {
                Text("What do you want to do today?")
                    .padding(.leading, 20)
                
                ScrollView {
                    
                    LazyVStack (spacing: 0) {
                        
                        ForEach(model.modules) { module in
                             
                            NavigationLink(
                                destination:
                                    ContentView()
                                    .onAppear(perform: {
                                        model.beginModule(moduleid: module.id)
                                    }),
                                tag: module.id,
                                selection: $model.currentContentSelected,
                                label: {
                                    HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) Lessons", time: module.content.time)
                                })
                           
                            NavigationLink (destination: EmptyView()) {
                                EmptyView()
                             }
                            
                            NavigationLink(
                                destination:
                                    TestView()
                                    .onAppear(perform: {
                                        model.beginTest(moduleId: module.id)
                                    }),
                                tag: module.id,
                                selection: $model.currentTestSelected,
                                label: {
                                    HomeViewRow(image: module.test.image, title: "\(module.category) Test", description: module.test.description, count: "\(module.test.questions.count) Lessons", time: module.test.time)
                                    
                                })
                            
                            
                            
                        }
                    }
                    .accentColor(.black)
                    
                }
                
            }
            .navigationBarTitle("Get Started")
            .onChange(of: model.currentContentSelected) { changedValue in
                model.currentModule = nil 
            }
            
        }
        .onChange(of: model.currentTestSelected) { changedValue in
            if changedValue == nil {
                model.currentModule = nil 
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
