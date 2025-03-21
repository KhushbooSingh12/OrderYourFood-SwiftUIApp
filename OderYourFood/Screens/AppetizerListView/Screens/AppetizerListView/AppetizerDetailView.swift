//
//  AppetizerDetailView.swift
//  OderYourFood
//
//  Created by Khushi singh on 30/03/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order: Order
    @Binding var isShowingDetailview:Bool
    
    let appetizer: Appetizer
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fill)
                .frame(width: 320,height: 225)
            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                   
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                    
                HStack(spacing: 20) {
                    VStack(spacing: 5) {
                        Text("Calories")
                            .bold()
                            .font(.caption)
                        
                        Text("\(appetizer.calories)")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                    VStack {
                        Text("Carbs")
                            .bold()
                            .font(.caption)
                        Text("\(appetizer.carbs)g")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                    VStack {
                        Text("Protein")
                            .bold()
                            .font(.caption)
                        Text("\(appetizer.calories)g")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                }
                   
            }
            
            Spacer()
            
            Button(action: {
                order.add(appetizer)
                isShowingDetailview = false
            }, label: {
               // APButtons(title: "$\(appetizer.price, specifier: "%.2f") - Add To Order")
                Text("$\(appetizer.price, specifier: "%.2f") - Add To Order")
            })
            .modifier(StandardButtonStyle())
            .standardButtonStyle()
            .padding(.bottom, 30)
        }
        .frame(width: 320,height: 500)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button(action: {
            isShowingDetailview = false
        }, label: {
            xDismiss()
        }),alignment: .topTrailing)
        
        
    }
}

#Preview {
    AppetizerDetailView(isShowingDetailview: .constant(true), appetizer: mockData.sampleAppetizer)
}
