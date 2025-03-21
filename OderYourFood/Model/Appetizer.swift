//
//  Appetizer.swift
//  OderYourFood
//
//  Created by Khushi singh on 29/03/24.
//

import Foundation


struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct mockData {
    static let sampleAppetizer = Appetizer(id: 001, 
                                           name: "Test Appetizer",
                                           description: "This is the description of my appetizer. it's yummy.",
                                           price: 999, 
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    
    static let appetizer  = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    static let orderItemOne = Appetizer(id: 001,
                                           name: "Test Appetizer",
                                           description: "This is the description of my appetizer. it's yummy.",
                                           price: 999,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    static let orderItemTwo = Appetizer(id: 002,
                                           name: "Pizza",
                                           description: "This is the description of my appetizer. it's yummy.",
                                           price: 1200,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    
    static let orderItemThree = Appetizer(id: 003,
                                           name: "Burger",
                                           description: "This is the description of my appetizer. it's yummy.",
                                           price: 600,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    
    static let oders  = [orderItemOne, orderItemTwo, orderItemThree]
}


