//
//  Alert.swift
//  OderYourFood
//
//  Created by Khushi singh on 29/03/24.
//

import SwiftUI


struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidData = AlertItem(title: Text("Server Error"), message: Text("The data received from the server was invalid. Please contact support"), dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(title: Text("Server Error"), message: Text("Invalid response received from the server. Please contact support"), dismissButton: .default(Text("OK")))
    
    static let invalidURL = AlertItem(title: Text("Invalid Sacn Type"), message: Text("There was an issue connecting to the server. please contact support"), dismissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(title: Text("Invalid Scan Type"), message: Text("There was an issue connecting to the server. please contact support"), dismissButton: .default(Text("OK")))
    
    static let invalidForm = AlertItem(title: Text("Invalid Form"), message: Text("Please ensure all fields in the form have been filled"), dismissButton: .default(Text("OK")))
    
    static let invalidEmail = AlertItem(title: Text("Invalid Email"), message: Text("Please enter the valid mail Id"), dismissButton: .default(Text("OK")))
    
    static let userSaveProfile = AlertItem(title: Text("Profile Saved"), message: Text("User profile is successfully saved"), dismissButton: .default(Text("OK")))
    
    static let invalidUser = AlertItem(title: Text("Profile Error"), message: Text("There was an error in saving or retriving profile"), dismissButton: .default(Text("OK")))
}
