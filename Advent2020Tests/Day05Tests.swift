//
//  Day05Tests.swift
//  Advent2020Tests
//
//  Created by Michael Malinak on 12/5/20.
//

import XCTest


class Day05Tests: XCTestCase {

   let testData = """
BFFFBBFRRR
FFFBBBFRRR
BBFFBBFRLL
"""


   func testDay05a() throws {
      XCTAssertEqual( Day05.partA( testData ), 820 )
      print ( Day05.partA(Day05Data.string) )
   }

   func testDay05b() throws {
      print ( Day05.partB( Day05Data.string ) )
   }
}
