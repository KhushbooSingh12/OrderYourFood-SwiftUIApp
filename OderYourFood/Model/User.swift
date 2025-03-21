//
//  User.swift
//  OderYourFood
//
//  Created by Khushi singh on 30/04/24.
//

import Foundation

struct User : Codable {
    var userName        = ""
    var lastName        = ""
    var birthdayDate    = Date()
    var email           = ""
    var extraNapkins    = false
    var frequentRefills = false
}
