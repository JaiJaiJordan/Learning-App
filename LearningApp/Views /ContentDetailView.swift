//
//  ContentDetailView.swift
//  LearningApp
//
//  Created by Jai Jordan on 2/6/21.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        
        VStack {
            if url != nil {
                   VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
                
                CodeTextView()
                
                if model.hasNextLesson() {
                    Button {
                        model.nextLesson()
                    } label: {
                        
                        ZStack {
                            
                            Rectangle()
                                .frame(height:48)
                                .foregroundColor(Color.green)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                            
                            Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                                .foregroundColor(Color.white)
                                .bold()
                        }
                        
                    }
                }
            }
            
            

            
        }
        .padding()
        .navigationBarTitle(lesson?.title ?? "")
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
