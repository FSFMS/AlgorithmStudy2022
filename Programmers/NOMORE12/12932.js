function solution(n) {
  var answer = [];
  answer = String(n).split('').reverse().map((item) => Number(item))
  return answer;
}

console.log(solution(12345))