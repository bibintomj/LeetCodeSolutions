/**
 Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 You can return the answer in any order.



 Example 1:

 Input: nums = [2,7,11,15], target = 9
 Output: [0,1]
 Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
 Example 2:

 Input: nums = [3,2,4], target = 6
 Output: [1,2]
 Example 3:

 Input: nums = [3,3], target = 6
 Output: [0,1]


 Constraints:

 2 <= nums.length <= 104
 -109 <= nums[i] <= 109
 -109 <= target <= 109
 Only one valid answer exists.

 **/


class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var indices: [Int] = []
        var visitedDict: [Int: Int] = [:]

        for index in 0...nums.count - 1 {
            let number = nums[index]
            let expectedSecondNumber = target - number
            if let secondIndex = visitedDict[expectedSecondNumber] {
                indices = [index, secondIndex]
                break
            }
            visitedDict[number] = index
        }
        return indices
    }
}

print(Solution().twoSum([2,7,11,15], 9))
