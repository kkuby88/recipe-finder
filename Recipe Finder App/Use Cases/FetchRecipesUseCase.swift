//
//  FetchRecipesUseCase.swift
//  Recipe Finder App
//
//  Created by Park Seung Kyu on 1/6/25.
//

import Foundation

class FetchRecipesUseCase {
    private let recipeRepository: RecipeRepositoryProtocol

    init(recipeRepository: RecipeRepositoryProtocol) {
        self.recipeRepository = recipeRepository
    }

    func execute(query: String, completion: @escaping (Result<[Recipe], Error>) -> Void) {
        recipeRepository.fetchRecipes(query: query, completion: completion)
    }
}
