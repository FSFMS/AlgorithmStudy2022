//
//  12950.swift
//  algorithm
//
//  Created by PKW on 2022/05/28.
//

import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
   
    var resultArr = Array(repeating: [Int](), count: 0)
    var sumArr = [Int]()
    
    for i in 0..<arr1.count {
        for j in 0..<arr1[i].count {
            let sum = arr1[i][j] + arr2[i][j]
            sumArr.append(sum)
        }
        resultArr.append(sumArr)
        sumArr = []
    }
    
    
    return resultArr
}


solution([[1,2],[2,3]], [[3,4],[5,6]])
