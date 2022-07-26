//
//  42889.swift
//  algorithm
//
//  Created by PKW on 2022/05/13.
//

import Foundation

// N 전체 사용자
// stages 멈춰있는 스테이지

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    
    var stageCount = stages.count
    var totalStageArr = Array(repeating: [Int](), count: N + 1)
    var failArr = [Int:Double]()
    
    // [[1], [2, 2, 2], [3, 3], [4], [], [6]]
    for i in 0..<stages.count {
        for j in 0..<totalStageArr.count {
            // 스테이지 번호와 토탈스테이지배열의 인덱스 번호랑 같다면
            if stages[i] - 1 == j {
                let index = stages[i] - 1
                totalStageArr[index].append(stages[i])
            }
        }
    }
    
    // [[1], [2, 2, 2], [3, 3], [4], [], [6]]
    for i in 0..<totalStageArr.count {
        if i > N - 1 {
            failArr[i+1] = Double(0)
        } else {
            let result = Double(totalStageArr[i].count) / Double(stageCount)
            failArr[i+1] = result
            stageCount -= totalStageArr[i].count
        }
    }
    
    let result = failArr.sorted(by: <).sorted(by: {$0.value > $1.value})
   
    return result.map {$0.key }.dropLast()
}


solution(5  ,  [2, 1, 2, 6, 2, 4, 3, 3])
