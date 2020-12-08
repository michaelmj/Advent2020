//
//  StringExtensions.swift
//  Advent2020
//
//  Created by Michael Malinak on 12/7/20.
//

import Foundation

public extension String {
    func split(usingRegex pattern: String) -> [String] {
        //### Crashes when you pass invalid `pattern`
      let regex = try! NSRegularExpression(pattern: pattern, options:[])
        let matches = regex.matches(in: self, range: NSRange(0..<utf16.count))
        let ranges = [startIndex..<startIndex] + matches.map{Range($0.range, in: self)!} + [endIndex..<endIndex]
        return (0...matches.count).map {String(self[ranges[$0].upperBound..<ranges[$0+1].lowerBound])}
    }
}

public extension String {
    func count(of needle: Character) -> Int {
        return reduce(0) {
            $1 == needle ? $0 + 1 : $0
        }
    }
}
