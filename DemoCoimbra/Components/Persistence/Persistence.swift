//
//  Persistence.swift
//  DemoCoimbra
//
//  Created by Rui Peres on 22/09/2015.
//  Copyright © 2015 Aphely. All rights reserved.
//

import Foundation

func writeDataToFile(fullPath: String, data: NSData, completion: (Error?) -> ()) {
    
    if let _ = try? data.writeToFile(fullPath, options: [.DataWritingAtomic]) {
        completion(nil)
    }
    else {
        return completion(.Persistence)
    }
}

func readDataFromFile(fullPath: String, completion: (NSData?, Error?) -> ())  {
    
    if let data = try? NSData(contentsOfFile: fullPath, options: [.DataReadingUncached]) {
        completion(data, nil)
    }
    else {
        return completion(nil, .Persistence)
    }
}

func doesFileExists(fullPath: String, completion: Bool -> ())  {
    
    return completion(NSFileManager().fileExistsAtPath(fullPath))
}

func fileCreationDate(fullPath: String, completion: (NSDate?, Error?) -> ()) {
    
    if let attributes = try? NSFileManager.defaultManager().attributesOfItemAtPath(fullPath),
        let creationDate = attributes[NSFileCreationDate] as? NSDate {
            
            return completion(creationDate, nil)
    }
    else {
        return completion(nil, .Persistence)
    }
}


func appendRelativePathToRoot(relativePath: String, rootPath: String = documentsRootPath) -> String {
    return (rootPath as NSString).stringByAppendingPathComponent(relativePath)
}

let documentsRootPath : String = {
    return NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
    }()
