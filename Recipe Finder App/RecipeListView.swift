//
//  ContentView.swift
//  Recipe Finder App
//
//  Created by Park Seung Kyu on 1/6/25.
//

import SwiftUI
import SwiftData

struct RecipeListView: View {
    @StateObject var viewModel: RecipeListViewModel

    @State private var query: String = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Search for recipes", text: $query)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Search") {
                    viewModel.searchRecipes(query: query)
                }

                List {
                    Section(header: Text("Recipes")) {
                        ForEach(viewModel.recipes) { recipe in
                            HStack {
                                AsyncImage(url: URL(string: recipe.imageUrl))
                                    .frame(width: 50, height: 50)
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                
                                Text(recipe.title)
                                Spacer()
                                Button("Save") {
                                    viewModel.saveToFavorites(recipe: recipe)
                                }
                            }
                        }
                    }

                    Section(header: Text("Favorites")) {
                        ForEach(viewModel.favorites) { recipe in
                            Text(recipe.title)
                        }
                    }
                }
            }
            .navigationTitle("Recipe Finder")
        }
    }
}
