//
//  12912.swift
//  algorithm
//
//  Created by PKW on 2022/05/20.
//

import Foundation

func solution(_ a:Int, _ b:Int) -> Int64 {
    
    let arr = a < b ? a...b : b...a
    var result = 0
    for i in arr {
        result += i
    }

    return Int64(result)
}

print(solution(5, 3))
