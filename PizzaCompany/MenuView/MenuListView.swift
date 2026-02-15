//
//  SwiftUIView.swift
//  PizzaCompany
//
//  Created by Bachapally Sai Vardhan REDDY on 01/02/26.
//

import SwiftUI

struct MenuListView: View {
    @ObservedObject var orderModel: OrderModel
    @State private var selectedItem: MenuItem?
    var menuList = MenuModel().menu
    
    var body: some View {
        VStack {
            ListHeaderView(orderModel: orderModel, text: "Menu")
            NavigationStack {
                List(menuList) { item in
                    Button(action: {
                        selectedItem = item
                    }){
                        MenuRowView(menuItem: item)
                            .listRowInsets(EdgeInsets())
                    }
                    .foregroundColor(.primary)
                }
                .listStyle(.plain)
                .navigationTitle("Pizza Order")
                .navigationDestination(item: $selectedItem) { item in
                    MenuDetailView(orderModel: self.orderModel, menuItem: item)
                }
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    MenuListView(orderModel: OrderModel())
        .environmentObject(UserPreferences())
}
