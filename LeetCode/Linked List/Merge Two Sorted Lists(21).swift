//
//  Merge Two Sorted Lists(21).swift
//  LeetCode
//
//  Created by Quien on 2023/7/17.
//

import Foundation

/**
 ** 21. Merge Two Sorted Lists
 ** https://leetcode.com/problems/merge-two-sorted-lists/
 */

/// Time Complexity : O(M+N)
/// Space Complexity : S(1)
func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
  var list1 = list1
  var list2 = list2
  let ans: ListNode = ListNode(-1)
  var node: ListNode = ans
  
  while list1 != nil && list2 != nil {
    if list1!.val <= list2!.val {
      node.next = list1
      list1 = list1!.next
    } else {
      node.next = list2
      list2 = list2!.next
    }
    node = node.next!
  }
  
  node.next = (list1 != nil) ? list1 : list2
  return ans.next
}

/// Time Complexity : O(M+N)
/// Space Complexity : S(1)
/// Algorithm : `Recursion`
func mergeTwoLists2(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
  guard let list1 = list1 else { return list2 }
  guard let list2 = list2 else { return list1 }
  
  if list1.val <= list2.val {
    list1.next = mergeTwoLists(list1.next, list2)
    return list1
  } else {
    list2.next = mergeTwoLists(list1, list2.next)
    return list2
  }
}
