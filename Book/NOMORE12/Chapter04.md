# 구현

흔히 문제 해결 분야에서 구현 유형의 문제는 '풀이를 떠올리는 것은 쉽지만 소스코드로 옮기기 어려운 문제'를 의미한다.

> 머리속의 알고리즘을 소스 코드로 구현해야 한다. 일단,컴퓨팅 파워와 기본 라이브러리 등을 이용해서 푸는 것을 시도 할 수 있다.
> 구현 시 메모리 제약 사항을 고려.

## 문제

### 상하좌우

```javascript
function upDownLeftRight(n, direction) {
  let map = [];
  // 맵을 만든다.
  for (let i = 0; i < n; i++) {
    let row = [];
    for (let k = 0; k < n; k++) {
      row.push([k + 1, i + 1]);
    }
    map.push(row)
  }
  
  let current = [1, 1];
  direction.forEach(item => {
    const cur = isMoveable(current, item);
    current = !cur ? current : cur;
  })
  
  return current;
}

function isMoveable(cur, dir, n) {
  let direction;
  switch (dir) {
    case 'R':
      direction = [1, 0];
      break;
    case 'L':
      direction = [-1, 0];
      break;
    case 'U':
      direction = [0, -1];
      break;
    case 'D':
      direction = [0, 1];
      break;
    default:
      direction = [0, 0];
  }

const result = [cur[0] + direction[0], cur[1] + direction[1]];

  if (result[0] > n || result[1] > n || result[0] < 1 || result[1] < 1) {
    return cur;
  }
  return result;
}
```

### 시각

```javascript
function solution(n) {
  let count = 0;
  for (let h = 0; h <= n; h++) {
    for (let m = 1; m <= 60; m++) {
      for (let s = 1; s <= 60; s++) {
        const time = `${h}:${m}:${s}`;
        count = time.includes('3') ? count + 1 : count;
      }
    }
  }
  return count;
}
```

### 왕실의 나이트

```javascript
function solution(pos) {
  const knightMove = [[2, -1], [2, 1], [-2, 1], [-2, 1], [1, 2], [1, -2], [-1, 2], [1, -2]];
  let count = 0;
  for (let i = 0; i < knightMove.length; i++) {
    const isMove = isMoveable(pos, knightMove[i][0], knightMove[i][1]);
    count = isMove ? count + 1 : count;
  }
  return count;
}

function isMoveable(curr, x, y) {
  const current = [curr[0] + x, curr[1] + y];
  if (current[0] > 8 || current[0] < 1 || current[1] > 8 || current[1] < 1) {
    return false;
  }
  return true;
}
```

### 게임개발

```javascript
function solution(n, m, pos, gameMap) {
  const dx = [-1, 0, 1, 0];
  const dy = [0, 1, 0, -1];

  let map = gameMap;
  let x = pos[0];
  let y = pos[1];
  map[x][y] = 1;
  let count = 1;
  let dir = pos[2];
  dirCount = 0;

  while(true) {
    dir = dir - 1;
    dir = dir < 0 ? 3 : dir;

    let nx = x + dx[dir];
    let ny = y + dy[dir];

    if (map[nx][ny] === 0) {
      map[nx][ny] = 1;
      x = nx;
      y = ny;
      count = count + 1;
      dirCount = 0;
      continue;
    } else {
      dirCount = dirCount + 1;
    }

    if (dirCount == 4) {
      nx = x - dx[dir];
      ny = y - dy[dir];

      if (map[nx][ny] === 0) {
        x = nx;
        y = ny;
      } else {
        break;
      }
      dirCount = 0;
    }
  }
  return count;
}
```
