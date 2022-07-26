//
//  86491.swift
//  algorithm
//
//  Created by PKW on 2022/05/15.
//

import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var sizesArr = sizes
    
    for i in 0..<sizesArr.count {
        sizesArr[i].sort()
    }
    
    let wMax = sizesArr.map({$0[0]}).max()!
    let hMax = sizesArr.map({$0[1]}).max()!
    
    
    return wMax * hMax
    
}

//solution([[60, 50], [30, 70], [60, 30], [80, 40]])
solution([[10, 7], [12, 3], [8, 15], [14, 7], [5, 15]])
//solution([[14, 4], [19, 6], [6, 16], [18, 7], [7, 11]])


/*
 14 19 6  18 7 = 19
 4  6  16 7  11 = 16
 
 14  19  16  18  7
 4   6   6   7   11
 
 
 
 */
