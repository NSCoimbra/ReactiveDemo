//
//  Parse_Test.swift
//  DemoCoimbra
//
//  Created by Rui Peres on 21/09/2015.
//  Copyright © 2015 Aphely. All rights reserved.
//

import XCTest

import Decodable
import Result
@testable import DemoCoimbra

class Parse_Test: XCTestCase {
    
    func test_validData() {
        
        let data = readFile("ValidJSON")
        let orders = parseOrders(data)
        
        XCTAssert(orders.value!.count == 6)
    }
    
    func test_invalidData() {
        
        let data = readFile("InvalidJSON")
        let orders = parseOrders(data)
        
        XCTAssert(orders.error! == .Parsing)
    }
}
