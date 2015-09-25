//
//  Date+Extension.swift
//  DemoCoimbra
//
//  Created by Rui Peres on 22/09/2015.
//  Copyright © 2015 Aphely. All rights reserved.
//

import Foundation
import ReactiveCocoa

func isDateLaterThan(date : NSDate, laterThan minutes: NSTimeInterval) -> Bool {
    let minutesInSeconds = minutes * 60
    if abs(date.timeIntervalSinceNow) > minutesInSeconds {
        return true
    }
    
    return false
}

func isDate(date: NSDate, laterThan minutes: NSTimeInterval) -> SignalProducer<Bool, Error> {
    return SignalProducer {s , d in
        let laterThan : Bool = isDateLaterThan(date, laterThan: minutes)
        
        if laterThan {
            sendNext(s, true)
            sendCompleted(s)
        }
        else {
            sendError(s, .Persistence)
        }
    }
}

