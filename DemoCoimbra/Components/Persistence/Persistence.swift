//
//  Persistence.swift
//  DemoCoimbra
//
//  Created by Rui Peres on 22/09/2015.
//  Copyright © 2015 Aphely. All rights reserved.
//

import Foundation

func writeDataToFile(fullPath: String, data: NSData, completion: (Error?) -> ()) {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
        
        do {
            try data.writeToFile(fullPath, options: [.DataWritingAtomic])
            completion(nil)
        }
        catch _ {
            completion(.Persistence)
        }
    }
}

func readDataFromFile(fullPath: String, completion: (NSData?, Error?) -> ())  {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
        
        do {
            let data = try NSData(contentsOfFile: fullPath, options: [.DataReadingUncached])
            completion(data, nil)
        }
        catch _ {
            return completion(nil, .Persistence)
        }
    }
}

func fileCreationDate(fullPath: String, completion: (NSDate?, Error?) -> ()) {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
        
        do {
            let attributes = try NSFileManager.defaultManager().attributesOfItemAtPath(fullPath)
            let creationDate = attributes[NSFileCreationDate] as? NSDate
            
            completion(creationDate, nil)
        }
        catch _ {
            completion(nil, .Persistence)
        }
    }
}

func doesFileExists(fullPath: String, completion: Bool -> ())  {
    
    return completion(NSFileManager().fileExistsAtPath(fullPath))
}

func appendRelativePathToRoot(relativePath: String, rootPath: String = documentsRootPath) -> String {
    return (rootPath as NSString).stringByAppendingPathComponent(relativePath)
}

let documentsRootPath : String = {
    return NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
    }()
