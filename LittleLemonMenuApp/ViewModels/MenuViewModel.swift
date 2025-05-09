//
//  MenuViewModel.swift
//  LittleLemonMenuApp
//
//  Created by Efe Alço on 8.05.2025.
//
import SwiftUI
import Foundation

class MenuViewModel: ObservableObject {
    @Published var allMenuItems: [MenuItem] = []
    @Published var selectedCategories: Set<MenuCategory> = Set(MenuCategory.allCases)
    @Published var selectedSortOption: SortOption = .popular

    init() {
        allMenuItems = MenuData.foodItems + MenuData.drinkItems + MenuData.dessertItems
    }

    var foodMenuItems: [MenuItem] {
        filteredItems(for: .food)
    }

    var drinkMenuItems: [MenuItem] {
        filteredItems(for: .drink)
    }

    var dessertMenuItems: [MenuItem] {
        filteredItems(for: .dessert)
    }

    private func filteredItems(for category: MenuCategory) -> [MenuItem] {
        guard selectedCategories.contains(category) else { return [] }
        let items = allMenuItems.filter { $0.menuCategory == category }
        return sort(items: items)
    }

    private func sort(items: [MenuItem]) -> [MenuItem] {
        switch selectedSortOption {
        case .popular:
            return items.sorted { $0.ordersCount > $1.ordersCount }
        case .price:
            return items.sorted { $0.price < $1.price }
        case .az:
            return items.sorted { $0.title.localizedCaseInsensitiveCompare($1.title) == .orderedAscending }
        }
    }
}
