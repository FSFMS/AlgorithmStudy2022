//
//  12932.swift
//  algorithm
//
//  Created by PKW on 2022/05/28.
//

import Foundation

func solution(_ n:Int64) -> [Int] {
    
    return String(n).map({Int(String($0))!}).reversed().map({$0})
}


solution(12345)
