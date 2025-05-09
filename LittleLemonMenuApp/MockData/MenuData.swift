//
//  MenuData.swift
//  LittleLemonMenuApp
//
//  Created by Efe Alço on 8.05.2025.
//


struct MenuData {
    static let foodItems: [MenuItem] = (1...12).map {
        MenuItem(title: "Food \($0)", menuCategory: .food, ordersCount: $0 * 2, price: Double(10 + $0), ingredients: [.pasta, .tomatoSauce])
    }
    static let drinkItems: [MenuItem] = (1...8).map {
        MenuItem(title: "Drink \($0)", menuCategory: .drink, ordersCount: $0, price: Double(5 + $0), ingredients: [])
    }
    static let dessertItems: [MenuItem] = (1...4).map {
        MenuItem(title: "Dessert \($0)", menuCategory: .dessert, ordersCount: $0 * 3, price: Double(7 + $0), ingredients: [.carrot])
    }
}
