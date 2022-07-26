function solution(n) {
  var answer = 0;
  for (let i = 1; i <= n; i++) {
    answer = n % i === 0 ? answer + i : answer;
  }
  console.log(answer)
  return answer;
}

console.log(solution(5))