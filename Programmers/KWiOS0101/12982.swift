//
//  12982.swift
//  algorithm
//
//  Created by PKW on 2022/05/15.
//

import Foundation


func solution(_ d:[Int], _ budget:Int) -> Int {
    
    var sum = 0
    var result = 0

    for i in d.sorted() {
        
        sum += i
        
        if sum <= budget {
            
            result += 1
        }
    }
    
    return result
}


solution([1,3,2,5,4], 9)
solution([2,2,3,3], 10)
