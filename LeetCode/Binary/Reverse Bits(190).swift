//
//  Reverse Bits(190).swift
//  LeetCode
//
//  Created by Quien on 2023/7/18.
//

import Foundation

/**
 ** 190. Reverse Bits
 ** https://leetcode.com/problems/reverse-bits/
 */

/// Time Complexity : O(32)
/// Space Complexity : S(1)
func reverseBits(_ n: Int) -> Int {
  var n = n
  var ans = 0
  let bsl = 32
  for i in 0..<bsl {
    ans += (n & 1) << (bsl - 1 - i)
    n >>= 1
  }
  return ans
}
