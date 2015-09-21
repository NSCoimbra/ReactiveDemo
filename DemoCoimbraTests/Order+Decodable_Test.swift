//
//  Order+Decodable_Test.swift
//  DemoCoimbra
//
//  Created by Rui Peres on 21/09/2015.
//  Copyright © 2015 Aphely. All rights reserved.
//

import XCTest
@testable import DemoCoimbra
import Decodable

class Order_Decodable_Test: XCTestCase {
    
    func test_validData() {
        
        let data = readFile("ValidJSON")
        let orders = parseOrders(data)
        
        XCTAssert(orders!.count == 6)
    }
    
    func test_invalidData() {
        
        let data = readFile("InvalidJSON")
        let orders = parseOrders(data)
        
        XCTAssert(orders == nil)
    }
}
