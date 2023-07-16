//
//  Construct Binary Tree from Preorder and Inorder Traversal(105).swift
//  LeetCode
//
//  Created by Quien on 2023/7/16.
//

import Foundation

/**
 ** 105. Construct Binary Tree from Preorder and Inorder Traversal
 ** https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/
 */

/// Time Complexity : O(N)
/// Space Complexity : S(N)
/// Algorithm : `Depth-First Search`, `Recursion`
func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
  // Base case
  if preorder.isEmpty || inorder.isEmpty {
    return nil
  }
  // Recursive case
  let node = TreeNode(preorder[0])
  if let index = inorder.firstIndex(of: preorder[0]) {
    node.left = buildTree(Array(preorder[1..<index+1]), Array(inorder[0..<index]))
    node.right = buildTree(Array(preorder[index+1..<preorder.count]), Array(inorder[index+1..<inorder.count]))
  }
  return node
}
