//
//  Day13.swift
//  Advent2020
//
//  Created by Michael Malinak on 12/13/20.
//

import Foundation

struct Day13  {

   func partA(_ data: String) -> Int {
      let interim = data.components(separatedBy: "\n")
      let time = Int(interim[0])!
      let buses = interim[1].split(usingRegex: #"(\d+)"#).flatMap {Int($0[0])!}

      let nextTimes = buses.compactMap { (Int(time/$0) + 1)  * $0 }
      let index = nextTimes.firstIndex(of: nextTimes.min()!)!

      return buses[index] * (nextTimes[index] - time)
   }

   func partB(_ data: String, hint: Int = 10000) -> Int {
      let buses = data.components(separatedBy: "\n")[1].components(separatedBy: ",")
      let sched = buses.enumerated().filter { $0.element != "x" }.compactMap {
         (index: Int($0.offset), bus: (Int($0.element)!) )
      }

      let minBus = sched[0].bus
      var time = (Int(hint/minBus) + 1) * minBus
      outerLoop: repeat {
         for entry in sched {
            if ( (time + entry.index) % entry.bus != 0 ) {
               time += minBus
               continue outerLoop
            }
         }
         break;
      } while (true)

      return time
   }
}
