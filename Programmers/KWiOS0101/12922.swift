//
//  12922.swift
//  algorithm
//
//  Created by PKW on 2022/05/27.
//

import Foundation

func solution(_ n:Int) -> String {
   
    var result = ""
    
    for i in 1...n {
        result += i % 2 == 0 ? "박" : "수"
    }
    
    return result
}

solution(3)
