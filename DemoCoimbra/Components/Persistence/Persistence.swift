//
//  Persistence.swift
//  DemoCoimbra
//
//  Created by Rui Peres on 22/09/2015.
//  Copyright © 2015 Aphely. All rights reserved.
//

import Foundation
import Result

func writeDataToFile(fullPath: String, data: NSData) -> Result<NSData, Error> {
    
    do {
        try data.writeToFile(fullPath, options: [.DataWritingAtomic])
        return Result(value: data)
    }
    catch {
        return Result(error: .Persistence)
    }
}

func readDataFromFile(fullPath: String) -> Result<NSData, Error> {
    
    do {
        let data =  try NSData(contentsOfFile: fullPath, options: [.DataReadingUncached])
        return Result(value: data)
    }
    catch {
        return Result(error: .Persistence)
    }
}

func doesFileExists(fullPath: String) -> Result<Bool, Error>  {
    
    return Result(value: NSFileManager().fileExistsAtPath(fullPath))
}

func fileCreationDate(fullPath: String) -> Result<NSDate, Error> {
    
    do {
        
        let attributes = try NSFileManager.defaultManager().attributesOfItemAtPath(fullPath)
        if let creationDate = attributes[NSFileCreationDate] as? NSDate {
            return Result(value: creationDate)
        }
        else {
            return Result(error: .Persistence)
        }
    }
    catch {
        return Result(error: .Persistence)
    }
}


func appendRelativePathToRoot(relativePath: String, rootPath: String = documentsRootPath) -> String {
    return (rootPath as NSString).stringByAppendingPathComponent(relativePath)
}

let documentsRootPath : String = {
    return NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
    }()
