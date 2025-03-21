//
//  AppetizerListView.swift
//  OderYourFood
//
//  Created by Khushi singh on 14/03/24.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    @State private var isShowingDetail = false
    @State private var selectedAppetizer: Appetizer?
    
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.appetizer) {appetizer in
                    appetizerListCell(appetizer: appetizer)
                       // .listRowSeparator(.hidden)
                       // .listRowSeparatorTint(.brandPrimary)
                        .onTapGesture {
                            selectedAppetizer = appetizer
                            isShowingDetail = true
                        }
                }
                .navigationTitle("🍟 Appetizers")
                .listStyle(.plain)
                .disabled(isShowingDetail ? true: false)
            }
            //Marks:- When we use completetion handler
//            .onAppear {
//                viewModel.getAppetizer()
//            }
            //Marks:- When we use async await
            .task {
                viewModel.getAppetizer()
            }
            .blur(radius: isShowingDetail ? 20: 0)
            if isShowingDetail {
                AppetizerDetailView(isShowingDetailview: $isShowingDetail, appetizer: selectedAppetizer!)
            }
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,message: alertItem.message,dismissButton: alertItem.dismissButton)
        }
        
    }
}

#Preview {
    AppetizerListView()
}
