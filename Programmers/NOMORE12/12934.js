function solution(n) {
  const pow = Math.pow(n, 1 / 2);
  const value = String(pow).includes('.') ? -1 : pow;
  if (value === -1) return -1;
  else return Math.pow(value + 1, 2)
}

console.log(solution(16))