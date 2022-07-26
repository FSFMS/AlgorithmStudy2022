function solution(n)
{
    var answer = 0;
    const a = String(n).split('').map((item) => Number(item))
    answer = a.reduce((prev, curr) => prev + curr)
    return answer;
}

console.log(solution(123))