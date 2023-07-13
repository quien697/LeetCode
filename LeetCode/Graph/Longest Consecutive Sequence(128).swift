//
//  Longest Consecutive Sequence(128).swift
//  LeetCode
//
//  Created by Quien on 2023/7/7.
//

import Foundation

/**
 ** 128. Longest Consecutive Sequence
 ** https://leetcode.com/problems/longest-consecutive-sequence/
 */


/// Time Complexity : O(N)
/// Space Complexity : S(1)
/// Algorithm : `Union Find`
func longestConsecutive(_ nums: [Int]) -> Int {
  
  func find(_ p: Int) -> Int {
    var root = p
    while parent[root]! != root {
      parent[root]! = parent[parent[root]!]!
      root = parent[root]!
    }
    return root
  }
  
  func union(_ p: Int, _ q: Int) {
    let i = find(p)
    let j = find(q)
    if i == j { return }
    if size[i]! < size[j]! {
      parent[i] = j
      size[j]! += size[i]!
    } else {
      parent[j] = i
      size[i]! += size[j]!
    }
  }
  
  var parent = [Int: Int]()
  var size = [Int: Int]()
  
  for num in nums {
    if parent[num] == nil {
      parent[num] = num
      size[num] = 1
    }
    if parent[num-1] != nil { union(num, num-1) }
    if parent[num+1] != nil { union(num, num+1) }
  }
  
  return size.max(by: { $0.value < $1.value })?.value ?? 0
}
