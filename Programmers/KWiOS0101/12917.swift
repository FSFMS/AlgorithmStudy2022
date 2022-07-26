//
//  12917.swift
//  algorithm
//
//  Created by PKW on 2022/05/20.
//

func solution(_ s:String) -> String {
    
    let upper = s.filter({$0.isUppercase}).sorted().reversed()
    let lower = s.filter({$0.isLowercase}).sorted().reversed()
    
    return String(lower) + String(upper)
}

//solution("Zbcdefg")

solution("ASCEBacbed")
