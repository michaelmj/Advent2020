//
//  Day03.swift
//  Advent2020
//
//  Created by Michael Malinak on 12/3/20.
//

import Foundation

struct Day03 {

   struct Change {
      let x: Int
      let y: Int
   }

   static func arrayFromString(_ dataString: String) -> [[Int]] {
      let lines = dataString.components(separatedBy: "\n").compactMap() { $0 }
      let arrays = lines.map() { $0.map() { return (($0 == "#") ? 1 : 0) } }
      return arrays
   }

   static func traverseHill( hillMap: [[Int]], change: Change) -> Int {
      let hillWidth = hillMap[0].count
      let hillHeight = hillMap.count

      var treesHit = 0
      for step in 0...((hillHeight - 1) / change.y) {
         treesHit += hillMap[step * change.y][(step * change.x) % hillWidth]
      }

      return treesHit
   }

   static func partA(_ data: String ) -> Int {
      let hillMap = arrayFromString(data)

      let change = Change(x: 3, y: 1)

      return traverseHill(hillMap: hillMap, change: change)
   }

   static func partB(_ data: String ) -> Int {
      let hillMap = arrayFromString(data)

      let changes = [ Change(x: 1, y: 1),
                      Change(x: 3, y: 1),
                      Change(x: 5, y: 1),
                      Change(x: 7, y: 1),
                      Change(x: 1, y: 2)]

      let totalHits = changes.reduce(1) { (product, change) -> Int in
         product * traverseHill(hillMap: hillMap, change: change)
      }

      return totalHits
   }
}
