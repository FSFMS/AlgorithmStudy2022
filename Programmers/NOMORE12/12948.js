function solution(phone_number) {
	let a = phone_number.length - 4;
	let star = Array(a).fill('*').join('')
	let b = phone_number.substr(phone_number.length - 4, phone_number.length);
  return `${star}${b}`;
}

console.log(solution('01033334444'))