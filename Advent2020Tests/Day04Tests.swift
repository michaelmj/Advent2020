//
//  Day04Tests.swift
//  Advent2020Tests
//
//  Created by Michael Malinak on 12/3/20.
//

import XCTest

class Day04Tests: XCTestCase {

   let testData = """
ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
byr:1937 iyr:2017 cid:147 hgt:183cm

iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
hcl:#cfa07d byr:1929

hcl:#ae17e1 iyr:2013
eyr:2024
ecl:brn pid:760753108 byr:1931
hgt:179cm

hcl:#cfa07d eyr:2025 pid:166559648
iyr:2011 ecl:brn hgt:59in
"""


   func testDay04a() throws {
      XCTAssertEqual( Day04.partA( testData ), 2 )
      print ( Day04.partA(Day04Data.string) )
   }

   func testDay04b() throws {
      print ( Day04.partB( Day04Data.string ) )
   }
}
