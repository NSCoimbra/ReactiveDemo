//
//  Parser.swift
//  DemoCoimbra
//
//  Created by Rui Peres on 21/09/2015.
//  Copyright © 2015 Aphely. All rights reserved.
//

import Foundation
import Decodable

func parseOrders(ordersData: NSData, completion: ([Order]?, Error?) -> ())  {
    
    if let json = try? NSJSONSerialization.JSONObjectWithData(ordersData, options: NSJSONReadingOptions.MutableContainers),
        let orders =  try? [Order].decode(json)
    {
        completion(orders,nil)
    }
    else {
        completion(nil,.Parsing)
    }
}



