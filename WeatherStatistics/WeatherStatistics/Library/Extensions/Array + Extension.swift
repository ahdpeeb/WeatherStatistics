//
//  Array + Extension.swift
//  DigitalBank
//
//  Created by Nikola Andriiev on 1/31/17.
//  Copyright © 2017 iosDeveloper. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    // Remove first collection element that is equal to the given `object`:
    mutating func remove(object: Element) {
        if let index = index(of: object) {
            remove(at: index)
        }
    }
    
    
}

extension Array {
    func splitedBy(_ chunkSize: Int) -> [[Element]] {
        return stride(from: 0, to: self.count, by: chunkSize).map({ (startIndex) -> [Element] in
            let endIndex = (startIndex.advanced(by: chunkSize) > self.count) ? self.count-startIndex : chunkSize
            return Array(self[startIndex..<startIndex.advanced(by: endIndex)])
        })
    }
    
    mutating func move(from formIndex: Int, to toIndex: Int) {
        insert(remove(at: formIndex), at: toIndex)
    }
    
    public func indexOfObject<T: Equatable>(array: [T], object: T) -> Int?  {
        for t in array {
            if t == object {
                return array.index(of: t)
            } else {
                continue
            }
        }
        
        return nil
    }
    
    func randomItem() -> Element {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}

