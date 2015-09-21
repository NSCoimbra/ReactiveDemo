//
//  Persistence.swift
//  DemoCoimbra
//
//  Created by Rui Peres on 22/09/2015.
//  Copyright © 2015 Aphely. All rights reserved.
//

import Foundation

func writeDataToFile(fullPath: String, data: NSData) -> NSData? {
    
    do {
        try data.writeToFile(fullPath, options: [.DataWritingAtomic])
        return data
    }
    catch {
        return nil
    }
}

func readDataFromFile(fullPath: String) -> NSData? {
    
    do {
        return try NSData(contentsOfFile: fullPath, options: [.DataReadingUncached])
    }
    catch {
        return nil
    }
}

func doesFileExists(fullPath: String) -> Bool  {
    
    return NSFileManager().fileExistsAtPath(fullPath)
}

func fileCreationDate(fullPath: String) -> NSDate? {
    
    do {
        
        let attributes = try NSFileManager.defaultManager().attributesOfItemAtPath(fullPath)
        if let creationDate = attributes[NSFileCreationDate] as? NSDate {
            return creationDate
        }
        else {
            return nil
        }
    }
    catch {
        return nil
    }
}


func appendRelativePathToRoot(relativePath: String, rootPath: String = documentsRootPath) -> String {
    return (rootPath as NSString).stringByAppendingPathComponent(relativePath)
}

let documentsRootPath : String = {
    return NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
    }()
