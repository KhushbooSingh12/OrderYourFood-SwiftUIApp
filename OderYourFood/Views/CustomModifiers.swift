//
//  CustomModifiers.swift
//  OderYourFood
//
//  Created by Khushi singh on 26/09/24.
//

import Foundation
import SwiftUI

struct StandardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
             content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}
extension View {
    func standardButtonStyle() -> some View {
        self.modifier(StandardButtonStyle())
    }
}
