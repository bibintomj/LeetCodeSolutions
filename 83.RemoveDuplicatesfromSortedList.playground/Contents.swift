/**

 Given the head of a sorted linked list, delete all duplicates such that each element appears only once. Return the linked list sorted as well.



 Example 1:
 Input: head = [1,1,2]
 Output: [1,2]

 Example 2:
 Input: head = [1,1,2,3,3]
 Output: [1,2,3]


 Constraints:
 The number of nodes in the list is in the range [0, 300].
 -100 <= Node.val <= 100
 The list is guaranteed to be sorted in ascending order.

 */

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?

    public init(_ val: Int = 0, _ next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
}

class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var current = head
        var dummyHead = current
        while current != nil {
            if current?.val == current?.next?.val {
                current?.next = current?.next?.next
            } else {
                current = current?.next
            }
        }
        return dummyHead
    }
}

let a = ListNode(1)
let b = ListNode(1)
let c = ListNode(2)
let d = ListNode(2)
let e = ListNode(5)
let f = ListNode(6)
let g = ListNode(7)
let h = ListNode(7)
let i = ListNode(9)
let j = ListNode(10)
let k = ListNode(10)

a.next = b
b.next = c
c.next = d
d.next = e
e.next = f
f.next = g
g.next = h
h.next = i
i.next = j
j.next = k


var final = Solution().deleteDuplicates(a)

while final != nil {
    print("\(final?.val ?? 0)")
    final = final?.next
}

