# こうするとスタック領域を広げることができる（が、メモリが足りない）
Z = "RUBY_THREAD_VM_STACK_SIZE"
ENV[Z] || exec({Z=> "100000000000"}, 'ruby', $0)

MOD = 1000000007
N = gets.to_i
@memo = []

def fib(n)
  n <= 1 and return 1

  @memo[n] ||= ((fib(n-2) + fib(n-1)).modulo(MOD))
end

p fib(N.pred)

__END__
fib(n-1) + fib(n-2) の場合のスタック
10
  9 8
    8 7
      7 6
        6 5
          5 4
            4 3
              3 2
                2 1
                  1 0

fib(n-2) + fib(n-1) の場合のスタック
10
  8 9
    6 7
      4 5
        2 3
          0 1
