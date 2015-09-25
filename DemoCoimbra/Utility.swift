//
//  Utility.swift
//  DemoCoimbra
//
//  Created by Rui Peres on 25/09/2015.
//  Copyright © 2015 Aphely. All rights reserved.
//

import Foundation

func curry<T, U, V>(f: (T, U) -> V) -> T -> U -> V {
    return { t in { u in f(t, u) } }
}


func flip <T,U,V>(f: T -> U -> V) -> U -> T -> V {
    return {a in { b in f(b)(a) } }
}
