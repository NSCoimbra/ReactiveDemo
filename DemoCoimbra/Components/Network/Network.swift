//
//  Network.swift
//  DemoCoimbra
//
//  Created by Rui Peres on 23/09/2015.
//  Copyright © 2015 Aphely. All rights reserved.
//

import Foundation


class Network {
    
    let session : NSURLSession
    
    init(session: NSURLSession = NSURLSession.sharedSession()) {
        
        self.session = session
    }
    
    func makeConnection(request: NSURLRequest, completion: (NSData?, Error?) ->()) {
        
        session.dataTaskWithRequest(request, completionHandler: { (data, _, error) -> () in
            completion(data, error == nil ? nil : .Networking)
        })
    }
}
