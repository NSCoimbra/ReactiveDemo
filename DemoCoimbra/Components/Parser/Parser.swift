//
//  Parser.swift
//  DemoCoimbra
//
//  Created by Rui Peres on 21/09/2015.
//  Copyright © 2015 Aphely. All rights reserved.
//

import Foundation
import Decodable
import Result

func parseOrders(ordersData: NSData) -> Result<[Order], Error> {
    
    do {
        let json = try NSJSONSerialization.JSONObjectWithData(ordersData, options: NSJSONReadingOptions.MutableContainers)
        let orders =  try [Order].decode(json)
        
        return Result(value: orders)
    }
    catch _ {
        return Result(error: .Parsing)
    }
}


