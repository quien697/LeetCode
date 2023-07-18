//
//  Counting Bits(338).swift
//  LeetCode
//
//  Created by Quien on 2023/7/18.
//

import Foundation

/**
 ** 338. Counting Bits
 ** https://leetcode.com/problems/counting-bits/
 */

/// Time Complexity : O(N)
/// Space Complexity : S(1)
/// Algorithm : `Dynamic Programming`
func countBits(_ n: Int) -> [Int] {
  var dp = [Int](repeating: 0, count: n + 1)
  for i in 0...n {
    dp[i] = (dp[i >> 1]) + (i % 2)
  }
  return dp
}
