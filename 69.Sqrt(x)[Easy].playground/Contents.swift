/**

 Given a non-negative integer x, return the square root of x rounded down to the nearest integer. The returned integer should be non-negative as well.
 You must not use any built-in exponent function or operator.
 For example, do not use pow(x, 0.5) in c++ or x ** 0.5 in python.


 Example 1:
 Input: x = 4
 Output: 2
 Explanation: The square root of 4 is 2, so we return 2.

 Example 2:
 Input: x = 8
 Output: 2
 Explanation: The square root of 8 is 2.82842..., and since we round it down to the nearest integer, 2 is returned.


 Constraints:
 0 <= x <= 231 - 1

 */

// This solution uses Newton Method to find the square root
// root = 0.5 * (delta + (number/delta))

class Solution {
    func mySqrt(_ x: Int) -> Int {
        guard x > 0 else { return 0 }
        let number = Double(x)
        var delta = number
        var root = 0.0
        var count = 0
        while true {
            root = 0.5 * (delta + (number/delta))
            if abs(root-delta) < 1 {
                break
            }
            delta = root
            count += 1
        }
        return Int(root)
    }
}

print(Solution().mySqrt(0))
