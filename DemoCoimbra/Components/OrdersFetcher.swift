//
//  Fetcher.swift
//  DemoCoimbra
//
//  Created by Rui Peres on 24/09/2015.
//  Copyright © 2015 Aphely. All rights reserved.
//

import Foundation

class OrdersFetcher {
    
    let network : Network
    let parser : ParseOrders
    let persistenceFilePath : String
    
    init(network: Network = Network(), parser: ParseOrders = parseOrders, persistenceFilePath: String) {
        
        self.network = network
        self.parser = parser
        self.persistenceFilePath = persistenceFilePath
    }
    
    func fetchOrders(request: NSURLRequest) {
        
    }
}