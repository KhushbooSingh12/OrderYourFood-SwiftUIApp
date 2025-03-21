//
//  AppetizerListViewModel.swift
//  OderYourFood
//
//  Created by Khushi singh on 29/03/24.
//

import SwiftUI

@MainActor final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizer: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading:Bool = false
    
//MARKS: - Func with completion handler
//    func getAppetizer() {
//        isLoading = true
//        NetworkManager.shared.getAppetizers { result in
//            DispatchQueue.main.async {
//                self.isLoading = false
//                switch result {
//                case .success(let appetizers) :
//                    self.appetizer = appetizers
//                case .failure(let error) :
//                    switch error {
//                    case .invalidData:
//                        self.alertItem = AlertContext.invalidData
//                    case .invalidResponse:
//                        self.alertItem = AlertContext.invalidResponse
//                    case .invalidURL:
//                        self.alertItem = AlertContext.invalidURL
//                    case .unableToComplete:
//                        self.alertItem = AlertContext.unableToComplete
//                    }
//                    print(error.localizedDescription)
//                }
//            }
//        }
//    }
    
// MARKS: - Func with async await
    func getAppetizer() {
        isLoading = true
        Task {
            do {
                appetizer = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            }
            catch {
                if let apError = error as? APError {
                    switch apError {
                    case .invalidURL :
                        alertItem = AlertContext.invalidURL
                    case.invalidResponse :
                        alertItem = AlertContext.invalidResponse
                    case.invalidData :
                        alertItem = AlertContext.invalidData
                    case.unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
                else {
                    alertItem = AlertContext.invalidResponse
                }
                isLoading = false
            }
        }
    }
}
