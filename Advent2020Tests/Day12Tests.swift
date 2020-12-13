//
//  Day12Tests.swift
//  Advent2020Tests
//
//  Created by Michael Malinak on 12/12/20.
//

import XCTest

class Day12Tests: XCTestCase {

   var day = Day12()
   var dayData: DayData = Day12Data()
   let testData = """
F10
N3
F7
R90
F11
"""

   func testPartA() throws {
      XCTAssertEqual( day.partA( testData ), 25 )
   }


   func testPartAReal() throws {
      print ( day.partA(dayData.string) )
   }


   func testPartB() throws {
      XCTAssertEqual( day.partB( testData ), 286 )
   }


   func testPartBReal() throws {
      print ( day.partB( dayData.string ) )
   }



}
