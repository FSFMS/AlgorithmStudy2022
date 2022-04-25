import Foundation

// MARK: - 체육복
// https://programmers.co.kr/learn/courses/30/lessons/42862
// MARK: -

/// MARK3
/// C언어 스타일..?
//정확성  테스트
//테스트 1 〉    통과 (0.05ms, 16.3MB)
//테스트 2 〉    통과 (0.05ms, 16.4MB)
//테스트 3 〉    통과 (0.05ms, 16.4MB)
//테스트 4 〉    통과 (0.05ms, 16.4MB)
//테스트 5 〉    통과 (0.05ms, 16.6MB)
//테스트 6 〉    통과 (0.04ms, 16.4MB)
//테스트 7 〉    통과 (0.08ms, 16.4MB)
//테스트 8 〉    통과 (0.06ms, 16.3MB)
//테스트 9 〉    통과 (0.08ms, 16.2MB)
//테스트 10 〉    통과 (0.08ms, 16.4MB)
//테스트 11 〉    통과 (0.15ms, 16.5MB)
//테스트 12 〉    통과 (0.06ms, 16.4MB)
//테스트 13 〉    통과 (0.04ms, 16.5MB)
//테스트 14 〉    통과 (0.04ms, 16.3MB)
//테스트 15 〉    통과 (0.04ms, 16.5MB)
//테스트 16 〉    통과 (0.05ms, 16.5MB)
//테스트 17 〉    통과 (0.05ms, 16.3MB)
//테스트 18 〉    통과 (0.05ms, 16.5MB)
//테스트 19 〉    통과 (0.04ms, 16.5MB)
//테스트 20 〉    통과 (0.04ms, 16.4MB)
func sweat(_ n: Int, _ lost: [Int], _ reserve: [Int]) -> Int {
    var sweats = [Int](repeating: 1, count: n)

    lost.forEach { sweats[$0 - 1] -= 1 }
    reserve.forEach { sweats[$0 - 1] += 1 }

    var i = 0
    while i < sweats.count - 1 {
        if sweats[i] == 0 {
            if i > 0, sweats[i - 1] == 2 {
                sweats[i] += 1
                sweats[i - 1] -= 1
                i += 2
                continue
            } else if sweats[i + 1] == 2 {
                sweats[i] += 1
                sweats[i + 1] -= 1
                i += 2
                continue
            }
        }
        i += 1
    }

    return sweats.filter { $0 > 0 }.count
}

/// 다른사람 풀이
//정확성  테스트
//테스트 1 〉    통과 (0.12ms, 16.4MB)
//테스트 2 〉    통과 (0.22ms, 16.3MB)
//테스트 3 〉    통과 (0.13ms, 16.6MB)
//테스트 4 〉    통과 (0.14ms, 16.6MB)
//테스트 5 〉    통과 (0.15ms, 16.3MB)
//테스트 6 〉    통과 (0.11ms, 16.6MB)
//테스트 7 〉    통과 (0.18ms, 16.6MB)
//테스트 8 〉    통과 (0.12ms, 16.6MB)
//테스트 9 〉    통과 (0.11ms, 16.6MB)
//테스트 10 〉    통과 (0.16ms, 16.5MB)
//테스트 11 〉    통과 (0.11ms, 16.3MB)
//테스트 12 〉    통과 (0.11ms, 16.6MB)
//테스트 13 〉    통과 (0.11ms, 16.5MB)
//테스트 14 〉    통과 (0.13ms, 16.5MB)
//테스트 15 〉    통과 (0.17ms, 16.2MB)
//테스트 16 〉    통과 (0.12ms, 16.3MB)
//테스트 17 〉    통과 (0.11ms, 16.5MB)
//테스트 18 〉    통과 (0.17ms, 16.3MB)
//테스트 19 〉    통과 (0.12ms, 16.6MB)
//테스트 20 〉    통과 (0.11ms, 16.4MB)
//func sweat(_ n: Int, _ lost: [Int], _ reserve: [Int]) -> Int {
//    var losted = lost.filter{!reserve.contains($0)}
//    var reserved = reserve.filter{!lost.contains($0)}
//
//    var ans = n - losted.count
//
//    for i in 0..<losted.count {
//        var has: Int?
//
//        for j in 0..<reserved.count {
//            if losted[i] == reserved[j] - 1 || losted[i] == reserved[j] + 1 {
//                has = j
//                break
//            }
//        }
//
//        if let index = has {
//            reserved.remove(at: index)
//            ans += 1
//        }
//    }
//
//    return ans
//}

/// MARK2
//func sweat(_ n: Int, _ lost: [Int], _ reserve: [Int]) -> Int {
//    var newReserve = reserve.filter { !lost.contains($0) }.sorted()
//    let newLost = lost.filter { !reserve.contains($0) }.sorted()
//    var result = n - newLost.count
//
//    for i in 0 ..< newLost.count {
//        if newLost[i] > 1, let removeIndex = newReserve.indices.filter({ newReserve[$0] == newLost[i] - 1 }).first {
//            newReserve.remove(at: removeIndex)
//            result += 1
//        } else if newLost[i] < n, let removeIndex = newReserve.indices.filter({ newReserve[$0] == newLost[i] + 1 }).first {
//            newReserve.remove(at: removeIndex)
//            result += 1
//        }
//    }
//
//    return result
//}

/// MARK1
//func sweat(_ n: Int, _ lost: [Int], _ reserve: [Int]) -> Int {
//    var result = n - lost.count
//    var reserve = reserve.sorted()
//    var lost = lost.sorted()
//
//    var i = 0
//    while i < lost.count {
//        if let removeIndex = reserve.indices.filter({ reserve[$0] == lost[i] }).first {
//            reserve.remove(at: removeIndex)
//            result += 1
//            lost.remove(at: i)
//        } else { i += 1 }
//    }
//
//    for i in 0 ..< lost.count {
//        if lost[i] > 1, let removeIndex = reserve.indices.filter({ reserve[$0] == lost[i] - 1 }).first {
//            reserve.remove(at: removeIndex)
//            result += 1
//        } else if lost[i] < n, let removeIndex = reserve.indices.filter({ reserve[$0] == lost[i] + 1 }).first {
//            reserve.remove(at: removeIndex)
//            result += 1
//        }
//    }
//
//    return result
//}
