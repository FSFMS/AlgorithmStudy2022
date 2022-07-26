function solution(s) {
  var answer = true;
  if (s.length !== 4 && s.length !== 6) return false;
  // if (!isNaN(s)) return false; // 프로그래머스 11번 케이스를 통과하지 못함. isNaN(s)를 지원하지 않는듯?
  let numbers = '0123456789';
  for (let value of s) {
    answer = numbers.includes(value);
    if (!answer) break;
  }

  return answer;
}

console.log(solution('13033.'))