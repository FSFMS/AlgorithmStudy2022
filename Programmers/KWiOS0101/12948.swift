//
//  12948.swift
//  algorithm
//
//  Created by PKW on 2022/05/28.
//

import Foundation

func solution(_ phone_number:String) -> String {
    
    var phoneNumber = phone_number.map({$0})
    
    for i in 0..<phoneNumber.count - 4 {
        phoneNumber[i] = "*"
    }
   
    
    return phoneNumber.map({String($0)}).joined(separator: "")
}


solution("01033334444")
