//
//  12935.swift
//  algorithm
//
//  Created by PKW on 2022/05/28.
//

import Foundation

func solution(_ arr:[Int]) -> [Int] {
    
    var resultArr = [Int]()

    for i in arr {
        if i == 10 && arr.isEmpty {
            return [-1]
        } else {
            resultArr.append(i)
        }
    }
    
    let index = resultArr.firstIndex(of: resultArr.min()!)
    resultArr.remove(at: index!)
    print(resultArr)
    
    return resultArr
}

solution([4,3,2,1])

//solution([2,5,6,1,3])
//solution([10])
