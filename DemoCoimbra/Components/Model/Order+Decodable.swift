//
//  Order+Decodable.swift
//  DemoCoimbra
//
//  Created by Rui Peres on 21/09/2015.
//  Copyright © 2015 Aphely. All rights reserved.
//

import Foundation
import Decodable

extension Order: Decodable {
    
    static func decode(j: AnyObject) throws -> Order {
        
        return try Order(
            orderID: j => "id",
            orderValue: j => "value",
            orderDescription: j => "description")
    }
}