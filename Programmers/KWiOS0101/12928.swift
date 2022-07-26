//
//  12928.swift
//  algorithm
//
//  Created by PKW on 2022/05/28.
//

import Foundation

func solution(_ n:Int) -> Int {
    
    var result = [Int]()
    
    for i in 0...n {
        if i == 0 {
            continue
        } else {
//            if n != 0 {
                if n % i == 0 {
                    result.append(i)
                }
            //}
        }
    }
    return result.reduce(0, +)
}

solution(12)
