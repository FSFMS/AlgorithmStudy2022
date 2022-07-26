//
//  12930.swift
//  algorithm
//
//  Created by PKW on 2022/05/28.
//

import Foundation

func solution(_ s:String) -> String {
    var result = ""

    let str = s.components(separatedBy: " ")
   
    for i in 0..<str.count {
        if str[i] == "" {
            result += " "
        } else {
            for j in 0..<str[i].count {
                if j % 2 == 0 {
                    result += str[i].map({$0})[j].uppercased()
                } else {
                    result += str[i].map({$0})[j].lowercased()
                }
            }
            result += " "
        }
    }
   
    let endIndex = result.lastIndex(of: " ")
    result.remove(at:endIndex!)
   
    return result
}

solution("abc abc  abc ")
//solution("try hello world")
