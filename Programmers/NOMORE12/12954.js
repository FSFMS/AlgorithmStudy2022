function solution(x, n) {

  return Array(n).fill(1).map((item, index) => (index + 1) * x);
}

console.log(solution(2, 5))