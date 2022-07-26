function solution(num) {
  var answer = 0;
  let number = num;
  for (let i = 0; i < 500; i++) {
    if (i === 499) answer = -1;
    if (number === 1) {
      answer = i;
      break;
    }
    number = number % 2 === 0 ? number / 2 : number * 3 + 1;
  }
  return answer;
}

console.log(solution(16))