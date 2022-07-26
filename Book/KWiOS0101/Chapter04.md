구현 알고리즘

```
머릿속에 있는 알고리즘을 소스코드로 바꾸는 과정
```

구현 문제

```
구현 유형의 문제는 풀이를 떠올리는 것은 쉽지만 소스코드로 옮기기 어려운 문제를 말한다.
문제 유형으로는 완전탐색, 시뮬레이션 유형이 있다.
```

구현하기 어려운 문제

```
1. 알고리즘은 간단하나 코드가 지나치게 긴 문제
2. 특정 소수점 자리까지 출력해야하는 문제
3. 문자열이 입력으로 주어졌을 때 한 문자 단위로 끊어서 리스트에 넣어야 하는 문제 등등
* 구현 문제를 조금더 쉽게 풀기 위해서는 문법 숙지와 라이브러리 경험이 필요하다.
```

---

문제

1\. 상하좌우

```swift
let n = 5
let move = ["R","R","R","U","D","D"]
var map = Array(repeating: Array(repeating: [Int](), count:n) ,count:n)

var start = [1,1]

let dx = [0,0,-1,1]
let dy = [-1,1,0,0]

for i in 0..<n {
    for j in 0..<n {
        map[i][j].append(contentsOf: [i+1,j+1])
    }
    print(map[i])
}

for i in move {
    switch i {
    case "L":
        if start[1] + dy[0] == 0 {
            continue
        } else {
            start[0] = start[0] + dx[0]
            start[1] = start[1] + dy[0]
        }
    case "R":
        if start[1] + dy[1] == 0 {
            continue
        } else {
            start[0] = start[0] + dx[1]
            start[1] = start[1] + dy[1]
        }
    case "U":
        if start[0] + dx[2] == 0 {
            continue
        } else {
            start[0] = start[0] + dx[2]
            start[1] = start[1] + dy[2]
        }
    case "D":
        if start[0] + dx[3] == 0 {
            continue
        } else {
            start[0] = start[0] + dx[3]
            start[1] = start[1] + dy[3]
        }
    default:
        break
    }
}
print(start) // [3,4]
```

2\. 시각

```swift
for i in 0...n {
    for j in 0..<60 {
        for k in 0..<60 {
            let time = String(i) + String(j) + String(k)
            if time.contains("3") {
                count += 1
            }
        }
    }
}

print(count) // 11475
```

3\. 왕실의 나이트

```swift
let input = "a1"
let startArr = input.map{String($0)}
    
let moves = [[1,2],[-1,2],[1,-2],[-1,-2],[-2,-1],[-2,1],[2,-1],[2,1]]
    
let chars = ["a","b","c","d","e","f","g","h"]
let nums = [1,2,3,4,5,6,7,8]
    
let c = nums.firstIndex(of: Int(startArr[1])!)
let s = chars.firstIndex(of: startArr[0])
    
var count = 0
    
let startXY = [c!,s!]

for i in 0..<moves.count { 
    let nextRow = startXY[0] + moves[i][0]
    let nextColumn = startXY[1] + moves[i][1]
        
    if nextRow >= 0 && nextRow <= 7 && nextColumn >= 0 && nextColumn <= 7 {
        count += 1
    }
}

print(count)
```

4\. 게임 개발

```swift
// 초기 입력값
let n = 4
let m = 4
let input = "1 1 0"
let inputMap = [[1,1,1,1],[1,0,0,1],[1,1,0,1],[1,1,1,1]]

var map = Array(repeating: Array(repeating: [Int](), count: n), count: m)

var start = input.components(separatedBy: " ").dropLast().map{Int($0)!}
var direction = Int(String(input.last!))!

// 북 동 남 서
// 0 1 2 3
let step = [[-1,0],[0,1],[1,0],[0,-1]]

/*
 [[1], [1], [1], [1]]
 [[1], [0], [0], [1]]
 [[1], [1], [0], [1]]
 [[1], [1], [1], [1]]
 */
// 맵 바다 육지 초기화
for i in 0..<n {
    for j in 0..<m {
        map[i][j] = [inputMap[i][j]]
    }
}

// 시작 위치 방문했으므로 1로 변경
map[start[0]][start[1]] = [1]
// 육지로 이동한 카운트 증가
var result = 1

// 이동 시도한 횟수
var count = 0


while true {
    // 방향 90도 회전
    switch direction {
    case 0:
        direction = 3
    case 1:
        direction = 0
    case 2:
        direction = 1
    case 3:
        direction = 2
    default:
        break
    }
    
    // 회전한 방향으로 가기위해 계산해야할 좌표값
    let move = step[direction]
    
    // 이동할 최종 위치 좌표값
    let dx = start[0] + move[0]
    let dy = start[1] + move[1]
    
    
    if count == 4 {
        break
    } else if dx >= 0 && dy >= 0 && dx <= 3 && dy <= 3 {
        if map[dx][dy].first! == 0 {
            map[dx][dy] = [1] // 방문했으므로 1로 변경
            start = [dx,dy] // 시작위치 초기화
            count = 0 // 카운트 초기화
            result += 1 // 이동한 카운트 증가
            continue
        } else {
            count += 1 // 이미 방문한 위치이므로 카운트만 증가
            continue
        }
    } else {
        count += 1 // 범위를 벗어났으므로 카운트만 증가
        continue
    }
}

print(result) // 3
```
