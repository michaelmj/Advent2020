//
//  Day05.swift
//  Advent2020
//
//  Created by Michael Malinak on 12/5/20.
//

import Foundation

struct Day05 {

   struct SeatInfo {
      var row = 0
      var col = 0

      var seatId : Int {
            return 8 * row + col
      }
   }

   static func partA(_ data: String ) -> Int {
      let seatInfo = arrayFromString(data)
      return  seatInfo.max { $0.seatId < $1.seatId }!.seatId
   }

   static func partB(_ data: String ) -> Int {
      let seatInfo = arrayFromString(data).sorted {  $0.seatId < $1.seatId }

      var seatIdx = seatInfo[0].seatId
      for element in seatInfo {
         if ( element.seatId != seatIdx ) {
            return seatIdx
         }
         seatIdx += 1
      }

      return 0
   }

   static func binAtoI(_ numArray: [Int] ) -> Int {

      var total = 0;
      for (index, element) in numArray.enumerated() {
         let mult = Double( numArray.count - index - 1)
         let val = Int( pow( Double(2), mult ) )
         total += (element * val)
      }

      return total
   }

   static func seatInfo( binArray: [Int] ) -> SeatInfo {
      let row = binAtoI( Array(binArray.prefix(7)) )
      let col = binAtoI( Array(binArray.suffix(3)) )

      return SeatInfo(row: row, col: col)
   }

   static func arrayFromString(_ dataString: String) -> [SeatInfo] {
      let lines = dataString.components(separatedBy: "\n").compactMap() { $0 }
      let arrays = lines.map() { $0.map() { return ((($0 == "B") || ($0 == "R")) ? 1 : 0) } }

      let ids = arrays.compactMap() { seatInfo(binArray: $0) }

      return ids
   }
}
