//
//  Day12.swift
//  Advent2020
//
//  Created by Michael Malinak on 12/12/20.
//

import Foundation


enum  Movement : String {
   case N,S,E,W,L,R,F
}

extension Movement {
   func degVal() -> Int {
      switch self {
      case .E: return 0
      case .S: return 90
      case .W: return 180
      case .N: return 270
      default: return 0
      }
   }

   mutating func turnDeg(_ degVal: Int) {

      let newDeg =  (self.degVal() + (360 + degVal)) % 360

      switch newDeg {
      case 0: self = .E
      case 90: self = .S
      case 180: self = .W
      case 270: self = .N
      default: self = .E
      }
   }
}



struct Step {
   var m: Movement
   var v: Int

   mutating func turn( turn: Step ) {
      let degTurn = ((turn.m == .L) ? (-1 * turn.v) : (turn.v))
      m.turnDeg(degTurn)
   }
}

struct Day12  {
   
   func partA(_ data: String) -> Int {
      let interim = data.components(separatedBy: "\n").compactMap { $0.split(usingRegex: #"([NSWEWLRF])(\d*)"#) }
      let steps = interim.flatMap { $0 }.compactMap { Step(m:Movement(rawValue: $0[0])!, v:Int($0[1])!) }

      var position = (x:0, y:0)
      var curDir = Step(m:.E, v: 0)

      for step in steps {

         var dir = step.m
         if (step.m == .F) {
            dir = curDir.m
         }

         switch dir {
         case .E:
            position.x += step.v
         case .W:
            position.x -= step.v
         case .S:
            position.y -= step.v
         case .N:
            position.y += step.v
         default:
            curDir.turn(turn: step)
         }
      }

      return (abs(position.x) + abs(position.y))
   }

   struct Waypoint {
      var x:Int
      var y:Int

      mutating func rotate( deg: Int ) {
         var newX = 0
         var newY = 0
         let deg = (360 + deg) % 360

         switch deg {
         case 0:
            print("no change")
         case 90:
            newX = y
            newY = -x
         case 180:
            newX = -x
            newY = -y
         case 270:
            newX = -y
            newY = x
         default:
            print("bad turn")
         }
         x = newX
         y = newY
      }
   }

   func partB(_ data: String ) -> Int {
      let interim = data.components(separatedBy: "\n").compactMap { $0.split(usingRegex: #"([NSWEWLRF])(\d*)"#) }
      let steps = interim.flatMap { $0 }.compactMap { Step(m:Movement(rawValue: $0[0])!, v:Int($0[1])!) }

      var shipPos = (x:0, y:0)
      var wayPoint = Waypoint(x:10, y:1)

      for step in steps {
         switch step.m {
         case .E:
            wayPoint.x += step.v
         case .W:
            wayPoint.x -= step.v
         case .S:
            wayPoint.y -= step.v
         case .N:
            wayPoint.y += step.v
         case .F:
            shipPos.x += step.v * wayPoint.x
            shipPos.y += step.v * wayPoint.y
         case .R:
            wayPoint.rotate( deg: step.v )
         case .L:
            wayPoint.rotate( deg: -1 * step.v )
         }

         print ("-----")
         print( " Position: \(shipPos)" )
         print( " Waypoint: \(wayPoint)" )

      }

      return (abs(shipPos.x) + abs(shipPos.y))
   }
}
