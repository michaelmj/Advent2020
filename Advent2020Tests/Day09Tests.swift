//
//  Day09Tests.swift
//  Advent2020Tests
//
//  Created by Michael Malinak on 12/8/20.
//

import XCTest

class Day09Tests: XCTestCase {
   var day = Day09()
   var dayData: DayData = Day09Data()
   let testData = """
35
20
15
25
47
40
62
55
65
95
102
117
150
182
127
219
299
277
309
576
"""

   func testPartA() throws {
      XCTAssertEqual( day.partA( testData, size: 5 ), 127 )
   }

   func testPartAReal() throws {
      print ( day.partA(dayData.string, size: 25) )
   }

   func testPartB() throws {
      XCTAssertEqual( day.partB( testData, size: 5), 62 )
   }

   func testPartBReal() throws {
      print ( day.partB( dayData.string, size:25 ) )
   }
}
