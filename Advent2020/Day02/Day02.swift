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
