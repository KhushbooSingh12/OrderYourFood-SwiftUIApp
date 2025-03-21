//
//  appetizerListCell.swift
//  OderYourFood
//
//  Created by Khushi singh on 29/03/24.
//

import SwiftUI

struct appetizerListCell: View {
    let appetizer: Appetizer
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 90)
                    .cornerRadius(8)
            } placeholder: {
                Image("food-placeholder", bundle: nil)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 90)
                    .cornerRadius(8)
            }
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title)
                    .fontWeight(.semibold)
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .foregroundColor(.gray)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    appetizerListCell(appetizer: mockData.sampleAppetizer)
}
