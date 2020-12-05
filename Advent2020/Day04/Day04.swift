//
//  Day04.swift
//  Advent2020
//
//  Created by Michael Malinak on 12/3/20.
//

import Foundation

struct Day04 {

   let requiredCodes = Set(["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"])
   let eyeColors = Set(["amb", "blu", "brn", "gry", "grn", "hzl", "oth"])

   static func partA(_ data: String ) -> Int {
      let today = Day04()
      let parsed = today.parseData(dataString: data)

      let correct = parsed.filter {
         Set($0.keys).isSuperset(of: today.requiredCodes)
      }

      print(correct)

      return correct.count
   }

   static func vhgt(_ height: String) -> Bool {
      if let numPrefix = Int(height.prefix(while: { "0"..."9" ~= $0 })) {
         if ( height.contains("cm") ) {
            return numPrefix >= 150 && numPrefix <= 193
         } else if ( height.contains("in") ) {
            return numPrefix >= 59 && numPrefix <= 76
         }
      }
      return false
   }

   static func vhcl(_ hexColor: String) -> Bool {
      return (hexColor.count == 7) &&
         (hexColor.range(of: "#([a-f0-9]{6})", options: .regularExpression, range: nil, locale: nil) != nil)
   }

   static func vpid(_ passId: String) -> Bool {
      return (passId.count == 9) &&
         (passId.range(of: "([0-9]{9})", options: .regularExpression, range: nil, locale: nil) != nil)
   }

   static func partB(_ data: String ) -> Int {
      let today = Day04()
      let parsed = today.parseData(dataString: data)

      let correct = parsed.filter {
         ( Set($0.keys).isSuperset(of: today.requiredCodes) &&
            Int($0["byr"]!)! >= 1920 && Int($0["byr"]!)! <= 2002 &&
            Int($0["iyr"]!)! >= 2010 && Int($0["iyr"]!)! <= 2020 &&
            Int($0["eyr"]!)! >= 2020 && Int($0["eyr"]!)! <= 2030 &&
            vhgt($0["hgt"]!) && vhcl($0["hcl"]!) && today.eyeColors.contains($0["ecl"]!) &&
            vpid($0["pid"]!)
         )
      }

      return correct.count
   }

   func parseData( dataString: String) -> [[String:String]] {

      let lines = dataString.components(separatedBy: "\n\n").compactMap {
         $0.components(separatedBy: .whitespacesAndNewlines).sorted().compactMap {
            $0.components(separatedBy: ":")
         }
      }.compactMap {
         $0.reduce(into: [String: String]()) {
            $0[$1[0]] = $1[1]
         }
      }

      return lines
   }
}
