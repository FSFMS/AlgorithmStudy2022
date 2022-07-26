function solution(arr) {
  let sum = arr.reduce((prev, curr) => prev + curr)
  console.log(sum)
  return sum / arr.length;
}

console.log(solution([1,2,3,4]))