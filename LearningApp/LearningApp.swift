//
//  LearningApp.swift
//  LearningApp
//
//  Created by Jai Jordan on 29/5/21.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(ContentModel())
        }
    }
}
