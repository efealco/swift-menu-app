//
//  MenuItemsOptionView.swift
//  LittleLemonMenuApp
//
//  Created by Efe Alço on 8.05.2025.
//


import SwiftUI

struct MenuItemsOptionView: View {
    @ObservedObject var viewModel: MenuViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("CATEGORIES")) {
                    ForEach(MenuCategory.allCases) { category in
                        MultipleSelectionRow(
                            title: category.rawValue,
                            isSelected: viewModel.selectedCategories.contains(category)
                        ) {
                            if viewModel.selectedCategories.contains(category) {
                                viewModel.selectedCategories.remove(category)
                            } else {
                                viewModel.selectedCategories.insert(category)
                            }
                        }
                    }
                }
                
                Section(header: Text("SORT BY")) {
                    Picker("Sort Option", selection: $viewModel.selectedSortOption) {
                        ForEach(SortOption.allCases) { sort in
                            Text(sort.rawValue).tag(sort)
                        }
                    }
                    .pickerStyle(.inline)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct MultipleSelectionRow: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark")
                        .foregroundColor(.accentColor)
                }
            }
        }
    }
}
