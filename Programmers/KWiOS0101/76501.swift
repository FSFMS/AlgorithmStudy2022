//
//  76501.swift
//  algorithm
//
//  Created by PKW on 2022/05/13.
//

import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    
    var result = 0

    for i in 0..<absolutes.count {
        if signs[i] == true {
            result = result + absolutes[i]
        } else {
            result = result + -(absolutes[i])
        }
    }
    return result
}


solution([4,7,12], [true,false,true])
solution([1,2,3], [false,false,true])
