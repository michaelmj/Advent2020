//
//  Permutations.swift
//  Advent of Code 2019
//
//  Created by Malinak, Michael on 12/7/19.
//  Copyright © 2019 TechSmith Corporation. All rights reserved.
//

import Foundation

func permutations(_ array: [Int]) -> [[Int]] {
    let n = array.count
    var result: [[Int]] = []
    guard n > 0 else { return [[]] }
    
    for i in 0..<n {
        
        let before = Array(array[0..<i])
        let after  = Array(array[i+1..<n])
        
        let lastLevel = permutations(before + after)
        
        result += lastLevel.map { $0 + [array[i]] }
    }
    
    return result
}
