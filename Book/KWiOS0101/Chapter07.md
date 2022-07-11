### 순차 탐색
```
배열안에 있는 특정한 데이터를 찾기 위해 앞에서부터 하나씩 차례대로 확인하는 방법으로 
보통 정렬되지 않은 배열에서 데이터를 찾아야할때 사용한다.
```

#### 순차 탐색 시간 복잡도 
```
순차 탐색 알고리즘은 데이터 정렬 여부와 상관 없이 가장 앞에 있는 원소부터 하나씩 확인해야 하는 특징이 있다.
따라서 데이터의 개수가 N개일 때 최대 N번의 비교 연산이 필요하므로 순차 탐색의 최악의 경우 시간 복잡도는 O(N)이다.
```

#### 코드 구현

```swift
let nameArr = ["Haneul","Jonggu","Dongbin","Taeil","Sangwook"]

let target = "Dongbin"

for i in 0..<nameArr.count {
    if nameArr[i] == target {
        print("\(target)의 위치 = \(i+1)번째")
    }
}

// Dongbin의 위치 = 3번째
```

### 이진 탐색
```
찾으려는 데이터와 중간점 위치에 있는 데이터를 반복적으로 비교해서 원하는 데이터를 찾는 알고리즘으로, 
배열 내부의 데이터가 정렬되어 있어야만 사용할 수 있는 알고리즘이다.
탐색 범위를 절반씩 좁혀가며 데이터를 탐색하는 특징이 있으며, 속도가 빠르다.
```

#### 이진 탐색을 구현하는 방법
```
1. 재귀 함수를 이용하는 방법
2. 단순하게 반복문을 이용하는 방법
```

#### 이진 탐색 시간 복잡도 
```
이진 탐색 알고리즘은 한 단계를 거칠 때마다 확인하는 원소가 평균적으로 절반으로 줄어든다.
즉, 단계마다 2로 나누므로 연산 횟수는 O(𝑙𝑜𝑔N)이 된다.
```

#### 코드 구현 
##### 재귀함수로 구현
```swift
let numArr = [0,2,4,6,8,10,12,14,16,18]
let target = 4

func binarySearch(_ arr: [Int], _ target: Int, _ start: Int, _ end: Int) -> Int {
    // 탈출 조건
    if start > end {
        return 0
    }
    
    // 중간점 계산 (소수점 이하는 무조건 버림)
    let mid = start + end / 2
    
    if numArr[mid] == target { // 현재 위치값이 타겟이랑 같다면
        return mid
    } else if numArr[mid] > target { // 현재 위치값이 타겟보다 크다면
        return binarySearch(numArr, target, start, mid - 1)
    } else { // 현재 위치값이 타겟보다 작으면
        return binarySearch(numArr, target, mid + 1, end)
    }
}

let result = binarySearch(numArr, target, 0, numArr.count - 1)

// 인덱스가 0부터 시작하니까 + 1
print(result + 1) // 3
```

##### 반복문으로 구현
```swift
let numArr = [1,3,5,7,9,11,13,15,17,19]
var start = 0
var end = numArr.count - 1

while true {

    // 탈출 조건 
    if start > end {
        print("없음")
        break
    }
    
    // 중간점 계산 (소수점 이하는 무조건 버림)
    let mid = start + end / 2
    
    // 조건은 위와 같음
    // 현재 위치값과 타겟값이 같으면 반복문 중지
    if numArr[mid] == target { 
        print(mid + 1)
        break
    } else if numArr[mid] > target {
        end = mid - 1
    } else {
        start = mid + 1
    }
}

// 4
```

### 트리 자료구조
```
트리란 그래프의 일종으로 노드들이 나무가지처럼 연결된 비선형 계층적 자료구조이다.
나무를 거꾸로 뒤집은 모양과 유사하며, 대표적인 예로 컴퓨터의 Directory가 있다.
```

#### 트리 자료구조의 주요 특징
```
1. 트리는 부모 노드와 자식 노드의 관계로 표현된다.
2. 트리의 최상단 노드를 루트 노드라고 한다.
3. 트리의 최하단 노드를 단말 노드라고 한다.
4. 트리에서 일부를 떼어내도 트리 구조이며 이를 서브 트리라 한다.
5. 트리는 파일 시스템과 같이 계층적이고 정렬된 데이터를 다루기에 적합하다.
```

### 이진 탐색 트리
```
트리 자료구조 중에서 가장 간단한 형태로 아래 규칙을 따른다.
왼쪽 노드의 값 < 현재 노드의 값 < 오른쪽 노드의 값 
```

*****
### 문제 풀이 
#### 이진 탐색 - 부품 찾기 
```swift
// 입력 예시 
// 5 - 총 부품 수 
// 8 3 7 9 2 - 부품
// 3 - 찾을 부품 수 
// 5 7 9 - 찾을 부품

import Foundation

let n = Int(readLine()!)!
let componentArr = readLine()!.split(separator: " ").map({Int(String($0))!}).sorted()
let m = Int(readLine()!)!
let targetArr = readLine()!.split(separator: " ").map({Int(String($0))!})

var resultArr = [String]()

// 찾을 부품 수만큼 반복
for i in 0..<m {
    
    // 찾을 부품 
    let target = targetArr[i]
    
    // 시작 위치
    var start = 0
    
    // 끝 위치 
    var end = componentArr.count - 1
    
    while true {
        
    // 찾을 부품이 없으면 resultArr배열에 "no" 추가
        if start > end {
            resultArr.append("no")
            break
        }
        
    // 중간점 
        let mid = start + end / 2
        
        if componentArr[mid] == target { // 현재 위치값과 타겟값이 같다면 
            resultArr.append("yes")
            break
        } else if componentArr[mid] > target { // 중간값이 타겟값보다 크다면 
            end = mid - 1
        } else { // 중간값이 타겟값보다 크다면
            start = mid + 1
        }
    }
}

print(resultArr) // ["no", "yes", "yes"]
```

#### 떡볶이 떡 만들기
```swift
// 입력 조건
// 4 6 - 떡 갯수, 떡 길이
// 19 15 10 17

import Foundation

let input = readLine()!.split(separator: " ").map({Int(String($0))!})
var heightArr = readLine()!.split(separator: " ").map({Int(String($0))!})

let n = input[0]
let target = input[1]

var start = 0
var end = heightArr.max()!

while true {
    
    if start > end {
        print("X")
        break
    }
    
    // 중간점
    let mid = start + end / 2
    var result = 0
    
    // 떡의 개별 높이 만큼 반복 
    for i in 0..<n {
    
        // 떡 길이가 중간점보다 크다면 
        if heightArr[i] > mid {
        // result변수에 현재 떡 길이에서 중간길이를 빼고 더해준다.
            result += heightArr[i] - mid
        }
    }
    
    if result == target {
        print(result)
        break
    } else if result > target {
        start = mid + 1
    } else {
        end = mid - 1
    }
}

// 15
```
