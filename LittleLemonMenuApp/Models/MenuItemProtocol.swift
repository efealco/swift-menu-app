//
//  MenuItemProtocol.swift
//  LittleLemonMenuApp
//
//  Created by Efe Alço on 8.05.2025.
//


import Foundation

protocol MenuItemProtocol {
    var id: UUID { get }
    var title: String { get }
    var menuCategory: MenuCategory { get }
    var ordersCount: Int { get set }
    var price: Double { get set }
    var ingredients: [Ingredient] { get set }
}

struct MenuItem: Identifiable, MenuItemProtocol {
    let id = UUID()
    let title: String
    let menuCategory: MenuCategory
    var ordersCount: Int
    var price: Double
    var ingredients: [Ingredient]
}
