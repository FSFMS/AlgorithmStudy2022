//
//  67256.swift
//  algorithm
//
//  Created by PKW on 2022/04/30.
//


/*
 좌표값
 0,0  0,1  0,2
 1,0  1,1  1,2
 2,0  2,1  2,2
 3,0  3,1  3,2
 */

import Foundation
func solution(_ numbers:[Int], _ hand:String) -> String {
    
    let keypad = [
        [1,2,3],
        [4,5,6],
        [7,8,9],
        [-1,0,-2]
    ]
    
    var coordinate = [Int:[Int]]()
    
    // 좌표값 초기화
    for i in 0..<keypad.count {
        for j in 0..<keypad[i].count {
            coordinate[keypad[i][j]] = [i,j]
        }
    }
    
    var leftHand = coordinate[-1]!
    var rightHand = coordinate[-2]!
    var result = ""
    
    for number in numbers {
        if [1,4,7].contains(number) {
            leftHand = coordinate[number]!
            result += "L"
            print("L 좌표 = \(leftHand), 번호 = \(number)")
            print("=======")
        } else if [3,6,9].contains(number) {
            rightHand = coordinate[number]!
            result += "R"
            print("R 좌표 = \(rightHand), 번호 = \(number)")
            print("=======")
        } else {
            print("가운데, 좌표 = \(coordinate[number]!), 번호 = \(number)")
            print("왼손 좌표 = \(leftHand), 오른손 좌표 = \(rightHand)")
            let d = coordinate[number]!
            
            print("""
                    L 거리구하기,
                    왼손 좌표 = \(leftHand)
                    0 = \(abs(leftHand[0] - d[0]))
                    1 = \(abs(leftHand[1] - d[1]))
                    계산한 값 = \(abs(leftHand[0] - d[0]) + abs(leftHand[1] - d[1]))
                ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
                """)
            
            print("""
                    R 거리구하기,
                    오른손 좌표 = \(rightHand)
                    0 = \(abs(rightHand[0] - d[0]))
                    1 = \(abs(rightHand[1] - d[1]))
                    계산한 값 = \(abs(rightHand[0] - d[0]) + abs(rightHand[1] - d[1]))
                """)
            print("=============")
            
            var l = abs(leftHand[0] - d[0]) + abs(leftHand[1] - d[1])
            var r = abs(rightHand[0] - d[0]) + abs(rightHand[1] - d[1])

            if l < r {
                result += "L"
                leftHand = coordinate[number]!
            } else if l > r {
                result += "R"
                rightHand = coordinate[number]!
            } else if hand == "left" {
                result += "L"
                leftHand = coordinate[number]!
            } else {
                result += "R"
                rightHand = coordinate[number]!
            }
            
        }
    }
    
    return result
}
