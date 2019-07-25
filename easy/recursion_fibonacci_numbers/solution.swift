//https://www.hackerrank.com/challenges/ctci-fibonacci-numbers/problem
import Foundation

func fibonacci (n: Int) -> Int {
    // Write your code here.
    guard n != 0 else { return 0 }
    guard n != 1 else { return 1 }
    return fibonacci(n: n-1) + fibonacci(n: n-2)
}

// read the integer n
let n = Int(readLine()!)!

// print the nth fibonacci number
print(fibonacci(n: n))