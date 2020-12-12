//
//  Day11.swift
//  Advent2020
//
//  Created by Michael Malinak on 12/11/20.
//

import Foundation



struct Day11  {
   func partA(_ data: String) -> Int {
      var seatMap : [[Character]] = data.components(separatedBy: "\n").compactMap { Array($0) }
      var nextMap = seatMap
      let width = seatMap[0].count
      let height = seatMap.count

      //var nextMap = Array( repeating: Array(repeating: ".", count: width), count: height )

      var hasChange = false

      var seatedPeople = 0


      repeat {
         hasChange = false
         seatedPeople = 0

         for y in (0..<height) {
            for x in (0..<width) {
               guard (seatMap[y][x] != ".") else {
                  continue
               }

               var neighbors = 0
                  for yDiff in (-1...1) {
                     for xDiff in (-1...1) {
                     if ( !((xDiff == 0) && (yDiff == 0)) &&
                           ((xDiff + x) >= 0) && ((xDiff + x) < width) &&
                           ((yDiff + y) >= 0) && ((yDiff + y) < height )) {
                        if ( seatMap[y+yDiff][x+xDiff] == "#" ) { neighbors += 1 }
                     }
                  }
               }

               if ( seatMap[y][x] == "L" && neighbors == 0 ) {
                  nextMap[y][x] = "#"
               } else if ( seatMap[y][x] == "#" && neighbors >= 4 ) {
                  nextMap[y][x] = "L"
               } else {
                  nextMap[y][x] = seatMap[y][x]
               }

               if ( seatMap[y][x] != nextMap[y][x] ) { hasChange = true}
               if nextMap[y][x] == "#" { seatedPeople += 1 }
            }
         }
         seatMap = nextMap
      } while ( hasChange )


      seatMap.forEach { $0.forEach { print($0, terminator:"") }; print("") }


      return seatedPeople
   }



   func partB(_ data: String) -> Int {
      return 0
   }
}
