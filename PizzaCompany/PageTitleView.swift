//
//  PageTitleView.swift
//  PizzaCompany
//
//  Created by Bachapally Sai Vardhan REDDY on 01/02/26.
//

import SwiftUI

struct PageTitleView: View {
    var title: String
    var isDisplayingOrders: Bool? = nil
    
    var body: some View {
        HStack {
            Spacer()
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding([.trailing], 15)
                .padding([.top, .bottom], 6)
        }
        .foregroundStyle(Color("G1"))
        .background(Color("G4"))
        .overlay(
            Image(systemName: "chevron.up.square")
                .rotationEffect(Angle(degrees: isDisplayingOrders ?? false ? 0 : 180))
                .animation(.easeInOut(duration: 0.3))
                .font(.title)
                .padding(15)
                .foregroundStyle(isDisplayingOrders != nil ? Color("G1") : Color("G4")),
            alignment: .leading
        )
    }
}

#Preview {
    PageTitleView(title: "Order Pizza", isDisplayingOrders: true)
}
