//
//  OrderFood.swift
//  OderYourFood
//
//  Created by Khushi singh on 14/03/24.
//

import SwiftUI

struct OrderFood: View {

    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.item) { appetizer in
                            appetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItem(at:))
                    }
                    .listStyle(InsetGroupedListStyle())
                    
                    Button {
                        
                    } label: {
                       // APButtons(title: "$\(order.totalPrice) - Place Order")
                        Text("$\(order.totalPrice) - Place Order")
                    }
                    .modifier(StandardButtonStyle())
                    .standardButtonStyle()
                    .padding(.bottom, 25)
                }
                
                if order.item.isEmpty {
                    EmptyState(imageName: "empty-order", message: "You have no item in your order. Please add an appetizer!")
                }
            }
            .navigationTitle("📋 Orders")
        }
    }
    
    
}

#Preview {
    OrderFood()
}
