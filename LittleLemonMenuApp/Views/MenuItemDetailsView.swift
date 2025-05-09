//
//  MenuItemDetailsView.swift
//  LittleLemonMenuApp
//
//  Created by Efe Alço on 8.05.2025.
//


import SwiftUI

struct MenuItemDetailsView: View {
    let menuItem: MenuItem
    
    var body: some View {
        VStack(spacing: 16) {
            Text(menuItem.title)
                .font(.largeTitle)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 500)
            
            Text("Price: $\(menuItem.price, specifier: "%.2f")")
                .font(.title2)
            
            Text("Ingredients:")
                .font(.headline)
            
            ForEach(menuItem.ingredients, id: \.self) { ingredient in
                Text("• \(ingredient.rawValue)")
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Details")
    }
}
