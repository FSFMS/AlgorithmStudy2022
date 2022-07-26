//
//  12977.swift
//  algorithm
//
//  Created by PKW on 2022/05/13.
//

import Foundation

func solution(_ nums:[Int]) -> Int {
   
    
    var result = 0
    
    for i in 0..<nums.count - 2 {
        
        for j in i+1..<nums.count {
        
            for k in j+1..<nums.count {
                
                if isPrime(sum: nums[i]+nums[j]+nums[k]) {
                    result += 1
                }
            }
        }
    }
    return result
}

func isPrime(sum: Int) -> Bool {
    for number in 2..<sum {
        if sum % number == 0 {
            return false
        }
    }
    return true
}

solution([1,2,3,4])

