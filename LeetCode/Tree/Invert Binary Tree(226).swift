//
//  Invert Binary Tree(226).swift
//  LeetCode
//
//  Created by Quien on 2023/7/14.
//

import Foundation

/**
 ** 226. Invert Binary Tree
 ** https://leetcode.com/problems/invert-binary-tree/
 */

/// Time Complexity : O(N)
/// Space Complexity : S(N)
/// Algorithm : `Recursion`
func invertTree(_ root: TreeNode?) -> TreeNode? {
  guard let root = root else { return nil }
  
  let left = invertTree(root.left)
  let right = invertTree(root.right)
  root.left = right
  root.right = left
  
  return root
}
