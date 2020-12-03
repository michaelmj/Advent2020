//
//  Day03Test.swift
//  Advent2020Tests
//
//  Created by Michael Malinak on 12/3/20.
//

import XCTest

class Day03Tests: XCTestCase {

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


   func testDay03a() throws {
      XCTAssertEqual( Day03.partA( testData ), 2 )
      print ( Day03.partA(Day02Data.string) )
   }
//
//   func testDay03b() throws {
//      XCTAssertEqual( Day03.partB( testData ), 1 )
//      print ( Day03.partB( Day03Data.string ) )
//   }
}
