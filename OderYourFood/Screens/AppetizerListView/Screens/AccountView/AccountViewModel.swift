//
//  AccountViewModel.swift
//  OderYourFood
//
//  Created by Khushi singh on 03/04/24.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
   
    @Published var user = User()
    
    @Published var alertItem: AlertItem?
    
    @AppStorage("user") private var userData: Data?
    
    func saveChanges() {
        guard isValidForm else { return }
        print("Changes are saved successfully")
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveProfile
        }catch {
            alertItem = AlertContext.invalidUser
        }
    }
    
    func retriveUSer() {
        guard let userData else { return }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        }catch {
            alertItem = AlertContext.invalidUser
        }
    }
    
    var isValidForm:Bool {
        guard !user.userName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        return true
    }
    
    
}
