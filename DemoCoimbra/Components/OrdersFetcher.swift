//
//  Fetcher.swift
//  DemoCoimbra
//
//  Created by Rui Peres on 24/09/2015.
//  Copyright © 2015 Aphely. All rights reserved.
//

import Foundation

class OrdersFetcher {
    
    let network : Network
    let parser : ParseOrders
    let persistenceFilePath : String
    
    init(network: Network = Network(), parser: ParseOrders = parseOrders, persistenceFilePath: String) {
        
        self.network = network
        self.parser = parser
        self.persistenceFilePath = persistenceFilePath
    }
    
    func fetchOrders(request: NSURLRequest, completion: ([Order]?, Error?) -> ()) {
        
        // 1 -> Check if we got something in cache and it's not older than 5 minutes
        // 2 ---> If it's not older:
        //  2.1 -----> Retrieve the data
        //  2.2 -----> Parse it
        //  2.3 -----> Call completion
        // 3 ---> if it's older:
        //  3.1 -----> Make internet connection
        //  3.2 --------> If it fails, try to make new connection (go to 3.1)
        //  3.3 --------> If it fails a second time try to retrieve anything from the cache (go to step 2.1)
        //   3.3.1 ----------> If there isn't anything in cache, complete with error
        //  3.4 --------> If it doesn't fail:
        //   3.4.1 ----------> Persist the data
        //   3.4.2 ----------> Parse it
        //   3.4.3 ----------> Call completion
        
        fileCreationDate(self.persistenceFilePath, completion: { _date, _error in
            
            if let date = _date where isDateLaterThan(date, minutes: 5) == false { // 1
                
                readDataFromFile(self.persistenceFilePath, completion: { _data, _error in // 2
                    
                    if let data = _data { // 2.2
                        self.parser(data, completion) // 2.2 & 2.3
                    }
                    else {
                        completion(nil, _error)
                    }
                })
            }
            else { // 3
                self.network.makeConnection(request, numberOfRetries: 1, completion: {_data, _error in // 3.1 & 3.2
                    
                    if let data = _data { // 3.4
                        writeDataToFile(self.persistenceFilePath, data: data, completion: {_error in}) // 3.4.1
                        self.parser(data, completion) // 3.4.2 & 3.4.3
                    }
                    else { // 3.3
                        readDataFromFile(self.persistenceFilePath, completion: { _data, _error in // 2
                            
                            if let data = _data { // 2.2
                                self.parser(data, completion) // 2.2 & 2.3
                            }
                            else {
                                completion(nil, _error)
                            }
                        })
                    }
                })
            }
        })
    }
}


