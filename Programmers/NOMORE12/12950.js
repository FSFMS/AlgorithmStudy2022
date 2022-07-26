function solution(arr1, arr2) {
  let result = [];
  for (let i = 0; i < arr1.length; i++) {
    const item = addArray(arr1[i], arr2[i]);
    result.push(item)
  }

  function addArray(a1, a2) {
    const length = a1.length;
    let result = [];
    for (let i = 0; i < length; i++) {
      result.push(a1[i] + a2[i])
    }
    return result;
  }

  return result;
}

console.log(solution([[1],[2]],	[[3],[4]]))