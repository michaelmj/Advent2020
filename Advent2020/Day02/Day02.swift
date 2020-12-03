//
//  Day02.swift
//  Advent2020
//
//  Created by Michael Malinak on 12/1/20.
//

import Foundation

infix operator ^^
extension Bool {
    static func ^^(lhs:Bool, rhs:Bool) -> Bool {
        if (lhs && !rhs) || (!lhs && rhs) {
            return true
        }
        return false
    }
}

extension String {
    func split(usingRegex pattern: String) -> [String] {
        //### Crashes when you pass invalid `pattern`
        let regex = try! NSRegularExpression(pattern: pattern)
        let matches = regex.matches(in: self, range: NSRange(0..<utf16.count))
        let ranges = [startIndex..<startIndex] + matches.map{Range($0.range, in: self)!} + [endIndex..<endIndex]
        return (0...matches.count).map {String(self[ranges[$0].upperBound..<ranges[$0+1].lowerBound])}
    }
}

extension String {
    func count(of needle: Character) -> Int {
        return reduce(0) {
            $1 == needle ? $0 + 1 : $0
        }
    }
}

struct Day02 {

   struct PasswordReq {
      let min: Int
      let max: Int
      let char: Character
      let password: String
   }

   static func parseTheData( _ data: String ) -> [PasswordReq] {
      let lines = data.components(separatedBy: "\n").compactMap() { $0 }

      let stuff = lines.compactMap() { $0.components(separatedBy: " ").compactMap {   $0.trimmingCharacters(in: CharacterSet.alphanumerics.inverted) } }

      let allThings:[PasswordReq] = stuff.map(){
         let range = $0[0].components(separatedBy: "-")
         return ( PasswordReq(min: Int(range[0])!,
                              max: Int(range[1])!,
                              char: Character($0[1]),
                              password: $0[2]) )
      }

      return allThings
   }


   static func partA(_ data: String ) -> Int {

      let allThings = parseTheData(data)

      let matching = allThings.filter() {
         let count = $0.password.count(of: $0.char )
         return ( count <= $0.max && count >= $0.min )
      }.count

      return matching
   }

   static func partB(_ data: String ) -> Int {
      let allThings = parseTheData(data)

      let matching = allThings.filter() {
         let pass = $0.password
         let yesIndex = pass.index(pass.startIndex, offsetBy: ($0.min - 1))
         let noIndex = pass.index(pass.startIndex, offsetBy: ($0.max - 1))
         return ( (pass[yesIndex] == $0.char) ^^ (pass[noIndex] == $0.char) )
      }.count

      return matching
   }
}
