/**

 Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

 You must write an algorithm with O(log n) runtime complexity.



 Example 1:

 Input: nums = [1,3,5,6], target = 5
 Output: 2
 Example 2:

 Input: nums = [1,3,5,6], target = 2
 Output: 1
 Example 3:

 Input: nums = [1,3,5,6], target = 7
 Output: 4


 Constraints:

 1 <= nums.length <= 104
 -104 <= nums[i] <= 104
 nums contains distinct values sorted in ascending order.
 -104 <= target <= 104

 */


class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        func search(in slice: ArraySlice<Int>, for target: Int) -> Int {
            guard !slice.isEmpty && target > slice.first!  else { return slice.startIndex }
            guard target <= slice.last! else { return slice.count }

            let midIndex = slice.startIndex + Int(slice.count / 2)
            if target == slice[midIndex] {
                return midIndex
            } else if target < slice[midIndex] {
                if midIndex == slice.startIndex || midIndex == slice.lastIndex(of: slice.last!)! {
                    return midIndex
                } else {
                    return search(in: slice[slice.startIndex...midIndex-1], for: target)
                }
            } else {
                return search(in: slice[midIndex+1...slice.lastIndex(of: slice.last!)!], for: target)
            }
        }
        return search(in: nums[0...], for: target)
    }
}

print(Solution().searchInsert([100,200,300,400,500,600], 400)) // 3
print(Solution().searchInsert([100,200,300,400,500,600], 600)) // 5
print(Solution().searchInsert([100,200,300,400,500,600], 700)) // 6
print(Solution().searchInsert([100,200,300,400,500,600], 450)) // 4
print(Solution().searchInsert([1,2,4,6,8,9,10], 10)) // 6
print(Solution().searchInsert([2,3,5,6,9], 7)) // 4
print(Solution().searchInsert([1,3,5,6], 0)) // 0
print(Solution().searchInsert([1,3,5], 4)) // 2
