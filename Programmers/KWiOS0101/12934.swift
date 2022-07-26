//
//  12934.swift
//  algorithm
//
//  Created by PKW on 2022/05/28.
//

import Foundation


func solution(_ n:Int64) -> Int64 {
    
    let a = Int64(sqrt(Double(n)))

    if (a * a) == n {
        print("같음")
        return Int64(a + 1) * Int64(a + 1)
    } else {
        print("다름")
        return Int64(-1)
    }
}


solution(121)
solution(3)
