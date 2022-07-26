# 탐색 알고리즘

> *DFS*
>
> 깊이 우선 탐색이라고 부르며, 노드의 자식을 우선적으로 탐색하는 알고리즘. 노드를 스택 처리하여 재귀적으로 탐색한다.

> *BFS*
>
> 너비 우선 탐색이라고 부르며, 노드의 형제를 우선적으로 탐색하는 알고리즘. 노드를 큐에 넣은 뒤 순서대로 탐색한다.

## 문제

### 음료수 얼려먹기

```javascript
function solution(arr) {
  const height = arr.length;
  const width = arr[0].length;

  let result = 0;
  let [x, y] = [0, 0];
  for(let i = 0; i < height; i++) {
    for(let j = 0; j < width; j++) {
      if(dfs(arr, j, i, width, height)) {
        result = result + 1;
      }
    }
  }
  return result;
}

function dfs(graph, x, y, width, height) {
  if(x < 0 || y < 0 || x >= width || y >= height) {
    return false;
  }

  if(graph[y][x] === 0) {
    graph[y][x] = 1;
    dfs(graph, x - 1, y, width, height);
    dfs(graph, x + 1, y, width, height);
    dfs(graph, x, y - 1, width, height);
    dfs(graph, x, y + 1, width, height);
    return true;
  } 
  return false;
}
```

### 미로 탈출

```javascript
function bfs(x, y, maze) {
  const height = maze.length;
  const width = maze[0].length;

  const dx = [-1, 1, 0, 0];
  const dy = [0, 0, -1, 1];

  if(x < 0 || y < 0 || x >= width || y >= height) {
    return false;
  }

  const queue = [];
  queue.push([0, 0]);
  while(queue.length > 0) {
    const [posX, posY] = queue.shift();
    for(let i = 0; i < 4; i++) {
      const [nX, nY] = [posX + dx[i], posY + dy[i]];
      
      if(nX < 0 || nY < 0 || nX >= width || nY >= height) {
        continue;
      }

      if(maze[nY][nX] === 0) continue;

      if(maze[nY][nX] === 1) {
        maze[nY][nX] = maze[posY][posX] + 1;
        queue.push([nX, nY]);
      }
    }
    
  }

  return maze[x][y];
}
```

### 타겟 넘버

```javascript
function targetNumber(numbers, target) {
  let count = 0;
  const multiply = [1, -1];

  multiply.forEach((item) => {
    dfs(0, item, 0);
  })

  function dfs(idx, mult, sum) {
    if(idx === numbers.length) {
      if(sum === target) {
        count = count + 1;
      }
      return;
    }

    sum = sum + numbers[idx] * mult;
    dfs(idx + 1, 1, sum);
    dfs(idx + 1, -1, sum);
  }

  return count / 2;
}
```
