//
//  Day11Tests.swift
//  Advent2020Tests
//
//  Created by Michael Malinak on 12/11/20.
//

import XCTest

class Day11Tests: XCTestCase {
   var day = Day11()
   var dayData: DayData = Day11Data()
   let testData = """
L.LL.LL.LL
LLLLLLL.LL
L.L.L..L..
LLLL.LL.LL
L.LL.LL.LL
L.LLLLL.LL
..L.L.....
LLLLLLLLLL
L.LLLLLL.L
L.LLLLL.LL
"""

   func testPartA() throws {
      XCTAssertEqual( day.partA( testData ), 37 )
   }


   func testPartAReal() throws {
      print ( day.partA(dayData.string) )
   }

   func testPartB() throws {
      XCTAssertEqual( day.partB( testData ), 26 )
   }


   func testPartBReal() throws {
      print ( day.partB( dayData.string ) )
   }

}

