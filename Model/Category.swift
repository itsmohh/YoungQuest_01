//
//  Category.swift
//  TeamBlue
//
//  Created by Gcode on 8/19/24.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class Category {
    var categoryName: String
    @Relationship(deleteRule: .cascade, inverse: \Expense.category)
    var expenses: [Expense]?
    init(categoryName: String) {
        self.categoryName = categoryName
    }
}
