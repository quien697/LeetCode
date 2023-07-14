//
//  Maximum Depth of Binary Tree(104).swift
//  LeetCode
//
//  Created by Quien on 2023/7/14.
//

import Foundation

/**
 ** 104. Maximum Depth of Binary Tree
 ** https://leetcode.com/problems/maximum-depth-of-binary-tree/
 */

/// Time Complexity : O(N)
/// Space Complexity : S(N)
/// Algorithm : `Breadth-First Search`
func maxDepth(_ root: TreeNode?) -> Int {
  guard let root = root else { return 0 }
  
  var queue = [TreeNode]()
  queue.append(root)
  var depth = 0
  
  while !queue.isEmpty {
    depth += 1
    for _ in queue {
      let node = queue.removeFirst()
      if let left = node.left {
        queue.append(left)
      }
      if let right = node.right {
        queue.append(right)
      }
    }
  }
  
  return depth
}

/// Time Complexity : O(N)
/// Space Complexity : S(N)
/// Algorithm : `Recursion`
func maxDepth2(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    return maxDepth2DFS(root, 0)
}

func maxDepth2DFS(_ node: TreeNode?, _ depth: Int) -> Int{
    guard let node = node else { return depth }
    let left = maxDepth2DFS(node.left, depth + 1)
    let right = maxDepth2DFS(node.right, depth + 1)
    return max(left, right)
}
