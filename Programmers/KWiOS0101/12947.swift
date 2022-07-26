//
//  12947.swift
//  algorithm
//
//  Created by PKW on 2022/05/28.
//

import Foundation

func solution(_ x:Int) -> Bool {
    
    let sum = String(x).map{Int(String($0))!}.reduce(0, +)
    
    return x % sum == 0 ? true : false
}

solution(10)
