//
//  12931.swift
//  algorithm
//
//  Created by PKW on 2022/05/28.
//

import Foundation


func solution(_ n:Int) -> Int {
    
    return String(n).map({Int(String($0))!}).reduce(0, +)
}
solution(123)
