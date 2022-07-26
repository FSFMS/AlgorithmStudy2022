//
//  12921.swift
//  algorithm
//
//  Created by PKW on 2022/05/26.
//

import Foundation

func solution(_ n: Int) -> Int {
    var numberArray = Array(repeating: 1, count: n+1)
    var count = 0

    for i in 2...n {
        if numberArray[i] == 1 {
            count += 1
            for j in stride(from: i, through: n, by: i) {
                numberArray[j] = 0
            }
        }
//        print("=",[1,1,2,3,4,5,6,7,8,9,10])
//        print(i,numberArray)
//        print("")
    }
    
    
    return count
}

solution(10)
