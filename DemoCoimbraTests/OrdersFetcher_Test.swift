//
//  OrdersFetcher_Test.swift
//  DemoCoimbra
//
//  Created by Rui Peres on 24/09/2015.
//  Copyright © 2015 Aphely. All rights reserved.
//

import XCTest
import DVR
@testable import DemoCoimbra

class OrdersFetcher_Test: XCTestCase {

    
    
    
    

    private func validNetwork_Fetcher() -> (OrdersFetcher, NSURLRequest) {
        
        let session = Session(cassetteName: "valid_cassette")
        let network = Network(session: session)
        
        let fileLocation = appendRelativePathToRoot("Orders")

        let ordersFetcher = OrdersFetcher(network: network, persistenceFilePath: fileLocation)
        let request = NSURLRequest(URL: NSURL(string: "https://dl.dropboxusercontent.com/u/14102938/ValidJSON.json")!)
        
        return (ordersFetcher, request)
    }
}
