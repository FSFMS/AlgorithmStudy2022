### 정렬
```
데이터를 특정하 기준에 따라서 순서대로 나열하는것으로 이진 탐색으 전처리 과정이기도 하다.
```

### 선택 정렬 
```
선택 정렬은 배열에서 가장 작은 데이터를 선택하여 앞으로 내보내는 정렬 알고리즘이다.
가장 원시적이 방법으로 아래 과정을 반복하면 전체 데이터의 정렬이 이루어진다.

과정
1. 주어진 리스트 중에 최소값을 찾는다.
2. 그 값을 맨 앞에 위치한 값과 교체한다.
3. 맨처음 위치를 뺀 나머지 리스트를 같은 방법으로 교체한다.
```

### 삽입 정렬
```
삽입 정렬은 필요할때마다 각 데이터를 적절한 위치에 삽입하는 정렬 알고리즘이다.
특정한 데이터가 적절한 위치에 들어가기 이전에, 그 앞까지의 데이터는 정렬되어 있다고 가정한다.
아래 과정을 반복하면 전체 데이터의 정렬이 이루어 진다.

1. 현재 선택된 데이터와 이전 위치에 있는 데이터들을 비교한다. (맨처음 시작하는 데이터는 두번째 데이터부터 시작)
2. 선택된 데이터가 이전 위치에 있던 데이터보다 작다면 위치를 서로 교환한다.
3. 다음 데이터를 1번 과정부터 반복한다.
```

### 퀵 정렬
```
퀵 정렬은 기준을 설정 한 다음 큰 수와 작은 수를 교환 한 후 배열을 반으로 나누는 방식으로 동작하는 정렬 알고리즘이다.
퀵 정렬에서는 큰 숫자와 작은 숫자를 교환할 때 기준이 필요한데 그 기준을 피벗이라고 한다.
※ 일반적으로 첫번째 데이터를 피벗으로 지정한다.
아래 과정을 반복하면 전체 데이터의 정렬이 이루어진다.

과정
1. 리스트 안에 있는 한 요소를 선택한다. (이를 피벗이라고 한다.)
2. 피벗을 기준으로 오른쪽은 피벗보다 큰 데이터, 왼쪽은 피벗보다 작은 데이터를 검색한 후 위치를 서로 교환한다.
3. 위치 교환중 오른쪽 피벗과 왼쪽 피벗이 엇갈릴 경우 작은 데이터와 피벗의 위치를 교환한다.
4. 피벗을 제외한 왼쪽 배열과 오른쪽 배열을 다시 정렬한다. (2번부터 다시 반복) 
5. 왼쪽, 오른쪽 배열을 더이상 분할이 불가능 할 때까지 반복한다.
```

### 계수 정렬
```
데이터들을 서로 비교하지 않고 정렬하는 알고리즘이다.
특정한 조건이 부합할 때만 사용할수 있는 알고리즘으로 그 조건중 하나는 데이터의 크기 범위가 제한되어 정수 형태로 표현할 수 있을 때만 사용 가능하다.
아래 과정을 반복하면 전체 데이터의 정렬이 이루어진다.

과정 
1. 가장 큰 데이터와 가장 작은 데이터를 찾아 해당 범위의 데이터가 모두 담길 수 있도록 하나의 배열을 생성하고 0으로 초기화한다.
2. 데이터를 하나씩 확인하며 데이터의 값과 동일한 인덱스의 데이터를 1씩 증가시킨다.
3. 2번 과정을 반복한다. 
```

***** 

### 문제 풀이

#### 선택정렬

```swift
var arr = [7,5,9,0,3,1,6,2,4,8]

for i in 0..<arr.count {
    // 가장 작은 수의 인덱스 
    let minIndex = arr.firstIndex(of: i)!
    
    // 맨 처음 인덱스부터 + 1 씩 이동하며 작은 수 교환
    let temp = arr[i]
    arr[i] = arr[minIndex]
    arr[minIndex] = temp
}
```

#### 삽입 정렬
```swift
var arr = [7,5,9,0,3,1,6,2,4,8]
// 정렬된 인덱스 카운트 
var leftArrCount = 1

for i in 1..<arr.count {
    // 교환할 데이터
    let target = arr[i]
    
    // 0부터 정렬된 배열까지 반복
    for j in 0..<leftArrCount {
       
           // 교환할 데이터가 정렬되어있는 데이터보다 클 경우 
        if target > arr[j] {
            continue

          // 교환할 데이터가 정렬되어 있는 데이터보다 작을 경우
        } else if target < arr[j] { 

            // 교환할 데이터 삭제
            arr.remove(at: i)
            // 정렬되어 있는 데이터 뒤에 삽입
            arr.insert(target, at: j )
            break
        }
    }
    // 정렬된 데이터 카운트 증가
    leftArrCount += 1
}
```
#### 퀵 정렬
```swift
var arr = [5,7,9,0,3,1,6,2,4,8]

func sort(_ arr: [Int]) -> [Int] {
    
    // 배열이 0이거나 1이면 정렬이 끝났으므로 정렬된 데이터 반환
    if arr.count < 2 {
        return arr
    } else {

        // 배열의 첫번째 데이터 피벗으로
        let pivot = arr.first
        // 피벗보다 작은 데이터 
        let left = arr.filter({$0 < pivot ?? 0})
        // 피벗보다 큰 데이터
        let right = arr.filter({$0 > pivot ?? 0})

        // 작은 데이터배열 + 피벗 + 큰 데이터 배열 
        let result = sort(left) + [pivot ?? 0] + sort(right)
        
        return result
    }
}

print(sort(arr))
```
#### 계수 정렬
```swift
var arr = [7,5,9,0,3,1,6,2,9,1,4,8,0,5,2]

// 데이터중 제일 큰 값 
let max = arr.max()!
// 제일 큰 데이터 + 1 크기 만큼의 배열을 만들고 0으로 초기화
var newArr = Array(repeating: 0, count: max + 1)
var result = ""

// 데이터의 값이 0으로 초기화된 배열의 인덱스와 같을 때 카운트 1씩 증가 
for i in 0..<arr.count {
    let index = arr[i]
    newArr[index] += 1
}

// 각각의 배열의 카운트 값만큼 인덱스 값 출력
for i in 0..<newArr.count {
    for _ in 0..<newArr[i] {
        result += "\(i) "
    }
}
```
#### 위에서 아래로
```swift
// input 
let n = 3
var arr = [15,27,12]
// 정렬 완료된 배열 카운트
var leftArrCount = 1

for i in 1..<n {
    // 교환할 데이터 
    let target = arr[i]
    
    // 0부터 정렬된 배열까지 반복
    for j in 0..<leftArrCount {
        // 교환할 데이터가 정렬되어 있는 데이터보다 작다면 다음 반복 진행
        if target < arr[j] {
            continue
          // 교환할 데이터가 정렬되어 있는 데이터보다 크다면 
        } else if target > arr[j] {
            // 교환할 데이터 삭제
            arr.remove(at: i)
            // 교환할 데이터를 정렬되어 있는 데이터 뒤에 삽입
            arr.insert(target, at: j)
            break
        }
    }

    // 정렬된 배열 카운트 증가
    leftArrCount += 1
}
```
#### 성적이 낮은 순서로 출력하기
```swift
// input
let n = 2
var input = [["홍길동", "95"], ["이순신","77"]]
// (String, Int)타입 튜블 배열 선언
var arr = [(String,Int)]()
// 정렬 완료된 배열 카운트
var leftArrCount = 1

// (String, Int)타입 튜블 배열로 새로운 데이터를 만들고 arr 배열에 추가
for i in 0..<input.count {
    let data = (input[i][0], Int(input[i][1])!)
    arr.append(data)
}

for i in 1..<n {
    // 교환할 데이터 
    let target = arr[i]
    
    // 0부터 정렬된 배열까지 반복
    for j in 0..<leftArrCount {

        // 교환할 점수가 정렬되어있는 점수보다 크다면 다음 반복
        if target.1 > arr[j].1 {
            continue
          // 교환할 점수가 정렬되어 있는 점수보다 작다면 
        } else if target.1 < arr[j].1 {
            // 해당 점수 데이터 삭제
            arr.remove(at: i)
            // 정렬되어 있는 점수 뒤로 삽입
            arr.insert(target, at: j)
            break
        }
    }

    // 정렬 데이터 카운트 증가
    leftArrCount += 1
}
```
#### 두 배열의 원소 교체
```swift
// input
let inputA = [1,2,5,4,3]
let inputB = [5,5,6,6,5]
let n = 5
let k = 3

// a배열 오름차순 정렬
var aArr = inputA.sorted()

// b배열 내림차순 정렬
var bArr = inputB.sorted().reversed().map({$0})

// k번 만큼 반복
for i in 0..<k {
    // a 배열의 데이터값이 b 배열의 데이터값보다 작을때 
    if aArr[i] < bArr[i] {
        // a, b 배열의 데이터 교환
        let temp = aArr[i]
        aArr[i] = bArr[i]
        bArr[i] = temp
    } else {
        break
    }
}
```
#### 가장 큰 수
```swift
// [6, 10, 2]    
// [3, 30, 34, 5, 9]
func solution(_ numbers:[Int]) -> String {
    
    var result = numbers.sorted() { (left, right)  in
        // 610 > 106 이런식으로 내림차순 정렬 되도록
        let a = Int(String(left) + String(right))
        let b = Int(String(right) + String(left))
        return a! > b!
    }
    
    // 배열이 [0,0,0,0]일때 0000으로 결과가 나오므로 0으로 다시 초기화
    if result.first == 0 {
        result = [0]
    }
    
    // result 문자들을 다 더해서 하나의 문자열로 합침
    return result.map{String($0)}.joined()
}

print(solution([6,10,2]))
print(solution([0,0,0,0]))
```
#### H-Index
```swift
// [3, 0, 6, 1, 5]
func solution(_ citations:[Int]) -> Int {
    
    // 인용횟수를 내림차순 정렬
    let sortedCitaions = citations.sorted(by: >)
    var result = 0

    // 인용횟수 배열의 크기만큼 반복
    for i in 0..<sortedCitaions.count {
        // 현재 인덱스값보다 인용횟수가 클때만 카운트 증가
        if i < sortedCitaions[i] {
            result += 1
        }
    }
    
    return result
}
```
