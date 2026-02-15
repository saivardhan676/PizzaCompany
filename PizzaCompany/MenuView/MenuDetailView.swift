//
//  MenuDetailView.swift
//  Pizza
//
//  Created by Steven Lipton on 9/2/19.
//  Copyright © 2019 Steven Lipton. All rights reserved.
//

import SwiftUI
///A `View`for entering in an order. Takes basic information about the order from `menuItem`
struct MenuDetailView: View {
    @EnvironmentObject var settings: UserPreferences
    @ObservedObject var orderModel: OrderModel
    @State var didOrder: Bool = false
    @State var quantity: Int = 1
    @Environment(\.dismiss) var dismiss
    var menuItem: MenuItem
    var formattedPrice:String{
        String(format:"%3.2f",menuItem.price * Double(quantity) * settings.size.rawValue)
    }
    func addItem(){
        didOrder = true
    }
    
    var body: some View {
        VStack {
            PageTitleView(title: menuItem.name)
            SelectedImageView(image: "\(menuItem.id)_250w")
                .padding(5)
                .layoutPriority(3)
            
            Text(menuItem.description)
                .lineLimit(5)
                .padding()
                .layoutPriority(3)
                
            Spacer()
            
            .background(Color("G1"))
            .cornerRadius(20)
            PickerView(size: $settings.size)
                .padding()
            StepperView(quantity: $quantity)
                .padding()
            
            HStack {
                Text("Order:  \(formattedPrice)")
                    .font(.headline)
                Spacer()
                Text("Order total: " + orderModel.formattedTotal)
                    .font(.headline)
            }
            .padding([.leading, .trailing])
            
            HStack {
                Spacer()
                Button(action: addItem) {
                   Text("Add to order")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(12)
                        .background(Color("G4"))
                        .foregroundColor(Color("IP"))
                        .cornerRadius(5)
                    
                }
                .sheet(isPresented: $didOrder, content: {
                    ConfirmView(menuID: menuItem.id, isPresented: self.$didOrder, quantity: $quantity, size: $settings.size, orderModel: orderModel)
                })
                Spacer()
            }
            .padding(.top)
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
    MenuDetailView(orderModel: OrderModel(), menuItem: testMenuItem)
        .environmentObject(UserPreferences())
}
