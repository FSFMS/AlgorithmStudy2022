//
//  12954.swift
//  algorithm
//
//  Created by PKW on 2022/05/28.
//

import Foundation

func solution(_ x:Int, _ n:Int) -> [Int64] {
   
    var resultArr = [Int64]()
    var sum = 0
    
    for i in 0..<n {
        sum += x
        resultArr.append(Int64(sum))
    }
    
    return resultArr
}


solution(2, 5)
