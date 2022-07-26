//
//  17682.swift
//  algorithm
//
//  Created by PKW on 2022/05/19.
//

import Foundation

func solution(_ dartResult:String) -> Int {
    
    var chanceArr = Array(repeating: [Character](), count: 3)
    var resultArr = Array(repeating: [Int](), count: 3)
    let dartResultArr = dartResult.map({$0})
    
    var count = 0
    var checkNumber = false
    
    for i in 0..<dartResultArr.count {
        
        if Int(String(dartResultArr[i])) != nil && !checkNumber {
            count = count == 3 ? 3 : count + 1
            checkNumber = true
        } else {
            checkNumber = false
        }
        
        switch count {
        case 1:
            chanceArr[0].append(dartResultArr[i])
        case 2:
            chanceArr[1].append(dartResultArr[i])
        case 3:
            chanceArr[2].append(dartResultArr[i])
        default:
            break
        }
    }
    var number = 0
    var check = false
    let bouns = ["S","D","T"]
    let option = ["#", "*"]
   
    //print(chanceArr)
    
    for i in 0..<chanceArr.count {
        for char in chanceArr[i] {
            if Int(String(char)) != nil {
                
                if !check {
                    number = Int(String(char))!
                } else {
                    number = Int(String(number) + String(char))!
                    
                }
                check = true
                
            } else if bouns.contains(where: {$0 == String(char)}) {
                check = false
                switch String(char) {
                case "S":
                    number = number * 1
                case "D":
                    number = number * number
                case "T":
                    number = number * number * number
                default:
                    break
                }
            } else if option.contains(where: {$0 == String(char)}) {
                check = false
                switch String(char) {
                case "#":
                    number = number * -(1)
                case "*":
                    if i > 0 {
                        resultArr[i - 1] = [resultArr[i - 1].first! * 2]
                        number = number * 2
                    } else {
                        number = number * 2
                    }
                default:
                    break
                }
            }
        }
        //print(number)
        resultArr[i].append(number)
        number = 0
        //print(resultArr)
        //print("==========")
    }
    
    var result = 0
    for i in resultArr {
        
        result += i.first!
    }
    
    return result
}


solution("10D4S10D") // 2 0 4
//solution("1S2D*3T")
//solution("1S*2T*3S")
//solution("1D2S3T*")

/*
 * = 이전 점수 2배
 * * 2개면 = 이전 점수 4배
 # = 부호 바꿔주기
 
 
 */
