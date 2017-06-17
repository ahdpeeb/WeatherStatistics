//
//  String + extension.swift
//  DigitalBank
//
//  Created by Nikola Andriiev on 3/3/17.
//  Copyright © 2017 iosDeveloper. All rights reserved.
//

import Foundation

extension String {
    public func index(of char: Character) -> Int? {
        guard let idx = characters.index(of: char) else { return nil }
        
        return characters.distance(from: startIndex, to: idx)
    }
    
    func nullifyIfEmpty() -> String? {
        return self.isEmpty ? nil : self
    }
    
    func removeLastChar() -> String {
        return self.substring(to: self.index(before: self.endIndex))
    }
    
    func removeFirstChar() -> String {
        var string = self
        return String(string.remove(at: string.startIndex))
    }
    
    func nsRange(from range: Range<String.Index>) -> NSRange {
        let from = range.lowerBound.samePosition(in: utf16)
        let to = range.upperBound.samePosition(in: utf16)
        return NSRange(location: utf16.distance(from: utf16.startIndex, to: from),
                       length: utf16.distance(from: from, to: to))
    }

    func range(from nsRange: NSRange) -> Range<String.Index>? {
        guard
            let from16 = utf16.index(utf16.startIndex, offsetBy: nsRange.location, limitedBy: utf16.endIndex),
            let to16 = utf16.index(utf16.startIndex, offsetBy: nsRange.location + nsRange.length, limitedBy: utf16.endIndex),
            let from = from16.samePosition(in: self),
            let to = to16.samePosition(in: self)
            else { return nil }
        return from ..< to
    }
    
    func inserting(separator: String, every n: Int) -> String {
        var result: String = ""
        let characters = Array(self.characters)
        stride(from: 0, to: characters.count, by: n).forEach {
            result += String(characters[$0..<min($0+n, characters.count)])
            if $0+n < characters.count {
                result += separator
            }
        }
        return result
    }
}

