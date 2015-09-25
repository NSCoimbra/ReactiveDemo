//
//  Fetcher.swift
//  DemoCoimbra
//
//  Created by Rui Peres on 24/09/2015.
//  Copyright © 2015 Aphely. All rights reserved.
//

import Foundation
import ReactiveCocoa

class OrdersFetcher {
    
    typealias Parse = NSData -> SignalProducer<[Order], Error>
    
    let network : Network
    let parse : Parse
    let persistenceFilePath : String
    
    init(network: Network = Network(), parse: Parse, persistenceFilePath: String) {
        
        self.network = network
        self.parse = parse
        self.persistenceFilePath = persistenceFilePath
    }
    
    func fetchOrders(request: NSURLRequest) -> SignalProducer<[Order], Error> {
        
        let isOlderThan5  = flip(curry(isDate))(5)
        let writeData = curry(writeDataToFile)(self.persistenceFilePath)
        
        return fileCreationDate(self.persistenceFilePath)
            .flatMapLatest(isOlderThan5)
            .flatMapLatest{ _ in readDataFromFile(self.persistenceFilePath) }
            .flatMapLatest(self.parse)
            .flatMapError { _ in
                self.network.makeConnection(request)
                .retry(1)
                .flatMapLatest(writeData)
                .flatMapLatest(self.parse)
        }
    }
    
//    func fetchOrders(request: NSURLRequest, completion: ([Order]?, Error?) -> ()) {
//        
//        // 1 -> Check if we got something in cache and it's not older than 5 minutes
//        // 2 ---> If it's not older:
//        //  2.1 -----> Retrieve the data
//        //  2.2 -----> Parse it
//        //  2.3 -----> Call completion
//        // 3 ---> if it's older:
//        //  3.1 -----> Make internet connection
//        //  3.2 --------> If it fails, try to make new connection (go to 3.1)
//        //  3.3 --------> If it fails a second time try to retrieve anything from the cache (go to step 2.1)
//        //   3.3.1 ----------> If there isn't anything in cache, complete with error
//        //  3.4 --------> If it doesn't fail:
//        //   3.4.1 ----------> Persist the data
//        //   3.4.2 ----------> Parse it
//        //   3.4.3 ----------> Call completion
//        
//        let readFileCompletion : (NSData?, Error?) ->() = {_data, _error in
//        
//            if let data = _data { // 2.2
//                self.parse(data, completion) // 2.2 & 2.3
//            }
//            else {
//                completion(nil, _error)
//            }
//        }
//        
//        fileCreationDate(self.persistenceFilePath, completion: { _date, _error in
//            
//            if let date = _date where isDateLaterThan(date, laterThan: 5) == false { // 1
//                
//                readDataFromFile(self.persistenceFilePath, completion: readFileCompletion) // 2
//            }
//            else { // 3
//                self.network.makeConnection(request, numberOfRetries: 1, completion: {_data, _error in // 3.1 & 3.2
//                    
//                    if let data = _data { // 3.4
//                        writeDataToFile(self.persistenceFilePath, data: data, completion: {_error in}) // 3.4.1
//                        self.parse(data, completion) // 3.4.2 & 3.4.3
//                    }
//                    else { // 3.3
//                        readDataFromFile(self.persistenceFilePath, completion: readFileCompletion) // 2
//                    }
//                })
//            }
//        })
//    }
}


