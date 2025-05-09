//
//  LittleLemonMenuAppTests.swift
//  LittleLemonMenuAppTests
//
//  Created by Efe Alço on 8.05.2025.
//

import XCTest
@testable import LittleLemonMenuApp

final class MenuItemTests: XCTestCase {
    func testMenuItemTitle() {
        let item = MenuItem(title: "Test Pizza", menuCategory: .food, ordersCount: 0, price: 15, ingredients: [])
        XCTAssertEqual(item.title, "Test Pizza")
    }

    func testMenuItemIngredients() {
        let item = MenuItem(title: "Veggie Mix", menuCategory: .food, ordersCount: 1, price: 12, ingredients: [.spinach, .broccoli])
        XCTAssertEqual(item.ingredients, [.spinach, .broccoli])
    }
}

