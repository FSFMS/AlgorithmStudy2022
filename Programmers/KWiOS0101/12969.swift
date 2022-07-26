//
//  12969.swift
//  algorithm
//
//  Created by PKW on 2022/05/28.
//

import Foundation

let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
let (a, b) = (n[0], n[1])
var result = ""

for i in 0..<b {
    for j in 0..<a {
        result += "*"
    }
    result += "\n"
}

print(result)

