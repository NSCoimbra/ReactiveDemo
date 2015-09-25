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

func isDateLaterThan(date: NSDate, laterThan minutes: NSTimeInterval) -> SignalProducer<Bool, NoError> {
    return SignalProducer {s , d in
        let laterThan : Bool = isDateLaterThan(date, laterThan: minutes)
        
        sendNext(s, laterThan)
        sendCompleted(s)
    }
}
