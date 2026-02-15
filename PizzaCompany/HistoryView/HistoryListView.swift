//
//  HistoryListView.swift
//  PizzaCompany
//
//  Created by Bachapally Sai Vardhan REDDY on 01/02/26.
//

import SwiftUI

struct HistoryListView: View {
    var historyModel = HistoryModel()
    @Binding var imageID: Int
    @State private var selectedHistoryItem: HistoryItem?
    
    var body: some View {
        VStack {
            NavigationStack {
                List(historyModel.historyItems) { item in
                    Button {
                        selectedHistoryItem = item
                    } label: {
                        HistoryRowView(historyItem: item)
                    }
                    .foregroundStyle(.primary)
                }
                .listStyle(.plain)
                .navigationDestination(item: $selectedHistoryItem) { item in
                    HistoryDetailView(historyItem: item, imageID: $imageID)
                }
            }
        }
    }
}

#Preview {
    HistoryListView(imageID: .constant(0))
}
