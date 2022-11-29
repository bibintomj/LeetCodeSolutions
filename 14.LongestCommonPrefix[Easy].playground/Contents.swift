/**

 Write a function to find the longest common prefix string amongst an array of strings.

 If there is no common prefix, return an empty string "".



 Example 1:

 Input: strs = ["flower","flow","flight"]
 Output: "fl"
 Example 2:

 Input: strs = ["dog","racecar","car"]
 Output: ""
 Explanation: There is no common prefix among the input strings.


 Constraints:

 1 <= strs.length <= 200
 0 <= strs[i].length <= 200
 strs[i] consists of only lowercase English letters.

 */


class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard !strs.isEmpty else { return "" }

        var reference = strs.first!
        var referenceIndex = reference.startIndex
        var matchedPrefix = ""

        while referenceIndex < reference.endIndex {
            let prefixToCheck = String(reference[...referenceIndex])
            if strs[1...].allSatisfy({ $0.hasPrefix(prefixToCheck) }) {
                referenceIndex = reference.index(after: referenceIndex)
                matchedPrefix = prefixToCheck
            } else {
                return matchedPrefix
            }
        }

        return matchedPrefix
    }
}

print(Solution().longestCommonPrefix(["flower","flow","flight"]))

