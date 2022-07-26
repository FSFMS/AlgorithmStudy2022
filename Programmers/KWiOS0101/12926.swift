//
//  12926.swift
//  algorithm
//
//  Created by PKW on 2022/05/27.
//

import Foundation

// a 87 z 122
// A 65 Z 90

func solution(_ s:String, _ n:Int) -> String {
    
    var char = s.map{$0}
    var ascii: UInt8?
    var resultArr = [String]()
    
    for i in 0..<char.count {
        if char[i] == " " { // 공백인지 아닌지 체크
            resultArr.append(" ")
        } else {
            ascii = char[i].asciiValue! + UInt8(n)
            
            if char[i].isUppercase { // 대문자인지 아닌지 체크
                if ascii! > 90 { // 대문자일때 90이상 넘어가면
                    let over = ascii! - 90
                    resultArr.append(String(UnicodeScalar(64 + over)))
                } else {
                    resultArr.append(String(UnicodeScalar(ascii!)))
                }
            } else {
                if ascii! > 122 { // 소문자일때 122 이상 넘어가면
                    let over = ascii! - 122
                    resultArr.append(String(UnicodeScalar(96 + over)))
                } else {
                    resultArr.append(String(UnicodeScalar(ascii!)))
                }
            }
        }
    }
    
    return resultArr.joined(separator: "")
}
//solution("a B z", 4)
//solution("P", 15)
