//
//  SortOption.swift
//  LittleLemonMenuApp
//
//  Created by Efe Alço on 8.05.2025.
//


enum SortOption: String, CaseIterable, Identifiable {
    var id: String { rawValue }
    case popular = "Most Popular"
    case price = "Price $-$$$"
    case az = "A-Z"
}
