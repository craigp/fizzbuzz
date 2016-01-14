for (var i = 1; i <= 100; i++) {
	console.log(
		(out = ((i % 3) ? "" : "Fizz") +
			((i % 5) ? "" : "Buzz")) ? out : i
	);
}
