//
//  ContentView.swift
//  OderYourFood
//
//  Created by Khushi singh on 14/03/24.
//

import SwiftUI
import CoreData

struct AppetizerTabView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        
        TabView {
            AppetizerListView()
                .tabItem { Label("Home", systemImage: "house")}
            AccountView()
                .tabItem { Label("person", systemImage: "person")}
            OrderFood()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
                .badge(order.item.count)
        }
    }
}


#Preview {
    AppetizerTabView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
