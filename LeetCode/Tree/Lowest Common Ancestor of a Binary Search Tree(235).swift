//
//  Lowest Common Ancestor of a Binary Search Tree(235).swift
//  LeetCode
//
//  Created by Quien on 2023/7/16.
//

import Foundation

/**
 ** 235. Lowest Common Ancestor of a Binary Search Tree
 ** https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/
 */

/// Time Complexity : O(N)
/// Space Complexity : S(N)
/// Algorithm : `Recursion`
/// Detail :
/// if (root.val - p.val) * (root.val - q.val) > 0, p and q gonna be different side, else same side.
/// if equal 0, q or p gonna be root.
func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
  guard let root = root, let p = p, let q = q else { return nil }
  
  if root.val == p.val || root.val == q.val {
    return root
  }
  let left = lowestCommonAncestor(root.left, p, q)
  let right = lowestCommonAncestor(root.right, p, q)
  if left != nil, right != nil {
    return root
  }
  return left ?? right
}

/// Time Complexity : O(LogN)
/// Space Complexity : S(1)
/// Detail :
/// if (root.val - p.val) * (root.val - q.val) > 0, p and q gonna be different side, else same side.
/// if equal 0, q or p gonna be root.
func lowestCommonAncestor2(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
  guard var root = root, let p = p, let q = q else { return nil }
  
  while ((root.val - p.val) * (root.val - q.val)) > 0 {
    root = (root.val > p.val) ? root.left! : root.right!
  }
  return root
}

/// Time Complexity : O(LogN)
/// Space Complexity : S(LogN)
/// Algorithm : `Recursion`
/// if (root.val - p.val) * (root.val - q.val) > 0, p and q gonna be different side, else same side.
/// if equal 0, q or p gonna be root.
func lowestCommonAncestor3(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
  guard let root = root, let p = p, let q = q else { return nil }
  
  if ((root.val - p.val) * (root.val - q.val)) <= 0 {
    return root
  }
  return lowestCommonAncestor3(root.val > p.val ? root.left! : root.right, p, q)
}
