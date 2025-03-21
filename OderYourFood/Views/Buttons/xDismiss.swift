//
//  xDismiss.swift
//  OderYourFood
//
//  Created by Khushi singh on 03/04/24.
//

import SwiftUI

struct xDismiss: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 40,height: 40)
                .foregroundColor(.white)
                .opacity(0.6)
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44,height: 44)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    xDismiss()
}
