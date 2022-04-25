import Foundation

// MARK: - 두 개 뽑아서 더하기
// https://programmers.co.kr/learn/courses/30/lessons/68644
// MARK: -

func twoAdd(_ numbers:[Int]) -> [Int] {
    var sumList = Set<Int>()
    
    for i in 0 ..< numbers.count - 1 {
        for j in i + 1 ..< numbers.count {
            sumList.insert(numbers[i] + numbers[j])
        }
    }
    
    return Array(sumList).sorted()
}
