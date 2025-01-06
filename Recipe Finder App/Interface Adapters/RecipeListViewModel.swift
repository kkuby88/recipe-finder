//
//  RecipeListViewModel.swift
//  Recipe Finder App
//
//  Created by Park Seung Kyu on 1/6/25.
//

import SwiftUI
import SwiftData

class RecipeListViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var favorites: [Recipe] = []

    private let fetchRecipesUseCase: FetchRecipesUseCase
    private let saveRecipeUseCase: SaveRecipeUseCase
    private let context: ModelContext

    init(fetchRecipesUseCase: FetchRecipesUseCase, saveRecipeUseCase: SaveRecipeUseCase, context: ModelContext) {
        self.fetchRecipesUseCase = fetchRecipesUseCase
        self.saveRecipeUseCase = saveRecipeUseCase
        self.context = context
        loadFavorites()
    }

    func searchRecipes(query: String) {
        fetchRecipesUseCase.execute(query: query) { [weak self] result in
            switch result {
            case .success(let recipes):
                DispatchQueue.main.async {
                    self?.recipes = recipes
                }
            case .failure(let error):
                print("Error fetching recipes: \(error)")
            }
        }
    }

    func saveToFavorites(recipe: Recipe) {
        saveRecipeUseCase.execute(recipe: recipe)
        loadFavorites()
    }

    private func loadFavorites() {
        let request = FetchDescriptor<Recipe>()
        if let fetchedFavorites = try? context.fetch(request) {
            DispatchQueue.main.async {
                self.favorites = fetchedFavorites
            }
        }
    }
}
