//
//  12915.swift
//  algorithm
//
//  Created by PKW on 2022/05/20.
//

import Foundation

func solution(_ strings:[String], _ n:Int) -> [String] {
    
    var arr = [(Int,String, String)]()
    var result = [(Int,String, String)]()
    
    for (index,value) in strings.enumerated() {
        let char = value.map{$0}[n]
        let str = (index ,String(char), String(value.map{$0}))
        arr.append(str)
    }
    //print(arr)
    
    let filterStr = Set(arr.map{$0.1}).sorted()
    //print(filterStr)
   
    for i in filterStr {
        let str = arr.filter({$0.1 == i})
        //print(str)
        if str.count > 1 {
            result += str.sorted(by: {$0.2 < $1.2})
        } else {
            result += str
        }
        print(result)
    }
    
    //print(result)
    
    return result.map({$0.2})
}

//solution(["sun", "bed", "car"], 1)
solution(["abce", "abcd", "cdx"], 2)
//solution(["abce", "abcd", "cdx","adx","asea","aaaa"], 2)
