//
//  17681.swift
//  algorithm
//
//  Created by PKW on 2022/05/19.
//

import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    
    var firstMap = Array(repeating: [Int](), count: n)
    var secondMap = Array(repeating: [Int](), count: n)
    var resultMap = Array(repeating: [String](), count: n)
     
    var remainder = 0

    for i in 0..<n {
        var number = arr1[i]
        for _ in 0..<n {
            remainder = number % 2
            number = number / 2
            firstMap[i].insert(remainder, at: 0)
        }
    }
    
    for i in 0..<n {
        var number = arr2[i]
        for _ in 0..<n {
            remainder = number % 2
            number = number / 2
            secondMap[i].insert(remainder, at: 0)
        }
    }
    
    for i in 0..<n {
        for j in 0..<n {
            if firstMap[i][j] == 1 {
                secondMap[i][j] = 1
            }
        }
    }

    for i in 0..<n {
        for j in 0..<n {
            if secondMap[i][j] == 1 {
                resultMap[i].append("#")
            } else {
                resultMap[i].append(" ")
            }
        }
    }

    return resultMap.map({$0.joined(separator: "")})
}


solution(5, [9, 20, 28, 18, 11], [30, 1, 21, 17, 28])
