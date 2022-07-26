//
//  68935.swift
//  algorithm
//
//  Created by PKW on 2022/05/15.
//

import Foundation

func solution(_ n:Int) -> Int {
    
    var number = n
    var arr = [Int]()
    var result = 0
    
    while (number > 0) {
        arr.append(number % 3)
        number /= 3
    }
    
    var count = 1
    for number in arr.reversed() {
        result += count * number
        count *= 3
    }
    
    return result
}


solution(125)
