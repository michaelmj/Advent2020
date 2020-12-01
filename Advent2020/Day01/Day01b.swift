//
//  Day01b.swift
//  Advent2020
//
//  Created by Michael Malinak on 11/30/20.
//

import Foundation

class Day01b {

   func process( dataString: String ) -> Int {
      let data = dataString.components(separatedBy: "\n").compactMap { Int($0)! }

      for current in 0...data.count-1 {
         for inner in current...data.count-1 {
            for innermost in current...data.count-1 {
               if ( data[current] + data[inner] + data[innermost] == 2020 ) {
                  return data[current] * data[inner] * data[innermost]
               }
            }
         }
      }
      return(0)
   }
}
