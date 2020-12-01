//
//  Advent2020Tests.swift
//  Advent2020Tests
//
//  Created by Michael Malinak on 11/30/20.
//

import XCTest
@testable import Advent2020

class Advent2020Tests: XCTestCase {

   override func setUpWithError() throws {
      // Put setup code here. This method is called before the invocation of each test method in the class.
   }

   override func tearDownWithError() throws {
      // Put teardown code here. This method is called after the invocation of each test method in the class.
   }

   func testDay1a() throws {
      let data = """
      1721
      979
      366
      299
      675
      1456
      """

      let result = Day01a().process(dataString: data)
      XCTAssert(result == 514579)

      print(Day01a().process(dataString: Day01Data.givenData))
      // This is an example of a functional test case.
      // Use XCTAssert and related functions to verify your tests produce the correct results.
   }

   func testDay1b() throws  {
      let data = """
      1721
      979
      366
      299
      675
      1456
      """

      let result = Day01b().process(dataString: data)
      XCTAssert(result == 241861950)

      print(Day01b().process(dataString: Day01Data.givenData))
   }

//   func testPerformanceExample() throws {
//      // This is an example of a performance test case.
//      self.measure {
//         // Put the code you want to measure the time of here.
//      }
//   }

}
