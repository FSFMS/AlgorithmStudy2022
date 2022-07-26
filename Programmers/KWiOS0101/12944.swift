//
//  12944.swift
//  algorithm
//
//  Created by PKW on 2022/05/28.
//

import Foundation


func solution(_ arr:[Int]) -> Double {
    return Double(arr.reduce(0, +)) / Double(arr.count)
}

solution([1,2,3,4])
