//
//  Day10.swift
//  Advent2020
//
//  Created by Michael Malinak on 12/9/20.
//

import Foundation

struct Day10  {
   func partA(_ data: String) -> Int {
      let numbers = data.components(separatedBy: "\n").compactMap {Int($0)}.sorted()

      var count1 = 0
      var count3 = 1

      for x in 0..<(numbers.count - 1) {
         if ( numbers[x+1] - numbers[x] == 3){
            count3 += 1
         } else {
            count1 += 1
         }
      }

      return count1 * count3
   }

   func recurse(numbers:[Int], tried: inout [Int:Int], tryJolt: Int) -> Int {
      if let alreadyFound = tried[tryJolt] { return alreadyFound }

      print("try: \(tryJolt)")

      if ( tryJolt == numbers.last! ) { return 1 }

      guard ( numbers.contains(tryJolt) ) else { return 0 }

      tried[tryJolt] =
         recurse(numbers: numbers, tried: &tried, tryJolt: tryJolt + 3) +
         recurse(numbers: numbers, tried: &tried, tryJolt: tryJolt + 2) +
         recurse(numbers: numbers, tried: &tried, tryJolt: tryJolt + 1)

      return tried[tryJolt]!
   }

   func partB(_ data: String) -> Int {
      var tried = [Int: Int]()

      // modified data to have starting 0
      var numbers = data.components(separatedBy: "\n").compactMap {Int($0)}.sorted()
      numbers.append(numbers.last! + 3)

      return recurse(numbers: numbers, tried: &tried, tryJolt: numbers.first!)
   }
}
