//
//  EmptyState.swift
//  OderYourFood
//
//  Created by Khushi singh on 30/04/24.
//

import SwiftUI

struct EmptyState: View {
    
    var imageName: String
    var message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                  .edgesIgnoringSafeArea(.all)
                  
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }
        }
    }
}

#Preview {
    EmptyState(imageName: "empty-order", message: "This is my test message. I am making it a little long for testing.")
}
