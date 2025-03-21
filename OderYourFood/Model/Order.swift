//
//  Order.swift
//  OderYourFood
//
//  Created by Khushi singh on 02/05/24.
//

import SwiftUI


final class Order : ObservableObject {
    @Published var item: [Appetizer] = []
    
    var totalPrice: Double {
        item.reduce(0) { partialResult, Appetizer in
            partialResult + Appetizer.price
        }
    }
    
    func add(_ appetizer: Appetizer) {
        item.append(appetizer)
    }
    
    func deleteItem(at offsets: IndexSet) {
        item.remove(atOffsets: offsets)
    }
}
