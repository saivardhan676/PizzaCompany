//
//  HistoryView.swift
//  PizzaCompany
//
//  Created by Bachapally Sai Vardhan REDDY on 01/02/26.
//

import SwiftUI

struct HistoryView: View {
    @State var imageID: Int = 1
    
    var body: some View {
        VStack {
//            ContentHeaderView()
//                .layoutPriority(2)
            PageTitleView(title: "Pizza History")
            SelectedImageView(image: "\(imageID)_250w")
                .padding(5)
                .frame(height: 220)
                .layoutPriority(1)
            HistoryListView(imageID: $imageID)
                .layoutPriority(1)
        }
        .padding(.bottom)
    }
}

#Preview {
    Group {
        HistoryView(imageID: 1)
    }
}
