//
//  Day04Tests.swift
//  Advent2020Tests
//
//  Created by Michael Malinak on 12/3/20.
//

import XCTest

class Day04Tests: XCTestCase {

   let testData = """
..##.......
#...#...#..
.#....#..#.
..#.#...#.#
.#...##..#.
..#.##.....
.#.#.#....#
.#........#
#.##...#...
#...##....#
.#..#...#.#
"""


   func testDay04a() throws {
      XCTAssertEqual( Day04.partA( testData ), 7 )
    //  print ( Day04.partA(Day04Data.string) )
   }
//
//   func testDay04b() throws {
//      XCTAssertEqual( Day04.partB( testData ), 1 )
//      print ( Day03.partB( Day04Data.string ) )
//   }
}
