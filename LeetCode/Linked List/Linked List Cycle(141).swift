//
//  Linked List Cycle(141).swift
//  LeetCode
//
//  Created by Quien on 2023/7/17.
//

import Foundation

/**
 ** 141. Linked List Cycle
 ** https://leetcode.com/problems/linked-list-cycle/
 */

/// Time Complexity : O(N)
/// Space Complexity : S(1)
func hasCycle(_ head: ListNode?) -> Bool {
  var head = head
  while head != nil {
    if head?.val == Int.max {
      return true
    }
    head?.val = Int.max
    head = head?.next
  }
  return false
}

/// Time Complexity : O(N)
/// Space Complexity : S(1)
/// Algorithm : `Two Pointer - slow & fast`
func hasCycle2(_ head: ListNode?) -> Bool {
  var slow = head
  var fast = head?.next
  while slow != nil && fast != nil  {
    if slow === fast { return true }
    slow = slow?.next
    fast = fast?.next?.next
  }
  return false
}
