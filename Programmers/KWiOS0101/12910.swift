//
//  12910.swift
//  algorithm
//
//  Created by PKW on 2022/05/20.
//

import Foundation


func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    
    var result = [Int]()
    for i in 0..<arr.count {
        if arr[i] % divisor == 0 {
            result.append(arr[i])
        }
    }
    
    if result.isEmpty {
        result = [-1]
    }
    
    
    return result.sorted()
}

solution([5, 9, 7, 10,55,42,50]  ,  5)
