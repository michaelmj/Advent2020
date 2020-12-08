//
//  Day08Tests.swift
//  Advent2020Tests
//
//  Created by Michael Malinak on 12/8/20.
//

import XCTest

class Day08Tests: XCTestCase {

   var day: Day = Day08()
   var dayData: DayData = Day08Data()
   let testData = """
nop +0
acc +1
jmp +4
acc +3
jmp -3
acc -99
acc +1
jmp -4
acc +6
"""

   func testPartA() throws {
      XCTAssertEqual( day.partA( testData ), 5 )
      print ( day.partA(dayData.string) )
   }

   func testPartB() throws {
      XCTAssertEqual( day.partB( testData ), 8 )
      print ( day.partB( dayData.string ) )
   }
}
