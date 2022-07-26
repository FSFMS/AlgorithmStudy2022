//
//  12918.swift
//  algorithm
//
//  Created by PKW on 2022/05/26.
//

import Foundation


func solution(_ s:String) -> Bool {
    
    if s.count == 4 || s.count == 6 {
        return s.map { $0.isNumber }.contains(where: {$0 == false}) ? false : true
    } else {
        return false
    }
}


print(solution("1e22"))
