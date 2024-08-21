//
//  TeamBlueApp.swift
//  TeamBlue
//
//  Created by Yinka  Facus  on 8/3/24.
//

import SwiftUI

@main
struct TeamBlueApp: App {
    var body: some Scene {
        WindowGroup {
            WelcomeView()
        }
        .modelContainer(for: [Expense.self, Category.self])
    }
}
