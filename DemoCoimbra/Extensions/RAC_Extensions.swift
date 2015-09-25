//
//  RAC_Extensions.swift
//  DemoCoimbra
//
//  Created by Rui Peres on 25/09/2015.
//  Copyright © 2015 Aphely. All rights reserved.
//

import Foundation
import ReactiveCocoa

extension SignalProducerType {
    
    @warn_unused_result(message="Did you forget to call `start` on the producer?")
    public func flatMap<U>(strategy: FlattenStrategy, transform: T -> SignalProducer<U, E>) -> SignalProducer<U, E> {
        return map(transform).flatten(strategy)
    }
    
    @warn_unused_result(message="Did you forget to call `start` on the producer?")
    func flatMapLatest<U>(transform: T -> ReactiveCocoa.SignalProducer<U, E>) -> ReactiveCocoa.SignalProducer<U, E> {
        return self.flatMap(.Latest , transform: transform)
    }
}