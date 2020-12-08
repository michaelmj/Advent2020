//
//  Day07.swift
//  Advent2020
//
//  Created by Michael Malinak on 12/6/20.
//

import Foundation

struct Day07: Day {
   func partA(_ data: String) -> Int {
      return -1
   }
   func partB(_ data: String) -> Int {
      return -1
   }

   func partA(_ data: String, bagCheck: String) -> Int {
      let rules = parseRules(data)

      var bagsToCheck = [bagCheck]
      var checkedBags = [String]()

      while bagsToCheck.count != 0 {
         let toCheck = bagsToCheck.removeFirst()

         // For every key
         for key in rules.keys {

            if (checkedBags.contains(key)) {
               continue
            }

            // Go through all the rules for that key
            rules[key]!.forEach() {
               if( $0.key == toCheck ) {
                  bagsToCheck.append(key)
                  checkedBags.append(key)
                 // print("\(toCheck) can be in a \(key)")
               }
            }
         }
      }

      let checkedBagsCount = checkedBags.count

      return checkedBagsCount
   }

   func partB(_ data: String, bagCheck: String) -> Int {
      let rules = parseRules(data)

      var bagsToCheck = [(bagCheck,1)]
      var totalBags = 0

      while bagsToCheck.count != 0 {
         let toCheck = bagsToCheck.removeFirst()

         for rule in rules[toCheck.0]! {
            print( "\(toCheck.0) has \(rule)")
            totalBags += toCheck.1 * rule.value

            bagsToCheck.append( (rule.key, rule.value * toCheck.1) )
         }
      }

      return totalBags
   }


   typealias BagLimit = Dictionary<String, Int>
   typealias BagListRules = Dictionary<String, BagLimit>


   func countAndType(fromString: String) -> BagLimit {
      let test = fromString.trimmingCharacters(in: .whitespacesAndNewlines).split(separator: " ")

      if let count = Int(test[0]) {
         return ([String("\(test[1]) \(test[2])" ): count] )
      }

      return( [String: Int]() )
   }

   func parseRules(_ data: String) -> BagListRules {

      // [0] Bag color
      // [1] Contain rules
      let rules =  data.components(separatedBy: "\n").map { $0.components(separatedBy: " bags contain ") }

      var ruleSet = BagListRules()

      rules.forEach() {
         ruleSet[$0[0]] = $0[1].components(separatedBy: .punctuationCharacters).filter {$0.count > 2}.compactMap(countAndType).reduce(into: BagLimit()) {
            $0.merge( $1 ) {(_, new) in new}
         }
      }

      return ruleSet
   }


}
