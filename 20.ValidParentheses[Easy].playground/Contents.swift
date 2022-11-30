/**

 Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:

 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
 Every close bracket has a corresponding open bracket of the same type.


 Example 1:

 Input: s = "()"
 Output: true
 Example 2:

 Input: s = "()[]{}"
 Output: true
 Example 3:

 Input: s = "(]"
 Output: false


 Constraints:

 1 <= s.length <= 104
 s consists of parentheses only '()[]{}'.

 */


class Solution {
    func isValid(_ s: String) -> Bool {
        guard s.count % 2 == 0 else { return false }
        let reference = ["[": "]", "(": ")", "{": "}"]
        var trackString = ""

        var currentIndex = s.startIndex


        while currentIndex < s.endIndex {
            let bracket = String(s[currentIndex])
            let isOpenBracket = reference[bracket] != nil
            if !isOpenBracket && trackString.isEmpty { return false }

            if isOpenBracket {
                trackString += bracket
            } else {
                if reference[String(trackString.last!)] == bracket {
                    trackString.removeLast()
                } else { return false }
            }
            currentIndex = s.index(after: currentIndex)
        }
        return trackString.isEmpty
    }
}

print(Solution().isValid("()[]{}"))
print(Solution().isValid("(]"))
print(Solution().isValid("){"))
print(Solution().isValid("([)]"))

