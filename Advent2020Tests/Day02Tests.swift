//
//  Day02Tests.swift
//  Advent2020Tests
//
//  Created by Michael Malinak on 12/1/20.
//

import XCTest

class Day02Tests: XCTestCase {

   let testData = """
1-3 a: abcde
1-3 b: cdefg
2-9 c: ccccccccc
"""


   func testDay02a() throws {
      XCTAssertEqual( Day02.partA( testData ), 2 )
      print ( Day02.partA(Day02Data.string) )
   }

   func testDay02b() throws {
      XCTAssertEqual( Day02.partB( testData ), 1 )
      print ( Day02.partB( Day02Data.string ) )
   }
}
