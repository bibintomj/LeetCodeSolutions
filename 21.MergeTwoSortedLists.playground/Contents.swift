/**

 You are given the heads of two sorted linked lists list1 and list2.

 Merge the two lists in a one sorted list. The list should be made by splicing together the nodes of the first two lists.

 Return the head of the merged linked list.

 Input: list1 = [1,2,4], list2 = [1,3,4]
 Output: [1,1,2,3,4,4]

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
    struct Rack {
        var currentNodeInList1: ListNode?
        var currentNodeInList2: ListNode?
    }

    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var finalList: ListNode?
        var finalHead: ListNode?
        var rack = Rack(currentNodeInList1: list1, currentNodeInList2: list2)

        var parsingInProgress = true

        while parsingInProgress {
            var keypathToMinimumList = keypathToMinimumList(in: rack)
            guard keypathToMinimumList != nil else {
                parsingInProgress = false
                return finalHead
            }
            if finalList == nil {
                finalList = rack[keyPath: keypathToMinimumList!]
                finalHead = finalList
            }
            else {
                finalList?.next = rack[keyPath: keypathToMinimumList!]
                finalList = finalList?.next
            }
            rack[keyPath: keypathToMinimumList!] = rack[keyPath: keypathToMinimumList!]?.next
        }

        return finalHead
    }

    func keypathToMinimumList(in rack: Rack) -> WritableKeyPath<Solution.Rack, ListNode?>? {
        switch (rack.currentNodeInList1, rack.currentNodeInList2) {
        case (nil, nil): return nil
        case (.some(_), nil): return \.currentNodeInList1
        case (nil, .some(_)): return \.currentNodeInList2
        case (.some(let list1), .some(let list2)): return list1.val < list2.val ? \.currentNodeInList1 : \.currentNodeInList2
        }
    }
}

// Most Efficient Solution

/**

 struct Solution {
 func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
 guard let list1 = list1 else { return list2 }
 guard let list2 = list2 else { return list1 }

 if list1.val < list2.val {
 let node = list1
 node.next = mergeTwoLists(list1.next, list2)
 return node
 } else {
 let node = list2
 node.next = mergeTwoLists(list1, list2.next)
 return node
 }
 }
 }

 */

let a = ListNode(1)
let c = ListNode(3)
let e = ListNode(5)
let g = ListNode(7)

a.next = c
c.next = e
e.next = g

let b = ListNode(2)
let d = ListNode(4)
let f = ListNode(6)
let h = ListNode(8)
let i = ListNode(9)
let j = ListNode(10)
let k = ListNode(11)

b.next = d
d.next = f
f.next = h
h.next = i
i.next = j
j.next = k

var final = Solution().mergeTwoLists(a, b)

while final != nil {
    print("\(final?.val ?? 0)")
    final = final?.next
}

