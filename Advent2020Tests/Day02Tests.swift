//
//  Day02Tests.swift
//  Advent2020Tests
//
//  Created by Michael Malinak on 12/1/20.
//

import XCTest

class Day02Tests: XCTestCase {

   let testData = """
   111
   """


   func testDay02a() throws {
      Day02.partA( testData )
      //Day02.partA(Day02Data.string)
   }

   func testDay02b() throws {
      Day02.partB( testData )
   }
}
