function solution(n) {
  var answer = '';
  let keyword = ["박", "수"];
  for (let i = 1; i <= n; i++){
    answer = `${answer}${keyword[i % 2]}`
  }
  return answer;
}

console.log(solution(7))