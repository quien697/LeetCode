//
//  Binary Tree Level Order Traversal(102).swift
//  LeetCode
//
//  Created by Quien on 2023/7/14.
//

import Foundation

/**
 ** 102. Binary Tree Level Order Traversal
 ** https://leetcode.com/problems/binary-tree-level-order-traversal/
 */

/// Time Complexity : O(N)
/// Space Complexity : S(N)
/// Algorithm : `Recursion`
func levelOrder(_ root: TreeNode?) -> [[Int]] {
  guard let root = root else { return [] }
  
  var ans = [[Int]]()
  var queue = [TreeNode]()
  queue.append(root)
  
  while queue.count > 0 {
    var list = [Int]()
    for _ in queue {
      let v = queue.removeFirst()
      list.append(v.val)
      if let left = v.left {
        queue.append(left)
      }
      if let right = v.right {
        queue.append(right)
      }
    }
    ans.append(list)
  }
  
  return ans
}
