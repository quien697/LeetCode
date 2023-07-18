//
//  Sum of Two Integers(371).swift
//  LeetCode
//
//  Created by Quien on 2023/7/18.
//

import Foundation

/**
 ** 371. Sum of Two Integers
 ** https://leetcode.com/problems/sum-of-two-integers/
 */

/// Time Complexity : O(N)
/// Space Complexity : S(1)
func getSum(_ a: Int, _ b: Int) -> Int {
  var a = a
  var b = b
  var sum = a
  while b != 0 {
    sum = a ^ b
    b = (a & b) << 1
    a = sum
  }
  return sum
}
