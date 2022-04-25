import Foundation

// MARK: - 모의고사
// https://programmers.co.kr/learn/courses/30/lessons/42840
// MARK: -

// MARK3
// 다른사람 풀이 참조
// 퍼포먼스 차이 X
//테스트 1 〉    통과 (0.15ms, 16.6MB)
//테스트 2 〉    통과 (0.14ms, 16.6MB)
//테스트 3 〉    통과 (0.14ms, 16.6MB)
//테스트 4 〉    통과 (0.14ms, 16.5MB)
//테스트 5 〉    통과 (0.16ms, 16.6MB)
//테스트 6 〉    통과 (0.16ms, 16.3MB)
//테스트 7 〉    통과 (1.70ms, 16.7MB)
//테스트 8 〉    통과 (0.70ms, 16.3MB)
//테스트 9 〉    통과 (3.00ms, 16.9MB)
//테스트 10 〉    통과 (1.50ms, 16.7MB)
//테스트 11 〉    통과 (3.22ms, 17.1MB)
//테스트 12 〉    통과 (2.83ms, 16.6MB)
//테스트 13 〉    통과 (0.31ms, 16.5MB)
//테스트 14 〉    통과 (3.50ms, 17MB)
func example(_ answers: [Int]) -> [Int] {
    let stupids = [
        [1, 2, 3, 4, 5],
        [2, 1, 2, 3, 2, 4, 2, 5],
        [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    ]

    var result = [(1, 0), (2, 0), (3, 0)]

    for (i, answer) in answers.enumerated() {
        for j in 0 ..< stupids.count {
            if stupids[j][i % stupids[j].count] == answer { result[j].1 += 1 }
        }
    }

    let max = result.max { $0.1 < $1.1 }!.1
    return result.sorted(by: { $0 < $1 }).filter { $1 >= max }.map { $0.0 }
}

// MARK2
// 퍼포먼스 차이 X
//func example(_ answers: [Int]) -> [Int] {
//    let stupids = [
//        [1, 2, 3, 4, 5],
//        [2, 1, 2, 3, 2, 4, 2, 5],
//        [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
//    ]
//
//    var bestCount = 0
//    var passResult = [(Int, Int)]()
//
//    for i in 0 ..< stupids.count {
//        var j = 0
//        var passCount = 0
//        for k in 0 ..< answers.count {
//            if stupids[i][j] == answers[k] {
//                passCount += 1
//            }
//
//            j += 1
//            if j >= stupids[i].count { j = 0 }
//        }
//
//        if bestCount <= passCount {
//            bestCount = passCount
//            passResult = passResult.filter { $1 >= bestCount }
//            passResult.append((i + 1, bestCount))
//        }
//    }
//
//    var result = [Int]()
//
//    passResult.forEach { result.append($0.0) }
//
//    return result.sorted { $0 < $1 }
//}

/// MARK1
//테스트 1 〉    통과 (0.12ms, 16.3MB)
//테스트 2 〉    통과 (0.13ms, 16.5MB)
//테스트 3 〉    통과 (0.12ms, 16.1MB)
//테스트 4 〉    통과 (0.12ms, 16.5MB)
//테스트 5 〉    통과 (0.13ms, 16.3MB)
//테스트 6 〉    통과 (0.13ms, 16.6MB)
//테스트 7 〉    통과 (0.81ms, 16.8MB)
//테스트 8 〉    통과 (0.34ms, 16.3MB)
//테스트 9 〉    통과 (1.27ms, 16.7MB)
//테스트 10 〉    통과 (0.69ms, 16.6MB)
//테스트 11 〉    통과 (1.39ms, 16.9MB)
//테스트 12 〉    통과 (1.23ms, 16.7MB)
//테스트 13 〉    통과 (0.18ms, 16.3MB)
//테스트 14 〉    통과 (1.48ms, 16.9MB)
//func example(_ answers:[Int]) -> [Int] {
//    let stupids = [
//        [1, 2, 3, 4, 5],
//        [2, 1, 2, 3, 2, 4, 2, 5],
//        [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
//    ]
//
//    var passCountList = [(Int, Int)]()
//
//    for i in 0 ..< stupids.count {
//        var passCount = 0
//        var j = 0
//        for k in 0 ..< answers.count {
//            if stupids[i][j] == answers[k] {
//                passCount += 1
//            }
//            j += 1
//            if j >= stupids[i].count { j = 0 }
//        }
//
//        passCountList.append((i + 1, passCount))
//    }
//    var result = [Int]()
//    passCountList .sort(by: { $0.1 > $1.1 })
//    passCountList = passCountList.filter { $1 >= passCountList[0].1 }
//
//    passCountList.forEach { result.append($0.0) }
//
//    return result
//}
