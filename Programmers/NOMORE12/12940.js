function solution(n, m) {
  const result = upFunc(n, m);

  function upFunc(a, b) {
    return (b === 0) ? a : upFunc(b, a % b);
  };

  return [result, (n * m) / result];
}

console.log(solution(2, 5));