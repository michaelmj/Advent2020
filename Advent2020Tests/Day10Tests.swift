//
//  Day10Tests.swift
//  Advent2020Tests
//
//  Created by Michael Malinak on 12/9/20.
//

import XCTest

class Day10Tests: XCTestCase {
   var day = Day10()
   var dayData: DayData = Day10Data()
   let testData = """
16
10
15
5
1
11
7
19
6
12
4
0
"""

   func testPartA() throws {
      XCTAssertEqual( day.partA( testData ), 35 )
   }

   func testPartA2() throws {
      XCTAssertEqual( day.partA( testData2 ), 220 )
   }

   func testPartAReal() throws {
      print ( day.partA(dayData.string) )
   }

   func testPartB() throws {
      XCTAssertEqual( day.partB( testData ), 8 )
   }

   func testPartB2() throws {
      XCTAssertEqual( day.partB( testData2 ), 19208 )
   }

   func testPartBReal() throws {
      print ( day.partB( dayData.string ) )
   }

   let testData2 = """
0
28
33
18
42
31
14
46
20
48
47
24
23
49
45
19
38
39
11
1
32
25
35
8
17
7
9
4
2
34
10
3
"""
}

