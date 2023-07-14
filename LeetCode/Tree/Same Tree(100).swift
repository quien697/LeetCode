//
//  Same Tree(100).swift
//  LeetCode
//
//  Created by Quien on 2023/7/14.
//

import Foundation

/**
 ** 100. Same Tree
 ** https://leetcode.com/problems/same-tree/
 */

/// Definition for a binary tree node.
public class TreeNode {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?
  public init() { self.val = 0; self.left = nil; self.right = nil; }
  public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
  public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
    self.val = val
    self.left = left
    self.right = right
  }
}

/// Time Complexity : O(N)
/// Space Complexity : S(N)
/// Algorithm : `Recursion`
func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
  guard let p = p, let q = q else { return p == nil && q == nil }
  
  if p.val != q.val {
    return false
  }
  return isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
}
