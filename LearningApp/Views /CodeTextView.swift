//
//  CodeTextView.swift
//  LearningApp
//
//  Created by Jai Jordan on 2/6/21.
//

import SwiftUI

struct CodeTextView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        let textView = UITextView
        textView.isEditable = false
        
    }
    
    }
}

struct CodeTextView_Previews: PreviewProvider {
    static var previews: some View {
        CodeTextView()
    }
}
