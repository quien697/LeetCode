//
//  Clone Graph(133).swift
//  LeetCode
//
//  Created by Quien on 2023/7/7.
//

import Foundation

/**
 ** 133. Clone Graph
 ** https://leetcode.com/problems/clone-graph/
 */

/// Definition for a Node.
public class Node {
  public var val: Int
  public var neighbors: [Node?]
  public init(_ val: Int) {
    self.val = val
    self.neighbors = []
  }
}

/// Time Complexity : O(N^2)
/// Space Complexity : S(N^2)
/// Algorithm : `Breadth-First Search`, `Queue`
func cloneGraph(_ node: Node?) -> Node? {
  guard let node = node else { return nil }
  
  var cloneNode = [Int: Node]()
  var queue = [Node]()
  queue.append(node)
  while !queue.isEmpty {
    let n = queue.removeFirst()
    if cloneNode[n.val] == nil {
      cloneNode[n.val] = Node(n.val)
    }
    for v in n.neighbors {
      if let v = v {
        if cloneNode[v.val] == nil {
          queue.append(v)
          cloneNode[v.val] = Node(v.val)
        }
        cloneNode[n.val]!.neighbors.append(cloneNode[v.val]!)
      }
    }
  }
  
  return cloneNode[node.val]
}
