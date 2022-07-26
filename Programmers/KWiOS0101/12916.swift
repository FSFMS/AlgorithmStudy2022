//
//  12916.swift
//  algorithm
//
//  Created by PKW on 2022/05/20.
//

import Foundation

func solution(_ s:String) -> Bool {
    
    
    let p = s.lowercased().filter({$0 == "p"}).count
    let y = s.lowercased().filter({$0 == "y"}).count
    
    // p와 y가 없으면 무조건 0 0 이니까 true
    return p == y ? true : false
   
}


