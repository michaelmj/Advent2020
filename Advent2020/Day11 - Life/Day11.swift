//
//  Day11.swift
//  Advent2020
//
//  Created by Michael Malinak on 12/11/20.
//

import Foundation

struct Point {
   let x:Int
   let y:Int
}

enum Direction: CaseIterable {
   case NW,N,NE,E,SE,S,SW,W
}

extension Direction {
   var offset: Point {
      switch self {
      case .NW: return Point(x: -1, y: 1)
      case .N: return Point(x: 0, y: 1)
      case .NE: return Point(x: 1, y: 1)
      case .E: return Point(x: 1, y: 0)
      case .SE: return Point(x: 1, y: -1)
      case .S: return Point(x: 0, y: -1)
      case .SW: return Point(x: -1, y: -1)
      case .W: return Point(x: -1, y: 0)
      }
   }

   var x:Int {
      return self.offset.x
   }

   var y:Int {
      return self.offset.y
   }
}

struct Day11  {
   func partA(_ data: String) -> Int {
      var seatMap : [[Character]] = data.components(separatedBy: "\n").compactMap { Array($0) }
      var nextMap = seatMap
      let width = seatMap[0].count
      let height = seatMap.count

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

   func buildSeatLookup(seatMap: [[Character]]) -> [[[Point]]] {
      let width = seatMap[0].count
      let height = seatMap.count
      let maxDir = max(width, height)
      var seatLookup = Array( repeating: Array( repeating: Array<Point>(), count: width), count: height )

      for y in (0..<height) {
         for x in (0..<width) {
            guard (seatMap[y][x] != ".") else {
               continue
            }

            dirCheck: for dir in Direction.allCases {
               for multipler in (1..<maxDir) {
                  let xDiff = dir.x * multipler
                  let yDiff = dir.y * multipler

                  guard ( ((xDiff + x) >= 0) && ((xDiff + x) < width) &&
                           ((yDiff + y) >= 0) && ((yDiff + y) < height ) ) else {
                     continue dirCheck
                  }

                  if (seatMap[y+yDiff][x+xDiff] == "L" ) {
                     seatLookup[y][x].append(Point(x: x+xDiff, y: y+yDiff))
                     continue dirCheck
                  }
               }
            }
         }
      }

      return seatLookup
   }

   func partB(_ data: String) -> Int {
      var seatMap : [[Character]] = data.components(separatedBy: "\n").compactMap { Array($0) }
      let seatLookup = buildSeatLookup(seatMap: seatMap)

      var nextMap = seatMap
      let width = seatMap[0].count
      let height = seatMap.count

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
               for point in seatLookup[y][x] {
                  if ( seatMap[point.y][point.x] == "#" ) { neighbors += 1 }
               }

               if ( seatMap[y][x] == "L" && neighbors == 0 ) {
                  nextMap[y][x] = "#"
               } else if ( seatMap[y][x] == "#" && neighbors >= 5 ) {
                  nextMap[y][x] = "L"
               } else {
                  nextMap[y][x] = seatMap[y][x]
               }

               if ( seatMap[y][x] != nextMap[y][x] ) { hasChange = true}
               if nextMap[y][x] == "#" { seatedPeople += 1 }
            }
         }
         seatMap = nextMap
         print ("---- Step ----")
         seatMap.forEach { $0.forEach { print($0, terminator:"") }; print("") }

      } while ( hasChange )


      seatMap.forEach { $0.forEach { print($0, terminator:"") }; print("") }


      return seatedPeople
   }
}
