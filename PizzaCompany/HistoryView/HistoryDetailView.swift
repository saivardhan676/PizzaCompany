//
//  HistoryDetailView.swift
//

import SwiftUI

struct HistoryDetailView: View {
    var historyItem: HistoryItem
    @Binding var imageID: Int
    @State var isPresented: Bool = false
    
    var body: some View {
        imageID = historyItem.id
        return VStack {
            PageTitleView(title: historyItem.name)
            backButtonView()
            MapView(latitude: historyItem.latitude, longitude: historyItem.longitude, regionRadius: 1000000)
                .frame(height: 100)
            PresentMapButton(isPresented: $isPresented, historyItem: historyItem)
            ScrollView {
                Text(historyItem.history)
                    .frame(height:300)
                    .padding()
            }
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    HistoryDetailView(historyItem:HistoryModel().historyItems[0], imageID: .constant(0))
}
