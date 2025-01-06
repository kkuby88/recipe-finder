//
//  DependencyContainer.swift
//  Recipe Finder App
//
//  Created by Park Seung Kyu on 1/6/25.
//

import SwiftData

class DependencyContainer {
    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    func makeRecipeRepository() -> RecipeRepositoryProtocol {
        return RecipeRepository()
    }

    func makeFetchRecipesUseCase() -> FetchRecipesUseCase {
        let repository = makeRecipeRepository()
        return FetchRecipesUseCase(recipeRepository: repository)
    }

    func makeSaveRecipeUseCase() -> SaveRecipeUseCase {
        return SaveRecipeUseCase(context: context)
    }

    func makeRecipeListViewModel() -> RecipeListViewModel {
        let fetchUseCase = makeFetchRecipesUseCase()
        let saveUseCase = makeSaveRecipeUseCase()
        return RecipeListViewModel(fetchRecipesUseCase: fetchUseCase, saveRecipeUseCase: saveUseCase, context: context)
    }
}
