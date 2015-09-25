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
        
        let expectation = self.expectationWithDescription("Expected valid response from network")
        defer { self.waitForExpectationsWithTimeout(1.0, handler: nil) }
        
        let (fetcher, request) = self.fetcher(("valid_cassette","http://api.fun/Valid_JSON.json"))
        
        fetcher.fetchOrders(request, completion: {orders, error in
            
            XCTAssertNil(error)
            XCTAssertNotNil(orders)
            XCTAssertEqual(orders?.count, 6)

            expectation.fulfill()
        })
    }
    
    func test_validFetch_Persistence() {
        
        let expectation = self.expectationWithDescription("Expected valid response from persistence")
        defer { self.waitForExpectationsWithTimeout(1.0, handler: nil) }
        
        let fileLocation = appendRelativePathToRoot(fileName)

        let data = readFile("ValidJSON")
        writeDataToFile(fileLocation, data: data, completion: {error in })
        
        let (fetcher, request) = self.fetcher(("invalid_cassette","http://api.fun/404"))
        
        fetcher.fetchOrders(request, completion: {orders, error in
            
            XCTAssertNil(error)
            XCTAssertNotNil(orders)
            XCTAssertEqual(orders?.count, 6)
            
            expectation.fulfill()
        })
    }
    
    func test_invalidFetch() {
        
        let expectation = self.expectationWithDescription("Expected valid response from persistence")
        defer { self.waitForExpectationsWithTimeout(1.0, handler: nil) }
        
        let (fetcher, request) = self.fetcher(("invalid_cassette","http://api.fun/404"))
        
        fetcher.fetchOrders(request, completion: {orders, error in
            
            XCTAssertNotNil(error)
            XCTAssertNil(orders)
            
            expectation.fulfill()
        })
    }
    
    private func fetcher(bundle: (cassette: String, endpoint: String)) -> (OrdersFetcher, NSURLRequest) {
        
        let session = Session(cassetteName: bundle.cassette)
        let network = Network(session: session)
        
        let fileLocation = appendRelativePathToRoot(fileName)
        
        let ordersFetcher = OrdersFetcher(network: network, persistenceFilePath: fileLocation)
        let request = NSURLRequest(URL: NSURL(string: bundle.endpoint)!)
        
        return (ordersFetcher, request)
    }
}
