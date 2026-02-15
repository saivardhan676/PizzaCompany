//
//  RootTabView.swift
//  PizzaCompany
//
//  Created by Bachapally Sai Vardhan REDDY on 13/02/26.
//

import SwiftUI

struct RootTabView: View {
    var body: some View {
        TabView {
            ContentView(orderModel: OrderModel())
                .tabItem {
                    Image(systemName: "cart")
                    Text("Cart")
                }
            HistoryView()
                .tabItem {
                    Image(systemName: "book")
                    Text("History")
                }
        }
        .accentColor(Color("G3"))
    }
}

#Preview {
    RootTabView()
        .environmentObject(UserPreferences())
}
