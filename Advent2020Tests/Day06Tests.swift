//
//  Day06Tests.swift
//  Advent2020Tests
//
//  Created by Michael Malinak on 12/5/20.
//

import XCTest

class Day06Tests: XCTestCase {

   var day: Day = Day06()
   var dayData: DayData = Day06Data()
   let testData = """
abc

a
b
c

ab
ac

a
a
a
a

b
"""

   override func setUpWithError() throws {
      day = Day06()
   }

   func testPartA() throws {
      XCTAssertEqual( day.partA( testData ), 11 )
      print ( day.partA(dayData.string) )
   }

   func testPartB() throws {
      XCTAssertEqual( day.partB( testData ), 6 )
      print ( day.partB( dayData.string ) )
   }
}
