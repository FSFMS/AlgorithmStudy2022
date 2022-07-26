//
//  12940.swift
//  algorithm
//
//  Created by PKW on 2022/05/28.
//

import Foundation


func solution(_ n:Int, _ m:Int) -> [Int] {
    var max = m
    var min = n
    var remainder = max % min
    
    // 최대 공약수
    while remainder != 0 {
        max = min
        min = remainder
        remainder = max % min
    }
    return [min, n*m/min]
}

solution(3, 12)
