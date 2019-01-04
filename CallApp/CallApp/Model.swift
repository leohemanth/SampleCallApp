//
//  Model.swift
//  CallApp
//
//  Created by Hemanth Prasad on 1/3/19.
//  Copyright © 2019 Hemanth Prasad. All rights reserved.
//

import Foundation
typealias PhoneNumber = [String]

class Model {
    static var calls: Model = .init()
    var phoneNumbers: [PhoneNumber] = [] as! [PhoneNumber] {
        didSet {
            observers.forEach { $0(self) }
        }
    }
    
    var observers: [(Model) -> Void] = []
    
    func insert(call: PhoneNumber) {
        phoneNumbers.append(call)
    }
}



