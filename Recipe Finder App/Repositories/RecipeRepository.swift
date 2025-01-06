//
//  RecipeRepository.swift
//  Recipe Finder App
//
//  Created by Park Seung Kyu on 1/6/25.
//

import Foundation

protocol RecipeRepositoryProtocol {
    func fetchRecipes(query: String, completion: @escaping (Result<[Recipe], Error>) -> Void)
}

class RecipeRepository: RecipeRepositoryProtocol {
    func fetchRecipes(query: String, completion: @escaping (Result<[Recipe], Error>) -> Void) {
        let apiUrl = "https://api.spoonacular.com/recipes/complexSearch?query=\(query)&apiKey=e9d21a7da1094b529cd1810205dba0f1"
        
        guard let url = URL(string: apiUrl) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(RecipeResponse.self, from: data)
                let recipes = response.results.map { Recipe(id: "\($0.id)", title: $0.title, imageUrl: $0.image, ingredients: []) }
                completion(.success(recipes))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

struct RecipeResponse: Codable {
    let results: [RecipeDTO]
}

struct RecipeDTO: Codable {
    let id: Int
    let title: String
    let image: String
}
