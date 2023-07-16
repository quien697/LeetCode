//
//  Validate Binary Search Tree(98).swift
//  LeetCode
//
//  Created by Quien on 2023/7/15.
//

import Foundation

/**
 ** 98. Validate Binary Search Tree
 ** https://leetcode.com/problems/validate-binary-search-tree/
 */

/// Time Complexity : O(N)
/// Space Complexity : S(N)
/// Algorithm : `Recursion`, `Depth-First Search`, `Inorder Traverse`
func isValidBST(_ root: TreeNode?) -> Bool {
  isValidBSTHelper(root, nil, nil)
}

func isValidBSTHelper(_ root: TreeNode?, _ max: Int?, _ min: Int?) -> Bool {
  guard let root = root else { return true }
  // Base case
  if let min = min, root.val <= min { return false }
  if let max = max, root.val >= max { return false }
  // Recursive case
  return isValidBSTHelper(root.left, root.val, min) && isValidBSTHelper(root.right, max, root.val)
}

/// Time Complexity : O(N)
/// Space Complexity : S(N)
/// Algorithm : `Stack`, `Inorder Traverse`
func isValidBST2(_ root: TreeNode?) -> Bool {
  var stack = [TreeNode]()
  var root = root
  var prev = Int.min
  
  while root != nil || !stack.isEmpty {
    while root != nil {
      stack.append(root!)
      root = root?.left
    }
    root = stack.removeLast()
    if root!.val <= prev {
      return false
    }
    prev = root!.val
    root = root?.right
  }
  
  return true
}
