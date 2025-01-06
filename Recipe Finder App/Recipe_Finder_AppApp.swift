//
//  Recipe_Finder_AppApp.swift
//  Recipe Finder App
//
//  Created by Park Seung Kyu on 1/6/25.
//

import SwiftUI
import SwiftData

@main
struct Recipe_Finder_AppApp: App {
    
    private let container: ModelContainer

    init() {
        do {
            container = try ModelContainer(for: Recipe.self)
        } catch {
            fatalError("Failed to initialize ModelContainer: \(error)")
        }
    }

    var body: some Scene {
        WindowGroup {
            let dependencyContainer = DependencyContainer(context: container.mainContext)
            RecipeListView(viewModel: dependencyContainer.makeRecipeListViewModel())
        }
        .modelContainer(container)
    }
}
