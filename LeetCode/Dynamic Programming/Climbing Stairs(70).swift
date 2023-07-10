//
//  Climbing Stairs(70).swift
//  LeetCode
//
//  Created by Quien on 2023/7/7.
//

import Foundation

/**
 ** 70. Climbing Stairs
 ** https://leetcode.com/problems/climbing-stairs/
 */

/// Time Complexity : O(N)
/// Space Complexity : S(N)
/// Recurrence : d[n] = d[n-1] + d[n-2]
func climbStairs(_ n: Int) -> Int {
  var d = [Int](repeating: 0, count: n + 1)
  d[0] = 1
  d[1] = 1
  if n < 2 {
    return d[n]
  }
  for i in 2...n {
    d[i] = d[i-1] + d[i-2]
  }
  return d[n]
}

/// Time Complexity : O(N)
/// Space Complexity : S(N)
/// Algorithm : `Dynamic Programming`, `Recursion`, `memoization`
/// Detail : Top-Down Approach -> Recursion + Memorization.
func climbStairs2(_ n: Int) -> Int {
  var d = [Int](repeating: 0, count: n + 1)
  d[0] = 1
  d[1] = 1
  climbStairs2Helper(n, &d)
  return d[n]
}

@discardableResult
func climbStairs2Helper(_ n: Int, _ d: inout [Int]) -> Int {
  if n < 2 { return 1 }
  if d[n] > 0 { return d[n] }
  let steps = climbStairs2Helper(n-1, &d) + climbStairs2Helper(n-2, &d)
  d[n] = steps
  return steps
}
