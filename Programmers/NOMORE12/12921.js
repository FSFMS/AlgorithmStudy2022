function solution(n) {
  var answer = 0;
  for (let i = 2; i <= n; i++) {
    answer = isPrime(i) ? answer + 1 : answer;
  }

  function isPrime(number) {
    for (let i = 2; i * i <= number; i++) {
      if (number % i === 0) return false;
    }
    return true;
  }

  return answer;
}

console.log(solution(2500));