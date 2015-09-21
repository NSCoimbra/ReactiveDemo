//
//  Persistence_Test.swift
//  DemoCoimbra
//
//  Created by Rui Peres on 22/09/2015.
//  Copyright © 2015 Aphely. All rights reserved.
//

import XCTest
@testable import DemoCoimbra

class Persistence_Test: XCTestCase {
    
    let fileName = "Test"
    
    override func setUp() {
        removeTestFile(fileName)
    }

    func test_Writting_Reading() {
     
        let fileLocation = appendRelativePathToRoot(fileName)
        let data = readFile("ValidJSON")
        writeDataToFile(fileLocation, data: data)
        
        let readData = readDataFromFile(fileLocation)
        
        XCTAssertNotNil(readData)
        XCTAssertEqual(data.length, readData?.length)
    }
    
    func test_Writting_Existence() {
        
        let fileLocation = appendRelativePathToRoot(fileName)
        let data = readFile("ValidJSON")
        writeDataToFile(fileLocation, data: data)
        
        let doesFileExist = doesFileExists(fileLocation)
        
        XCTAssertTrue(doesFileExist)
    }
    
    func test_Writting_Date() {
        
        let fileLocation = appendRelativePathToRoot(fileName)
        let data = readFile("ValidJSON")
        writeDataToFile(fileLocation, data: data)

        let date = fileCreationDate(fileLocation)
        let isLaterThan6Seconds = dateLaterThan(date!, minutes: 0.1)
        
        XCTAssertFalse(isLaterThan6Seconds)
    }
}
