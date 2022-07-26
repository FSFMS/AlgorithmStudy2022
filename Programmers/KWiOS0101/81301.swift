//
//  81301.swift
//  algorithm
//
//  Created by PKW on 2022/04/30.
//

// 숫자 문자열과 영단어
import Foundation

func solution(_ s:String) -> Int {

    var newWord = s
    
    let list = [0: "zero",
                1: "one",
                2: "two",
                3: "three",
                4: "four",
                5: "five",
                6: "six",
                7: "seven",
                8: "eight",
                9: "nine"
    ]
    
    list.map {
        if newWord.contains($0.value) {
            newWord = newWord.replacingOccurrences(of: $0.value, with: String($0.key))
        }
    }
    
    return Int(newWord) ?? 0
}

