//
//  FIbonacciGenerator.swift
//  FibonacciSeries
//
//  Created by Suraj Singh (623-Extern) on 21/11/18.
//  Copyright © 2018 iOS Technologies. All rights reserved.
//

import Foundation
import BigInt

protocol fibonacciGeneratorProtocol: class {
    func fibonacciGeneratedList(list:[FibNumberModel])
}
class FibonacciSeriesCreator: NSObject {
    let PRELOAD_THRESHOLD = 50
    let PAGED_SET_THRESHOLD = 50
    var currentOffset = 0
    var fullList : [FibNumberModel] = []
    var lastPagedList : [FibNumberModel] = []
    let serialQueue = DispatchQueue(label: "serial")
    
    weak var delegate : fibonacciGeneratorProtocol?

    func generateFibonacciWithOffset(offset: NSInteger)  {
        serialQueue.async {
            var startIndex = 0
            var lastIndex = self.PRELOAD_THRESHOLD
            var list :[FibNumberModel] = []
            var a : BigUInt
            var b : BigUInt
            
            if offset != 0
            {
                startIndex = self.currentOffset-1;
                lastIndex = startIndex + self.PAGED_SET_THRESHOLD;
                let penultimateIndex  = self.fullList.count-2;
                let lastBigInteger : BigUInt = (self.fullList.last?.data)!
                let penultimateBigInteger : BigUInt = self.fullList[penultimateIndex].data!
                a = BigUInt(stringLiteral: String(penultimateBigInteger))
                b = BigUInt(stringLiteral: String(lastBigInteger))
            }
            else
            {
                a = BigUInt(stringLiteral: String(0))
                b = BigUInt(stringLiteral: String(1))
                list.append(contentsOf:  [FibNumberModel.init(number: a),FibNumberModel.init(number: b)])
            }
            
            for _ in startIndex...lastIndex {
                let c : BigUInt = a + b
                a = b;
                b = c;
                list.append(FibNumberModel.init(number: b))
            }
            
            self.fullList.append(contentsOf: list)
            self.lastPagedList = list
            self.currentOffset = list.count
            DispatchQueue.main.async {
                self.delegate?.fibonacciGeneratedList(list: self.lastPagedList)
            }
        }
    }
    
    func generateNextPagedSet() {
        objc_sync_enter(self)
        let offset = self.currentOffset
        generateFibonacciWithOffset(offset: offset)
        objc_sync_exit(self)
        
    }
}



