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
        
        writeDataToFile(fileLocation, data: data, completion: {error in
            
            readDataFromFile(fileLocation, completion: { (readData, _) in
                
                XCTAssertEqual(data.length, readData!.length)
            })
        })
    }
    
    func test_Writting_Existence() {
        
        let fileLocation = appendRelativePathToRoot(fileName)
        let data = readFile("ValidJSON")
        
        writeDataToFile(fileLocation, data: data, completion: {error in
            
            doesFileExists(fileLocation, completion: { doesFileExist in
                
                XCTAssertTrue(doesFileExist)
            })
        })
    }
    
    func test_Writting_Date() {
        
        let fileLocation = appendRelativePathToRoot(fileName)
        let data = readFile("ValidJSON")
        
        writeDataToFile(fileLocation, data: data, completion: {_ in
            
            fileCreationDate(fileLocation, completion: {date, _ in
                
                let isLaterThan6Seconds = dateLaterThan(date!, minutes: 0.1)
                XCTAssertFalse(isLaterThan6Seconds)
            })
        })
        

    }
}
