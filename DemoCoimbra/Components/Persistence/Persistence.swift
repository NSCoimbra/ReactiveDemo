//
//  Persistence.swift
//  DemoCoimbra
//
//  Created by Rui Peres on 22/09/2015.
//  Copyright © 2015 Aphely. All rights reserved.
//

import Foundation
import ReactiveCocoa

func writeDataToFile(fullPath: String, data: NSData) -> SignalProducer<NSData, Error>  {
    return SignalProducer {s, d in
        
        writeDataToFile(fullPath, data: data, completion: { _error in
            
            if let error = _error {
                sendError(s, error)
            }
            else  {
                sendNext(s, data)
                sendCompleted(s)
            }
        })
    }
}

func readDataFromFile(fullPath: String) -> SignalProducer<NSData, Error>  {
    
    return SignalProducer {s, d in
        
        readDataFromFile(fullPath, completion: { _data, _error in
            
            if let error = _error {
                sendError(s, error)
            }
            else if let data = _data {
                sendNext(s, data)
                sendCompleted(s)
            }
        })
    }
}


func fileCreationDate(fullPath: String) -> SignalProducer<NSDate, Error> {
    return SignalProducer {s, d in
        fileCreationDate(fullPath, completion: { _date, _error in
            if let error = _error {
                sendError(s, error)
            }
            else if let date = _date {
                sendNext(s, date)
                sendCompleted(s)
            }
        })
    }
}

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

func appendRelativePathToRoot(relativePath: String, rootPath: String = documentsRootPath) -> String {
    return (rootPath as NSString).stringByAppendingPathComponent(relativePath)
}

let documentsRootPath : String = {
    return NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
    }()
