//
//  TestResultView.swift
//  LearningApp
//
//  Created by Jai Jordan on 5/6/21.
//

import SwiftUI

struct TestResultView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var numCorrect: Int
    
    var resultHeading: String {
        guard model.currentModule != nil else {
            return ""
        }
        let pct = Double(numCorrect)/Double(model.currentModule!.test.questions.count)
        
        if pct > 0.5 {
            return "Awesome!"
        }
        else if pct > 0.2 {
            return "Doing great!"
        }
        else {
            return "Keep learning."
        }
    }
    
    var body: some View {
        
        VStack {
            Spacer()
            Text(resultHeading)
                .font(.title)
            Spacer()
            Text("You got \(numCorrect) out of \(model.currentModule?.test.questions.count ?? 0) questions")
            Spacer()
            Button {
                //Send user back to home view
                model.currentTestSelected = nil
                
            } label: {
                
                ZStack {
                    RectangleCard(color: Color.green)
                        .frame(height: 48)
                    
                    Text("Complete")
                        .bold()
                        .foregroundColor(.white)
                    
                }
            }
            .padding()
            Spacer()
        }
    }
}

