//
//  Advent2020Tests.swift
//  Advent2020Tests
//
//  Created by Michael Malinak on 11/30/20.
//

import XCTest
@testable import Advent2020

class Advent2020Tests: XCTestCase {

   let data = """
   1721
   979
   366
   299
   675
   1456
   """

   func testDay1a() throws {
      let result = Day01a().process(dataString: data)
      XCTAssert(result == 514579)

      print(Day01a().process(dataString: Day01Data.givenData))
   }

   func testDay1b() throws  {
      let result = Day01b().process(dataString: data)
      XCTAssert(result == 241861950)

      print(Day01b().process(dataString: Day01Data.givenData))
   }
}
