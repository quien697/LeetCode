//
//  Remove Nth Node From End of List(19).swift
//  LeetCode
//
//  Created by Quien on 2023/7/17.
//

import Foundation


/**
 ** 19. Remove Nth Node From End of List
 ** https://leetcode.com/problems/remove-nth-node-from-end-of-list/
 */

/// Time Complexity : O(N)
/// Space Complexity : S(1)
/// Algorithm : `Two Pointer - slow & fast`
func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
  var slow = head
  var fast = head
  
  for _ in 0..<n {
    fast = fast?.next
  }
  
  while fast != nil {
    if fast?.next == nil {
      slow?.next = slow?.next?.next
    }
    slow = slow?.next
    fast = fast?.next
  }
  
  if slow === head {
    return head?.next
  }
  return head
}
