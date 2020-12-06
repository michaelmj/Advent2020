//
//  Day06.swift
//  Advent2020
//
//  Created by Michael Malinak on 12/5/20.
//

import Foundation

struct Day06 : Day {
   func partA(_ data: String) -> Int {
      let answerSets = data.components(separatedBy: "\n\n").compactMap {
         Set($0.filter {$0.isLetter})
      }

      let count = answerSets.reduce(0) {$0+$1.count}

      return count
   }

   func partB(_ data: String) -> Int {
      let answers = data.components(separatedBy: "\n\n").compactMap {
         $0.components(separatedBy: "\n").compactMap { Set($0.filter {$0.isLetter}) }
      }

      let intersect = answers.compactMap {
         $0.reduce(into: $0[0], { (theSet, chars) in theSet = theSet.intersection(chars) })
      }

      let count = intersect.reduce(0) {$0+$1.count}
      return count
   }

}
