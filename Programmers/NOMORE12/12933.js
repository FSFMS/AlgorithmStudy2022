function solution(n) {
  var answer = 0;

  const numbers = String(n).split('').sort((prev, curr) => curr - prev).join('');

  return Number(numbers);
}

console.log(solution(12351))