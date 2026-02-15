//
//  HistoryDetailView.swift
//  HuliPizza
//
//  Created by Steven Lipton on 9/18/19.
//  Copyright © 2019 Steven Lipton. All rights reserved.
//

import SwiftUI

struct HistoryDetailView: View {
    var historyItem: HistoryItem
    @Binding var imageID: Int
    @State var isPresented: Bool = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        imageID = historyItem.id
        return VStack {
            PageTitleView(title: historyItem.name)
            MapView(latitude: historyItem.latitude, longitude: historyItem.longitude, regionRadius: 1000000)
                .frame(height: 100)
            PresentMapButton(isPresented: $isPresented, historyItem: historyItem)
            ScrollView {
                Text(historyItem.history)
                    .frame(height:300)
                    .padding()
            }
            .ignoresSafeArea(edges: .top)
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    HStack(spacing: 3) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 12, weight: .bold)) // Adjust size here
                        Text("Back")
                            .font(.system(size: 14)) // Smaller text
                    }
                    .foregroundColor(.blue)
                }
                .frame(height: 20)
            }
        }
    }
}

#Preview {
    HistoryDetailView(historyItem:HistoryModel().historyItems[0], imageID: .constant(0))
}
