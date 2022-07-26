//
//  70128.swift
//  algorithm
//
//  Created by PKW on 2022/05/13.
//

import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    
    var result = 0
    
    for i in 0..<a.count {
        result = result + (a[i]*b[i])
    }
    
    return result
}

solution([1,2,3,4],[-3,-1,0,2])
solution([-1,0,1],[1,0,-1])
