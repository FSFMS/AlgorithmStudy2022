import Foundation

// MARK: - K번째 수
// https://programmers.co.kr/learn/courses/30/lessons/42748
// MARK: -

func numberK(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result = [Int]()
    for command in commands {
        let divide = array[command[0] - 1 ... command[1] - 1].sorted()
        result.append(divide[command[2] - 1])
    }
    return result
}
