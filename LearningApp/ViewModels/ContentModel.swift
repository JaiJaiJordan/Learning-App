//
//  ContentModel.swift
//  LearningApp
//
//  Created by Jai Jordan on 29/5/21.
//

import Foundation

class ContentModel: ObservableObject {
    
    //List of modules
    @Published var modules = [Module]()
    
    //Current module
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    //Current lesson
    @Published var currentLesson: Lesson?
    var currentLessonIndex = 0
    
    //Current Question
    @Published var currentQuestion: Question?
    var currentQuestionIndex = 0
    
    //Current lesson explanation
    @Published var codeText = NSAttributedString()
    
    //Current selected content and test
    @Published var currentContentSelected:Int?
    @Published var currentTestSelected:Int?
    
    var styleData: Data?
    
    init() {
        
        getLocalData()
        
    }
    
    func getLocalData() {
        
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
        
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            let jsonDecoder = JSONDecoder()
            
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            self.modules = modules
            
        }
        
        catch {
            
            print("Couldnt parse local data")
        }
        
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            let styleData = try Data(contentsOf: styleUrl!)
            
            self.styleData = styleData
            
        }
        
        catch {
            print("Couldnt parse style data")
        }
        
    }
    
    func beginModule( moduleid:Int) {
        
        //Find the index for this module id
        for index in 0..<modules.count {
            
            if modules[index].id == moduleid {
                
                currentModuleIndex = index
                break
            }
            
        }
        
        currentModule = modules[currentModuleIndex]
        
       
        
    }
    
    func beginLesson( lessonIndex:Int) {
        if lessonIndex < currentModule!.content.lessons.count {
            currentLessonIndex = lessonIndex
        }
        else {
            currentLessonIndex = 0
        }
        
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
        codeText = addStyling(htmlString: currentLesson!.explanation)
    }
    
    func nextLesson() {
        
        currentLessonIndex += 1
        
        if currentLessonIndex < currentModule!.content.lessons.count {
            
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
        }
        else {
            currentLessonIndex = 0
            currentLesson = nil
        }
    }
    
    
    func hasNextLesson() -> Bool {
        
        return (currentLessonIndex + 1 < currentModule!.content.lessons.count)
        
    }
    
    func beginTest( moduleId:Int) {
        
        currentQuestionIndex = 0
        
        if currentModule?.test.questions.count ?? 0 > 0 {
            currentQuestion = currentModule!.test.questions[currentQuestionIndex]
            codeText = addStyling(htmlString: currentQuestion!.content) 
            
        }
    }
    
    func nextQuestion() {
           
    //Advance the question index
    currentQuestionIndex += 1
        
    //Check that it's within the range of questions
        if currentQuestionIndex < currentModule!.test.questions.count {
            
            //Set the current question
            currentQuestion = currentModule!.test.questions[currentQuestionIndex]
            codeText = addStyling(htmlString: currentQuestion!.content)
        }
        else {
            currentQuestionIndex = 0
            currentQuestion = nil
        }
        }
    
    //MARK: - Code Styling
    
    private func addStyling( htmlString: String) -> NSAttributedString {
        
        var resultString = NSAttributedString()
        var data = Data()
        
        //Add the syling data
        if styleData != nil {
                 data.append(styleData!)
        }
        //Add the html data
        data.append(Data(htmlString.utf8))
        
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType:NSAttributedString.DocumentType.html], documentAttributes: nil) {
           
            resultString = attributedString
        }
        
        return resultString
}

}
