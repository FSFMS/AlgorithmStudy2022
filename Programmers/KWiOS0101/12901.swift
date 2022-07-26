//
//  12901.swift
//  algorithm
//
//  Created by PKW on 2022/05/15.
//

func solution(_ a:Int, _ b:Int) -> String {
    let weeks = ["SUN","MON","TUE","WED","THU","FRI","SAT"]
    let days = [31,29,31,30,31,30,31,31,30,31,30,31]
    var totalDay = 4
    
    if a == 1 {
        totalDay += b
    } else {
        for i in 0..<a - 1 {
            totalDay += days[i]
        }
        totalDay += b
    }

    return weeks[totalDay % 7]
}



solution(1,1)
