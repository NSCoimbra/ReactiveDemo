//
//  TestingUtility.swift
//  DemoCoimbra
//
//  Created by Rui Peres on 21/09/2015.
//  Copyright © 2015 Aphely. All rights reserved.
//

import Foundation

func readFile(file: String) -> NSData {
    let path = NSBundle(forClass: JSONFileReader.self).pathForResource(file, ofType: "json")
    return NSData(contentsOfFile: path!)!
}

private class JSONFileReader { }