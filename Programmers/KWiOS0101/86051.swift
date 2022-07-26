//
//  86051.swift
//  algorithm
//
//  Created by PKW on 2022/05/13.
//

import Foundation

func solution(_ numbers:[Int]) -> Int {
    
    var result = 0
    for i in 0...9 {
        if !numbers.contains(where: {$0 == i}) {
            result = result + i
        }
    }
    return result
}

print(solution([1,2,3,4,6,7,8,0]))
print(solution([5,8,4,0,6,7,9]))
