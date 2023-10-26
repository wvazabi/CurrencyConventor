//
//  country.swift
//  CurrencyConventor
//
//  Created by Enes Kaya on 26.10.2023.
//

import Foundation

struct Country : Decodable {
    let name : String
    let flag : String
    let currency : String
}
