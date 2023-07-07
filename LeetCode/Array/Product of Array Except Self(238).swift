//
//  Product of Array Except Self(238).swift
//  LeetCode
//
//  Created by Quien on 2023/7/7.
//

import Foundation

/**
 ** 238. Product of Array Except Self
 ** https://leetcode.com/problems/product-of-array-except-self/
 */

/// Time Complexity : O(N)
/// Space Complexity : S(N)
func productExceptSelf(_ nums: [Int]) -> [Int] {
  let n = nums.count
  var answer = [Int](repeating: 1, count: n)
  var prefix = 1
  for i in 1..<n {
    prefix *= nums[i-1]
    answer[i] = prefix
  }
  var suffix = 1
  for i in stride(from: n-2, through: 0, by: -1) {
    suffix *= nums[i+1]
    answer[i] *= suffix
  }
  return answer
}
