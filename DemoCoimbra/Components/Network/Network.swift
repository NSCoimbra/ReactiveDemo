//
//  Network.swift
//  DemoCoimbra
//
//  Created by Rui Peres on 23/09/2015.
//  Copyright © 2015 Aphely. All rights reserved.
//

import Foundation
import ReactiveCocoa

private let validStatusCode : Int -> Bool = { $0 >= 200 && $0 < 400 }

class Network {
    
    let session : NSURLSession
    
    init(session: NSURLSession = NSURLSession.sharedSession()) {
        
        self.session = session
    }
    
    func makeConnection(request: NSURLRequest) -> SignalProducer<NSData, Error> {
        
        return SignalProducer {s, d in
        
            self.makeConnection(request, completion: { _data, _error -> () in
                
                if let data = _data {
                    sendNext(s, data)
                    sendCompleted(s)
                }
                else if let error = _error  {
                    sendError(s, error)
                }
            })
        }
    }
    
    func makeConnection(request: NSURLRequest, numberOfRetries: Int, completion: (NSData?, Error?) ->()) {
        
        if (numberOfRetries < 0) {
            completion(nil, .Networking)
        }
        else {
            
            makeConnection(request, completion: { _data, _error in
                
                if let data = _data {
                    
                    completion(data, nil)
                }
                else {
                    self.makeConnection(request, numberOfRetries: numberOfRetries - 1, completion: completion)
                }
            })
        }
    }
    
    func makeConnection(request: NSURLRequest, completion: (NSData?, Error?) ->()) {
        
        session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> () in
            
            var statusCode = 0
            if let response = response as? NSHTTPURLResponse {
                statusCode = response.statusCode
            }
            
            if !validStatusCode(statusCode) || error != nil {
                completion(nil, .Networking)
                return
            }
            else if let data = data, _ = response {
                completion(data, nil)
            } else {
                completion(nil, .Networking)
            }
            
        }).resume()
    }
}
