//
//  Day13Tests.swift
//  Advent2020Tests
//
//  Created by Michael Malinak on 12/13/20.
//

import XCTest

class Day13Tests: XCTestCase {

   var day = Day13()
   var dayData: DayData = Day13Data()
   let testData = """
939
7,13,x,x,59,x,31,19
"""

   func testPartA() throws {
      XCTAssertEqual( day.partA( testData ), 295 )
   }


   func testPartAReal() throws {
      print ( day.partA(dayData.string) )
   }


   func testPartB() throws {
      XCTAssertEqual( day.partB( testData ), 1068781 )
   }


   func testPartBReal() throws {
      print ( day.partB( dayData.string, hint: 100000000000000 ) )
   }



}
