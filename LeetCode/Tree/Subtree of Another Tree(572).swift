//
//  Subtree of Another Tree(572).swift
//  LeetCode
//
//  Created by Quien on 2023/7/14.
//

import Foundation

/**
 ** 572. Subtree of Another Tree
 ** https://leetcode.com/problems/subtree-of-another-tree/
 */

/// Time Complexity : O(MN)
/// Space Complexity : S(M+N)
/// Algorithm : `Depth-First Search`, `Recursion`
func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
  guard let root = root else { return false }
  
  if isIdentical(root, subRoot) {
    return true
  }
  return isSubtree(root.left, subRoot) || isSubtree(root.right, subRoot)
}

func isIdentical(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
  if p == nil || q == nil {
    return p == nil && q == nil
  }
  return p?.val == q?.val && isIdentical(p?.left, q?.left) && isIdentical(p?.right, q?.right)
}
