# Dynamic Programming
시간이나 메모리 공간이 매우 많이 필요한, 컴퓨터로도 해결하기 어려운 문제.
다음과 같은 조건이 만족할 때, 사용해볼 법 하다.

* 큰 문제를 작은 문제로 나눌 수 있다.
* 작은 문제에서 구한 정답은 그것을 포함하는 큰 문제에서도 동일하다.

큰 문제를 작게 나누고, 중복적인 연산을 제거하여 문제를 효율적으로 풀어내는 알고리즘 기법.

## 탐욕법과의 차이?
```
탐욕법은 바로바로 답을 도출해내는것을 목표로 풀이를 하는 반면,
다이나믹 프로그래밍은 최대한 효율적(수식, 메모리 공간 등을 이용하여 연산 횟수를 줄이는 등)으로 답을 도출해내는것을 목표로 풀이를 한다.
```

## 메모제이션
캐싱과 동일한 개념으로, 한번 구한 결과를 메모리 공간에 저장후, 같은 식을 다시 호출하면 저장한 값을 그대로 가져오는 기법.

피보나치 수열을 통해 메모제이션과, 메모제이션을 하지 않은 방법을 알아보면..

```Swift
/// 메모제이션을 하지 않은 피보나치 수열 재귀 함수
func nonMemozationFibonacci(_ x: Int) -> Int {
    if x == 1 || x == 2 { return 1 }
    return nonMemozationFibonacci(x - 1) + nonMemozationFibonacci(x - 2)
}
print(nonMemozationFibonacci(50)) /// M1 CPU 기준으로 약 72초의 시간이 소요됨.

/// 메모제이션을 사용한 피보나치 수열 재귀 함수
func memozationFibonacci(_ x: Int, _ list: inout [Int]) -> Int {
    if x == 1 || x == 2 { return 1 }
    
    if list[x] != 0 { return list[x] }
    
    list[x] = memozationFibonacci(x - 1, &list) + memozationFibonacci(x - 2, &list)
    
    return list[x]
}

var list = [Int](repeating: 0, count: 51)
print(memozationFibonacci(50, &list)) /// M1 CPU 기준으로 약 1초의 시간이 소요됨.
```

이처럼 위 코드와 같이 이미 풀었던 연산결과를 저장함으로써, 속도를 비약적으로 줄일수 있음을 확인.

## 탑다운? 바텀업?
메모제이션을 이용한 위 함수처럼 첫 수에서 가장 작은(x에서 2까지)수로 계산해나가는 방법을 탑다운 방식이라고 하며,
반대로 작은 문제에서 기준인 x까지 올라가며 계산하는 방식을 바텀업 방식이라고 하는데, 바텀업 방식으로 피보나치 수열을 풀이하면 다음과 같다.

```Swift
func bottomUpFibonacci(_ x: Int) -> Int {
    var list = [Int](repeating: 0, count: x + 1)
    list[1] = 1
    list[2] = 1
    
    for i in (3 ... x) {
        list[i] = list[i - 1] + list[i - 2]
    }
    
    return list[x]
}

print(bottomUpFibonacci(50)) // M1 CPU 기준으로 1초 미만의 시간이 소요됨.
```

결과 저장용 리스트는 일반적으로 `DP 테이블` 이라고 부르며,
메모제이션은 탑다운 방식에 국한되어 사용하는 표현이다.

## 문제풀이
### 1로 만들기
```Swift
func make1(_ x: Int) -> Int {
    var x = x
    var count = 0
    
    while x > 1 {
        if x % 5 == 0 {
            x /= 5
        } else if x % 3 == 0 {
            x /= 3
        } else if x % 2 == 0 {
            x /= 2
        } else {
            x -= 1
        }
        count += 1
    }
    
    return count
}
```

### 개미전사
```Swift
func antFood(_ foods: [Int]) -> Int {
    var dpTable = [Int](repeating: 0, count: foods.count + 1)
    
    dpTable[0] = foods[0]
    dpTable[1] = max(foods[0], foods[1])
    
    for i in (2 ... foods.count - 1) {
        dpTable[i] = max(dpTable[i - 1], (dpTable[i - 2] + foods[i]))
    }
    
    return dpTable[foods.count - 1]
}
```

### 바닥 공사
```Swift
func tile(_ n: Int) -> Int {
    var dpTable = [Int](repeating: 0, count: 1001)
    dpTable[1] = 1
    dpTable[2] = 3
    
    for i in (3 ... n + 1) {
        dpTable[i] = (dpTable[i - 1] + 2 * dpTable[i - 2] % 796_796)
    }
    
    return dpTable[n]
}
```

### 효율적 화폐 구성
```Swift
func currency(_ currencies: [Int], _ price: Int) -> Int {
    var dpTable = [Int](repeating: 10001, count: price + 1)
    
    dpTable[0] = 0
    
    for i in currencies {
        if i > price { continue }
        for j in (i ... price) {
            if dpTable[j - i] != 10001 {
                dpTable[j] = min(dpTable[j], dpTable[j - i] + 1)
            }
        }
    }
    
    if dpTable[price] == 10001 { return -1 }
    
    return dpTable[price]
}
```