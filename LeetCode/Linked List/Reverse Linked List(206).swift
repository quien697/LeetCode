//
//  Reverse Linked List(206).swift
//  LeetCode
//
//  Created by Quien on 2023/7/17.
//

import Foundation

/**
 ** 206. Reverse Linked List
 ** https://leetcode.com/problems/reverse-linked-list/
 */

/// Time Complexity : O(N)
/// Space Complexity : S(1)
func reverseList(_ head: ListNode?) -> ListNode? {
  if head == nil || head?.next == nil { return head }
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

/// Time Complexity : O(N)
/// Space Complexity : S(N)
/// Algorithm : `Recursion`
func reverseList2(_ head: ListNode?) -> ListNode? {
  if head == nil { return nil }
  return reverseList2Helper(pre: nil, cur: head)
}
func reverseList2Helper(pre: ListNode?, cur: ListNode?) -> ListNode? {
  if cur == nil { return pre }
  let temp: ListNode? = cur?.next
  cur?.next = pre
  return reverseList2Helper(pre: cur, cur: temp)
}
