//
//  Day09.swift
//  Advent2020
//
//  Created by Michael Malinak on 12/8/20.
//

import Foundation

struct Day09 {
   
   func partA(_ data: String, size: Int) -> Int {
      let numbers = parseNumbers(data)

      for testIdx in (size..<numbers.count) {
         let check = numbers[testIdx]
         let lowIdx = testIdx - size
         var found = false

         outerLoop: for x in (0..<(size-1)) {
            for y in (x..<size) {
               if (numbers[lowIdx+x]+numbers[lowIdx+y] == check) {
                  found = true
                  break outerLoop
               }
            }
         }

         if (!found) {
            return check
         }
      }
      return 0
   }


   func partB(_ data: String, size: Int) -> Int {
      let numbers = parseNumbers(data)
      let searchSum = partA(data, size: size)


      for x in (0..<numbers.count) {
         for y in (x..<numbers.count) {
            let check = numbers[x...y].reduce(0,+)
            if (check == searchSum) {
               let range = numbers[x...y]
               return range.min()! + range.max()!
            }
            if (check > searchSum) {break}
         }
      }

      return 0
   }

   func parseNumbers(_ data: String) -> [Int] {
      return data.components(separatedBy: "\n").compactMap { Int($0)}
   }

   
}
