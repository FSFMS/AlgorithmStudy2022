function solution(s) {
  const words = s.split(' ')
  const answer = words.map((item) => {
    let word = '';
    for (let i = 0; i < item.length; i++) {
      const c = i % 2 !== 1 ? item[i].toUpperCase() : item[i].toLowerCase();
      word = `${word}${c}`;
    }
    return word;
  }).join(' ');
  return answer;
}

console.log(solution('try hello world'))