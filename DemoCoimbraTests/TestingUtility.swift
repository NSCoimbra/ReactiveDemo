//
//  TestingUtility.swift
//  DemoCoimbra
//
//  Created by Rui Peres on 21/09/2015.
//  Copyright © 2015 Aphely. All rights reserved.
//

import Foundation
@testable import DemoCoimbra

func readFile(file: String) -> NSData {
    let path = NSBundle(forClass: JSONFileReader.self).pathForResource(file, ofType: "json")
    return NSData(contentsOfFile: path!)!
}

func removeTestFile(testFileName : String) {
    let fileManager = NSFileManager()
    let path = (documentsRootPath as NSString).stringByAppendingPathComponent(testFileName)
    
    if (fileManager.fileExistsAtPath(path)) {
        try! fileManager.removeItemAtPath(path)
    }
}

func doesFileExists(fullPath: String) -> Bool   {
    
    return NSFileManager().fileExistsAtPath(fullPath)
}

private class JSONFileReader { }
