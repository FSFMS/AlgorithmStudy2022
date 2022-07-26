//
//  82612.swift
//  algorithm
//
//  Created by PKW on 2022/05/19.
//

import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    
    var sum = 0
    for i in 1...count {
        sum += price * i
    }
    
    let result = sum - money

    return Int64(result > 0 ? result : 0)
    
}


solution(3, 20, 4)
