//
//  Number of 1 Bits(191).swift
//  LeetCode
//
//  Created by Quien on 2023/7/18.
//

import Foundation

/**
 ** 191. Number of 1 Bits
 ** https://leetcode.com/problems/number-of-1-bits/
 */

/// Time Complexity : O(N)
/// Space Complexity : S(1)
/// Algorithm : `Bitwise Operation`, `Bit Arithmetic (Power of 2)`
func hammingWeight(_ n: Int) -> Int {
  var n = n, ans = 0
  while n != 0 {
    ans += 1
    n &= n - 1
  }
  return ans
}

/// Time Complexity : O(N)
/// Space Complexity : S(1)
/// Algorithm : `Bitwise Operation`, `Bit Shift Multiplication`
func hammingWeight2(_ n: Int) -> Int {
  var n = n, ans = 0
  while n > 0 {
    if n & 1 == 1 {
      ans += 1
    }
    n = n >> 1
  }
  return ans
}
