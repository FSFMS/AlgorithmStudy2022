# 그리디 알고리즘

그리디 알고리즘이란 '현재 상황에서 지금 당장 좋은 것만 고르는 방법'을 의미한다. 코딩테스트에서의 그리디 알고리즘의 유형은 사전에 외우고 있지 않아도 풀 수 있을 가능성이 높은 문제 유형이라는 특징이 있다. 그리디 알고리즘은 창의력, 즉 문제를 풀기위한 최소한의 아이디어를 떠올릴 수 있는 능력을 요구한다.

> 순발력이 중요한 문제 타입.

## 문제풀이

### 거스름돈

```javascript
let n = 1260;
let count = 0;

let coinTypes = [500, 100, 50, 10];
coinTypes.forEach((item) => {
  count = count + 1;
  n = n % coin;
})
```

### 큰 수의 법칙

```javascript
function bicNumber(arr1, arr2) {
  const n = arr1[0];
  const m = arr1[1];
  const k = arr1[2];

  const numberArr = arr2.sort((pre, cur) => pre > cur ? -1 : 1);
  const first = numberArr[0];
  const second = numberArr[1];

  let result = 0;
  let multi = k;
  let iter = Math.ceil(m / (k + 1));

  if (m % (k + 1) !== 0) {
    result = (first * multi + second) * (iter - 1) + first * m % (k + 1);
  }
  else {
    result = (first * multi + second) * iter;
  }

  return result;
}
```

### 숫자 카드 게임

```javascript
function numberCardGame(m, n, data) {
  let number = 10001;
  data.forEach((item) => {
    const arr = item.sort((pre, cur) => pre > cur ? 1 : -1);
    number = number === 0 ? arr[0] : number < arr[0] ? arr[0] : number;
  })
  return number;
}
```

### 1이 될 때까지

```javascript
function toNumberOne(n, k) {
  let result = 0;
  while (true) {
    if (n % k === 0) {
      n = n / k;
    } else {
      n = n - 1;
    }
    result++;
    if (n <= 1) break;
  }
  return result;
}
```
