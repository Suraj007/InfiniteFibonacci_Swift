//
//  FibNumberModel.swift
//  FibonacciSeries
//
//  Created by Suraj Singh on 21/11/18.
//  Copyright © 2018 iOS Technologies. All rights reserved.
//

import UIKit
import BigInt

class FibNumberModel: NSObject {

    let data : BigUInt?
    
    init(number: BigUInt)
    {
       self.data = number
    }
    func stringValue() -> String
    {
        let str = String(self.data!)
        return str
    }
}
