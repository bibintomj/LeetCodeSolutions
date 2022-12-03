/**

 Given two binary strings a and b, return their sum as a binary string.



 Example 1:

 Input: a = "11", b = "1"
 Output: "100"
 Example 2:

 Input: a = "1010", b = "1011"
 Output: "10101"


 Constraints:

 1 <= a.length, b.length <= 104
 a and b consist only of '0' or '1' characters.
 Each string does not contain leading zeros except for the zero itself.

 */


class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        switch (a,b) {
        case ("0","0"): return "0"
        case ("0","1"), ("1","0"): return "1"
        case ("1","1"): return "10"
        default: break
        }

        var currentAIndex: String.Index? = a.index(a.startIndex, offsetBy: a.count - 1)
        var currentBIndex: String.Index? = b.index(b.startIndex, offsetBy: b.count - 1)

        var carry = ""
        var result = ""

        while currentAIndex != nil || currentBIndex != nil {
            let num1 = currentAIndex != nil ? String(a[currentAIndex!]) : "0"
            let num2 = currentBIndex != nil ? String(b[currentBIndex!]) : "0"

            var sum = addBinary(num1, num2)
            if carry != "" {
                sum = addBinary(carry, sum)
                carry = ""
            }

            if sum.count > 1 { // carry exists
                carry = String(sum.first!)
            }
            result = "\(String(sum.last!))\(result)"
            if currentAIndex != nil, currentAIndex! > a.startIndex {
                currentAIndex = a.index(before: currentAIndex!)
            } else {
                currentAIndex = nil
            }
            if currentBIndex != nil, currentBIndex! > b.startIndex {
                currentBIndex = b.index(before: currentBIndex!)
            } else {
                currentBIndex = nil
            }
            if (currentAIndex, currentBIndex) == (nil, nil), carry != "" { result = "\(carry)\(result)" }
        }
        return result
    }
}

print(Solution().addBinary("11", "1") == "100")
print(Solution().addBinary("1010", "1011") == "10101")


