//
//  12943.swift
//  algorithm
//
//  Created by PKW on 2022/05/28.
//

import Foundation


func solution(_ num:Int) -> Int {
    var result = num
    var count = 0
 
    while result != 1 {
        if result % 2 == 0 {
            result = result / 2
        } else {
            result = result * 3 + 1
        }
        count += 1
        
        if count == 500 {
            count = -1
            break
        }
    }
  
    
    return count
}


solution(6)
