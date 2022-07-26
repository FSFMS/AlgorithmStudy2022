//
//  87389.swift
//  algorithm
//
//  Created by PKW on 2022/05/19.
//

import Foundation

func solution(_ n:Int) -> Int {
   
    var result = [Int]()
    
    for i in 1...n {
        if n % i == 1 {
            result.append(i)
        }
    }
    
    return result.min() ?? 0
}
