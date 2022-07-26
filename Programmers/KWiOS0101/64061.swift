//
//  64061.swift
//  algorithm
//
//  Created by PKW on 2022/05/02.
//

import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var basket = Array(repeating: [Int](), count: board.count)
    var result = [Int]()
    var count = 0
    
    for i in 0..<board.count {
        for j in 0..<board[i].count {
            if board[i][j] != 0 {
                basket[j].append(board[i][j])
            }
        }
    }
    
    for move in moves {
        // 바구니가 비어있지 않으면
        if !basket[move - 1].isEmpty {
            // 결과배열이 비어있지 않으면
            if !result.isEmpty {
                // 결과배열의 마지막과 뽑은 인형이 같다면
                if result.last == basket[move - 1].first {
                    // 바구니에서 뽑은 인형 제거
                    basket[move - 1].removeFirst()
                    // 결과배열에서 마지막 인형 제거
                    result.removeLast()
                    count += 2
                    continue
                }
            }
            // 결과 바구니가 비어있다면
            result.append(basket[move - 1].removeFirst())
        }
    }
    return count
}
