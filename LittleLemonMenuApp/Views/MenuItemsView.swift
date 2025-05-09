import SwiftUI

struct MenuItemsView: View {
    @StateObject private var viewModel = MenuViewModel()
    @State private var showingOptions = false
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Menu")
                    .font(.largeTitle)
                    .bold()
                    .padding(.horizontal)
                
                // Food Section
                if viewModel.selectedCategories.contains(.food) {
                    Section(header: Text("Food")
                        .font(.title2)
                        .bold()
                        .padding([.top, .horizontal])
                    ) {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(viewModel.foodMenuItems) { item in
                                NavigationLink(destination: MenuItemDetailsView(menuItem: item)) {
                                    MenuItemGridItem(menuItem: item)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                
                // Drinks Section
                if viewModel.selectedCategories.contains(.drink) {
                    Section(header: Text("Drinks")
                        .font(.title2)
                        .bold()
                        .padding([.top, .horizontal])
                    ) {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(viewModel.drinkMenuItems) { item in
                                NavigationLink(destination: MenuItemDetailsView(menuItem: item)) {
                                    MenuItemGridItem(menuItem: item)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                
                // Dessert Section
                if viewModel.selectedCategories.contains(.dessert) {
                    Section(header: Text("Desserts")
                        .font(.title2)
                        .bold()
                        .padding([.top, .horizontal])
                    ) {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(viewModel.dessertMenuItems) { item in
                                NavigationLink(destination: MenuItemDetailsView(menuItem: item)) {
                                    MenuItemGridItem(menuItem: item)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Menu")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    showingOptions = true
                }) {
                    Image(systemName: "slider.horizontal.3")
                }
            }
        }
        .sheet(isPresented: $showingOptions) {
            NavigationView {
                MenuItemsOptionView(viewModel: viewModel)
                    .navigationTitle("Filter")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
