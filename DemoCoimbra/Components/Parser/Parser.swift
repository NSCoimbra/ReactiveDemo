//
//  Parser.swift
//  DemoCoimbra
//
//  Created by Rui Peres on 21/09/2015.
//  Copyright © 2015 Aphely. All rights reserved.
//

import Foundation
import Decodable
import ReactiveCocoa

typealias ParseOrders = (NSData, ([Order]?, Error?) -> ()) -> ()

func parseOrders(ordersData: NSData, completion: ([Order]?, Error?) -> ())  {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
        
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(ordersData, options: NSJSONReadingOptions.AllowFragments)
            let orders =  try [Order].decode(json)
            completion(orders,nil)
        }
        catch _ {
            completion(nil,.Parsing)
        }
    }
}



