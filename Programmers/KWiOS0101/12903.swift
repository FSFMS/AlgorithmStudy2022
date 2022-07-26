//
//  12903.swift
//  algorithm
//
//  Created by PKW on 2022/05/19.
//


func solution(_ s:String) -> String {
    
    var result = ""
    let sArr = s.map({$0})
    let reversedArr = s.reversed().map({$0})
    
    if s.count % 2 == 0 {
        result = String(reversedArr[s.count / 2]) + String(sArr[s.count / 2])
    } else {
        result = String(sArr[s.count / 2])
    }

    return result
}

solution("abcde")
