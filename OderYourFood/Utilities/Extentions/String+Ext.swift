//
//  String+Ext.swift
//  OderYourFood
//
//  Created by Khushi singh on 03/04/24.
//

import Foundation

extension String {
    var isValidEmail : Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: self)
    }
}
