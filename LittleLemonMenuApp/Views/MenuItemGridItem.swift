//
//  MenuItemGridItem.swift
//  LittleLemonMenuApp
//
//  Created by Efe Alço on 8.05.2025.
//


import SwiftUI

struct MenuItemGridItem: View {
    let menuItem: MenuItem

    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(maxWidth: .infinity)
                .aspectRatio(1, contentMode: .fit)
                .cornerRadius(8)

            Text(menuItem.title)
                .font(.caption)
                .lineLimit(1)
        }
    }
}
