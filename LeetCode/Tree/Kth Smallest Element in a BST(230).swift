//
//  Kth Smallest Element in a BST(230).swift
//  LeetCode
//
//  Created by Quien on 2023/7/16.
//

import Foundation

/**
 ** 230. Kth Smallest Element in a BST
 ** https://leetcode.com/problems/kth-smallest-element-in-a-bst/
 */

/// Time Complexity : O(N)
/// Space Complexity : S(N)
/// Algorithm : `Inorder`, `Stack`
func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
  var root = root, k = k
  var stack = [TreeNode]()
  
  while root != nil || !stack.isEmpty {
    while root != nil {
      stack.append(root!)
      root = root?.left
    }
    root = stack.removeLast()
    k -= 1
    if k == 0 {
      return root!.val
    }
    root = root?.right
  }
  
  return root!.val
}

/// Time Complexity : O(N)
/// Space Complexity : S(N)
/// Algorithm : `Inorder`, `Depth-First Search`, `Recursion`
func kthSmallest2(_ root: TreeNode?, _ k: Int) -> Int {
  var k = k
  var result = 0
  kthSmallest2Helper(root, &k, &result)
  return result
}

func kthSmallest2Helper(_ root: TreeNode?, _ k: inout Int, _ result: inout Int) {
  guard let root = root else { return }
  
  kthSmallest2Helper(root.left, &k, &result)
  k -= 1
  if k == 0 {
    result = root.val
  }
  kthSmallest2Helper(root.right, &k, &result)
}
