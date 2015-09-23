//
//  Network_Test.swift
//  DemoCoimbra
//
//  Created by Rui Peres on 23/09/2015.
//  Copyright © 2015 Aphely. All rights reserved.
//

import XCTest
import DVR
@testable import DemoCoimbra

class Network_Test: XCTestCase {

    func testValidRequest() {
        
        let expectation = self.expectationWithDescription("Expected valid response")
        defer { self.waitForExpectationsWithTimeout(1.0, handler: nil) }
        
        let session = Session(cassetteName: "valid_cassette")
        let network = Network(session: session)
        let request = NSURLRequest(URL: NSURL(string: "https://dl.dropboxusercontent.com/u/14102938/ValidJSON.json")!)
            
        network.makeConnection(request, completion: {data, error in
        
            XCTAssert(error == nil)
            XCTAssert(data != nil)
            
            expectation.fulfill()
        })
    }

    func testInvalidRequest() {
        
        let expectation = self.expectationWithDescription("Expected valid response")
        defer { self.waitForExpectationsWithTimeout(1.0, handler: nil) }
        
        let session = Session(cassetteName: "invalid_cassette")
        let network = Network(session: session)
        let request = NSURLRequest(URL: NSURL(string: "https://dl.dropboxusercontent.com/u/14102938/404")!)
        
        network.makeConnection(request, completion: {data, error in
            
            XCTAssert(error == .Networking)
            XCTAssert(data == nil)
            expectation.fulfill()
        })
    }
}
