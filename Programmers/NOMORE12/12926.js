function solution(s, n) {
  const lower = 'abcdefghijklmnopqrstuvwxyz'
  const upper = lower.toUpperCase();
  const ascArr = s.split('').map((item) => {
    if (item === ' ') return item;
    const ss = lower.includes(item) ? lower : upper;
    const index = ss.indexOf(item);
    const replace = index + n >= ss.length ?
      index + n - ss.length :
      index + n;
    const char = ss[replace];
    return char;
  })

  return ascArr.join('');
}

console.log(solution('AXYZ', 3));