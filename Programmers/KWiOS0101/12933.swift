//
//  12933.swift
//  algorithm
//
//  Created by PKW on 2022/05/28.
//

import Foundation
func solution(_ n:Int64) -> Int64 {

    let a = String(n).map({$0}).sorted(by: >).map({String($0)}).joined(separator: "")
    
    return Int64(a)!
}

solution(118372)
