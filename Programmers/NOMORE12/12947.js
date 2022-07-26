function solution(x) {
  let a = String(x).split('');
  let sum = a.reduce((prev, curr) => Number(prev) + Number(curr));
  return x % sum === 0 ? true : false;
}

console.log(solution(13));