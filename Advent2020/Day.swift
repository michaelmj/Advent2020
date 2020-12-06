//
//  Day.swift
//  Advent2020
//
//  Created by Michael Malinak on 12/5/20.
//

import Foundation

public protocol Day {
   func partA(_ data: String) -> Int
   func partB(_ data: String) -> Int
}

public protocol DayData {
   var string: String {
      get
   }
}
