//
//  Recipe.swift
//  Recipe Finder App
//
//  Created by Park Seung Kyu on 1/6/25.
//
import SwiftData

@Model
class Recipe {
    @Attribute(.unique) var id: String
    var title: String
    var imageUrl: String
    var ingredients: [String]
    
    init(id: String, title: String, imageUrl: String, ingredients: [String]) {
        self.id = id
        self.title = title
        self.imageUrl = imageUrl
        self.ingredients = ingredients
    }
}
