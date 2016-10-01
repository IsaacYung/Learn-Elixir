fizz_buzz = fn
 0, 0, a -> "FizzBuzz"
 0, _, a -> "Fizz"
 _, 0, a -> "Buzz"
 _, _, a -> "Third argument #{a}"
end

IO.puts fizz_buzz.(0,0,2)
