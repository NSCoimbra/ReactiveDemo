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
        parseOrders(data, completion: {(orders, _) in
            XCTAssert(orders!.count == 6)
        })
    }
    
    func test_invalidData() {
        
        let data = readFile("InvalidJSON")
        parseOrders(data, completion: {(_, error) in
            XCTAssert(error! == .Parsing)
        })
    }
}
