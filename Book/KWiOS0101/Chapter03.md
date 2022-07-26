그리디 알고리즘

```
1. 탐욕법이라고도 하며 현재 상황에서 지금 당장 좋은 것만 고르는 방법
```

그리디 알고리즘을 적용하기 위한 조건

```
1. 탐욕스런 선택 조건과 최적 부분 구조 조건을 만족해야 한다.
2. 위 조건들이 성립하지 않는다면 그리디 알고리즘은 최적해를 구하지 못한다.
3. 하지만 이런 경우에도 그리디 알고리즘은 근사 알고리즘으로 사용 가능하며 속도가 빨라 실용적으로 사용 할 수 있다.
```

근사 알고리즘

```
1. 어떤 최적화 문제에 대한 해의 근사값을 구하는 알고리즘
```

---

문제 

1\. 거스름돈

```swift
let coins = [500,100,50,10]
var n = 1260
var count = 0

for coin in coins {
    while n >= coin {
        count += 1
        n = n - coin
    }
}

print(count) // 6
```

2\. 큰 수의 법칙

예시 1)

```swift
let arr = [2,4,5,4,6].sorted()
let n = 5 // 배열의 크기
let m = 8 // 최대 반복 횟수
let k = 3 // 연속으로 더할수 있는 횟수

let first = arr[n - 1] // 제일 큰 수 
let second = arr[n - 2] // 그다음 큰 수 

var result = 0
var count = 0
    
for i in 1...m { 
    if count == k {
        result += second
        count = 0
    } else {
        result += first
        count += 1
    }
}
print(result) // 46

// 시간 -> 0.0010700225830078125
```

예시 2)

```swift
let arr = [3,4,3,4,3].sorted()
let n = 5 // 배열의 크기
let m = 7 // 최대 반복 횟수
let k = 2 // 연속으로 더할수 있는 횟수

let first = arr[n - 1] // 제일 큰 수 
let second = arr[n - 2] // 그다음 큰 수 

var result = 0
var count = 0
    
for i in 1...m { 
    if count == k {
        result += second
        count = 0
    } else {
        result += first
        count += 1
    }
}
print(result) // 28
// 시간 -> 0.000885009765625
```

m = 100억 일때 예시 1) 

```swift
let arr = [2,4,5,4,6].sorted()
let n = 5 // 배열 크기
let m = 8 // 더하는 횟수
let k = 3 // 연속으로 더할 수 있는 횟수

let first = arr[n - 1] // 6
let second = arr[n - 2] // 5

var result = 0
var count = 0

// m = 8일때, 반복되는 수열 [6,6,6,5],[6,6,6,5]
// 6이 더해지는 횟수 6번
let firstCount = m / (k + 1) * k
// 나누어 떨어지지 않았을 때 큰수 더해지는 횟수 0번
let secondCount = m % (k + 1)

// 최종 큰 수 더하는 횟수 6번
let sumFirst = firstCount + secondCount

// 두번째로 큰 수 더하는 횟수 2번
let sumSeconde = m - sumFirst

// 제일 큰 수 더하기
result += sumFirst * first
// 두 번째로 큰 수 더하기 
result += sumSeconde * second

print(result) // 46
```

m = 100억 일때 예시 2) 

```swift
let arr = [2,4,5,4,6].sorted()
let n = 5 // 배열 크기
let m = 7 // 더하는 총 횟수
let k = 2 // 연속으로 더할 수 있는 횟수

let first = arr[n - 1] // 6
let second = arr[n - 2] // 5

var result = 0
var count = 0

// m = 7 일때, 반복되는 수열 [6,6,5],[6,6,5],[6]

// 6이 더해지는 횟수 4번
let firstCount = m / (k + 1) * k

// 나누어 떨어지지 않았을 때 큰수 더해지는 횟수 1번
let secondCount = m % (k + 1)

// 최종 큰 수 더하는 횟수 5번
let sumFirst = firstCount + secondCount

// 두번째로 큰 수 더하는 횟수 2번
let sumSeconde = m - sumFirst

// 제일 큰 수 더하기
result += sumFirst * first
// 두 번째로 큰 수 더하기
result += sumSeconde * second

//print(result) // 40
```

3\. 숫자 카드 게임

예시 1)

```swift
let arr = [[3,1,2],[4,1,4],[2,2,2]]
let n = 3
let m = 3

var result = 0

for i in 0..<n {
    if i == n - 1 {
        if let min = arr[i].min() {
            result = min
        }
    }
}

print(result) // 2
```

예시 2)

```swift
let arr = [[7,3,1,8],[3,3,3,4]]
let n = 2
let m = 4

var result = 0

for i in 0..<n {
    if i == n - 1 {
        if let min = arr[i].min() {
            result = min
        }
    }
}

print(result) // 3
```

4\. 1이 될 때까지 

```swift
var n = 25
let k = 5
var count = 0

while true {
    if n % k != 0 {
        n = n - 1
        count += 1
    } else {
        n = n / k
        count += 1
    }
    
    if n == 1 {
        break
    }
}

print(count) // 2
```
