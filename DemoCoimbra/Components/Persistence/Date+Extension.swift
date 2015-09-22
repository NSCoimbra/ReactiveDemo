//
//  Date+Extension.swift
//  DemoCoimbra
//
//  Created by Rui Peres on 22/09/2015.
//  Copyright © 2015 Aphely. All rights reserved.
//

import Foundation

func dateLaterThan(date : NSDate, minutes: NSTimeInterval) -> Bool {
    let minutesInSeconds = minutes * 60
    if abs(date.timeIntervalSinceNow) > minutesInSeconds {
        return true
    }
    
    return false
}
