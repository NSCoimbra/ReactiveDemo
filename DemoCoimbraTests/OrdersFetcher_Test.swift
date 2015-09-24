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
    
    let fileName = "Orders"
    
    override func setUp() {
        removeTestFile(fileName)
    }
    
    func test_validFetch_InternetRequest() {
        
        let expectation = self.expectationWithDescription("Expected valid response")
        defer { self.waitForExpectationsWithTimeout(1.0, handler: nil) }
        
        let (fetcher, request) = self.validNetwork_Fetcher()
        
        fetcher.fetchOrders(request, completion: {orders, error in
            
            XCTAssertNil(error)
            XCTAssertNotNil(orders)
            XCTAssertEqual(orders?.count, 6)

            expectation.fulfill()
        })
    }
    
    func test_validFetch_FromPersistence() {
        
        let expectation = self.expectationWithDescription("Expected valid response")
        defer { self.waitForExpectationsWithTimeout(1.0, handler: nil) }
        
        let (fetcher, request) = self.validNetwork_Fetcher()
        
        fetcher.fetchOrders(request, completion: {orders, error in
            
            XCTAssertNil(error)
            XCTAssertNotNil(orders)
            XCTAssertEqual(orders?.count, 6)
            
            expectation.fulfill()
        })
    }

    
    private func validNetwork_Fetcher() -> (OrdersFetcher, NSURLRequest) {
        
        let session = Session(cassetteName: "valid_cassette")
        let network = Network(session: session)
        
        let fileLocation = appendRelativePathToRoot(fileName)
        
        let ordersFetcher = OrdersFetcher(network: network, persistenceFilePath: fileLocation)
        let request = NSURLRequest(URL: NSURL(string: "http://api.fun/Valid_JSON.json")!)
        
        return (ordersFetcher, request)
    }
}
