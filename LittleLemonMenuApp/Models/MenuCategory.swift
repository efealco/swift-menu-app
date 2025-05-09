//
//  MenuCategory.swift
//  LittleLemonMenuApp
//
//  Created by Efe Alço on 8.05.2025.
//


enum MenuCategory: String, CaseIterable, Identifiable {
    var id: String { rawValue }
    case food = "Food"
    case drink = "Drink"
    case dessert = "Dessert"
}
