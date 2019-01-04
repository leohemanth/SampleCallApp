//
//  NumberFormatter.swift
//  CallApp
//
//  Created by Hemanth Prasad on 1/3/19.
//  Copyright © 2019 Hemanth Prasad. All rights reserved.
//

import Foundation
class NumberFormatter {
    static func formatNumber(number: PhoneNumber) -> String {
        var formattedNumber: PhoneNumber = number
        switch number.count {
        case 1,2,3:
            break
        case 4,5,6,7:
            formattedNumber.insert("-", at: 3)
        case 8,9,10:
            formattedNumber.insert("(", at: 0)
            formattedNumber.insert(") ", at: 4)
            formattedNumber.insert("-", at: 8)
        default:
            break
        }
        return formattedNumber.joined()
    }
}
