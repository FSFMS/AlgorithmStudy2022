# Binary Search (이진 탐색)

리스트의 중간을 찾아서 나눠가는 방식으로 찾아나가는 탐색.

한번 탐색이 될때마다 리스트의 절반씩 좁혀가므로, 속도가 매우 빠르다.

![](binary-search.png)


## 문제풀이
### 부품 찾기
```Swift
extension Array where Element == Int {
    func binarySearch(_ value: Int) -> Bool {
        var start = 0
        var end = self.count - 1
        
        while start <= end {
            let point = (start + end) / 2
            let target = self[point]
            if target == value { return true }
            else if target > value { end = point - 1 }
            else { start = point + 1 }
        }
        
        return false
    }
}

func solution(_ myList: [Int], _ orderList: [Int]) -> [Bool] {
    // 내 부품들 정렬
    let myList = myList.sorted()
    
    var results = [Bool]()
    
    // 오더 목록대로 반복하여 이진탐색을 함.
    for item in orderList {
        results.append(myList.binarySearch(item))
    }
    
    return results
}
```
### 떡볶이 떡 만들기
```Swift
func solution(_ length: Int, _ items: [Int]) -> Int {
    guard var end = items.max() else { return -1 }
    var start = 0
    
    var result = 0
    
    while start <= end {
        let point = (start + end) / 2
        
        let total = items
            .filter({ $0 > point })
            .reduce(0) { $0 + ($1 - point) }
        
        if total < length { end = point - 1 }
        else {
            result = point
            start = point + 1
        }
    }
    
    return result
}
```