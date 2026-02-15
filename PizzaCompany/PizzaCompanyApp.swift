//
//  PizzaCompanyApp.swift
//  PizzaCompany
//
//  Created by Bachapally Sai Vardhan REDDY on 28/01/26.
//

import SwiftUI

@main
struct PizzaCompanyApp: App {
    var body: some Scene {
        WindowGroup {
            RootTabView()
                .environmentObject(UserPreferences())
        }
    }
}
