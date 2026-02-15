//
//  HistoryRowView.swift
//  PizzaCompany
//
//  Created by Bachapally Sai Vardhan REDDY on 01/02/26.
//

import SwiftUI

struct HistoryRowView: View {
    var historyItem: HistoryItem
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image("\(historyItem.id)_100w")
                .clipShape(Circle())
                .shadow(color: .black.opacity(0.5), radius: 10, x: 5, y: 5)
            Text(historyItem.name)
                .font(.title)
            Spacer()
            
        }
        .overlay(
            Image(systemName: "chevron.right.square")
                .font(.title)
                .foregroundStyle(Color("G4"))
                .padding(5),
            alignment: .trailing
        )
    }
}

#Preview {
    HistoryRowView(historyItem: HistoryModel().historyItems[0])
}
