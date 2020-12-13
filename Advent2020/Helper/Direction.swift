//
//  Direction.swift
//  Advent2020
//
//  Created by Michael Malinak on 12/12/20.
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
