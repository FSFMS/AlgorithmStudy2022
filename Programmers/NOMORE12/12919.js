// seoul	return
// ["Jane", "Kim"]	"김서방은 1에 있다"

function solution(seoul) {
  var answer = '';
  var index = 0;
  seoul.forEach((item, idx) => {
    if (item === "Kim") index = idx;
  })
  answer = `김서방은 ${index}에 있다`

  return answer;
}

console.log(solution(["Jane","Jane","Jane","Jane","Jane","Jane", "Kim"]))