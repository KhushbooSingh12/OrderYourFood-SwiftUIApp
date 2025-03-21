//
//  OderYourFoodApp.swift
//  OderYourFood
//
//  Created by Khushi singh on 14/03/24.
//

import SwiftUI

@main
struct OderYourFoodApp: App {
    let persistenceController = PersistenceController.shared
    var order = Order()

    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
