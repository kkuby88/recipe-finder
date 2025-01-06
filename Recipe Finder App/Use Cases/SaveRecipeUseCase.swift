//
//  SaveRecipeUseCase.swift
//  Recipe Finder App
//
//  Created by Park Seung Kyu on 1/6/25.
//

import SwiftData

class SaveRecipeUseCase {
    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    func execute(recipe: Recipe) {
        context.insert(recipe)
        try? context.save()
    }
}
