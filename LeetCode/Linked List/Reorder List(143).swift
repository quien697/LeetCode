//
//  Reorder List(143).swift
//  LeetCode
//
//  Created by Quien on 2023/7/17.
//

import Foundation

/**
 ** 143. Reorder List
 ** https://leetcode.com/problems/reorder-list/
 */

/// Time Complexity : O(N)
/// Space Complexity : S(1)
/// Detail :
/// 1. Find middle of ListNode
/// 2. Get reversed ListNode
/// 3. Merge head and Reversed ListNode
func reorderList(_ head: ListNode?) {
  guard head != nil else { return }
  
  let mid  = findMiddleNode(head)
  let list1 = head
  let list2 = getReversedList(mid)
  mergeLists(list1, list2)
}

func findMiddleNode(_ head: ListNode?) -> ListNode? {
  var slow = head
  var fast = head
  while fast?.next != nil {
    slow = slow?.next
    fast = fast?.next?.next
  }
  return slow
}

func getReversedList(_ head: ListNode?) -> ListNode? {
  var temp: ListNode? = nil
  var pre: ListNode? = nil
  var cur: ListNode? = head
  while cur != nil {
    temp = cur?.next
    cur?.next = pre
    pre = cur
    cur = temp
  }
  return pre
}

func mergeLists(_ list1: ListNode?, _ list2: ListNode?) {
  var list1 = list1
  var list2 = list2
  var temp: ListNode? = nil
  while list2?.next != nil {
    temp = list1?.next
    list1?.next = list2
    list1 = temp
    
    temp = list2?.next
    list2?.next = list1
    list2 = temp
  }
}
