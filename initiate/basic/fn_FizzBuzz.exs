fizz_buzz = fn
 0, 0, a -> "FizzBuzz"
 0, _, a -> "Fizz"
 _, 0, a -> "Buzz"
 _, _, a -> "#{a}"
end

call_fizz = fn n ->
              fizz_buzz.(rem(n,3),rem(n,5),n)
            end

IO.puts fizz_buzz.(0,0,2)
