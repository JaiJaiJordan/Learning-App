//
//  TestView.swift
//  LearningApp
//
//  Created by Jai Jordan on 5/6/21.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model:ContentModel
    @State var selectedAnswerIndex:Int?
    @State var numCorrect = 0
    @State var submitted = false
    
    var body: some View {
        
        if model.currentQuestion != nil {
            
            VStack (alignment: .leading) {
                
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                    .padding(.leading, 20)
                
                CodeTextView()
                    .padding(.horizontal, 20)
                
                ScrollView {
                    
                    VStack {
                        
                        ForEach(0..<model.currentQuestion!.answers.count, id: \.self) { index in
                            
                            Button(action: {
                                selectedAnswerIndex = index
                                
                            }, label: {
                                ZStack {
                                    if submitted == false {
                                    RectangleCard(color: index == selectedAnswerIndex ? .gray : .white)
                                        .frame(height: 48)
                                    }
                                    else {
                                        //Answer has been submitted
                                        if index == selectedAnswerIndex &&
                                            index == model.currentQuestion!.correctIndex {
                                            
                                            //Show a green backdrop - for correct answer
                                            RectangleCard(color: Color.green)
                                                .frame(height: 48)
                                        }
                                        else if index == selectedAnswerIndex &&
                                                 index != model.currentQuestion!.correctIndex {
                                            //Show a red backdrop - for incorrect answer
                                            RectangleCard(color: Color.red)
                                                .frame(height: 48)
                                        }
                                        else if index == model.currentQuestion!.correctIndex {
                                            RectangleCard(color: Color.green)
                                                .frame(height: 48)
                                        }
                                        else {
                                            RectangleCard(color: Color.white)
                                                .frame(height: 48)
                                        }
                                    }
                                    Text(model.currentQuestion!.answers[index])
                                }
                                
                            })
                            .disabled(submitted)
                            
                            
                        }
                    }
                    .accentColor(.black)
                    .padding()
                }
                
                Button(action: {
                    
                    //Change submitted state to true
                    submitted = true
                    
                    //Check the answer and increment the counter if correct
                    if selectedAnswerIndex == model.currentQuestion!.correctIndex {
                        numCorrect += 1
                    }
                    
                }, label: {
                    
                    ZStack {
                        
                        RectangleCard(color: .green)
                            .frame(height: 48)
                        
                        Text("Submit")
                            .bold()
                            .foregroundColor(.white)
                            
                    }.padding()
                })
                .disabled(selectedAnswerIndex == nil )
            }
            .navigationBarTitle("\(model.currentModule?.category ?? "") Test")
        }
        else {
            ProgressView()
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
