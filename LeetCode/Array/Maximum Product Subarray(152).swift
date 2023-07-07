//
//  Maximum Product Subarray(152).swift
//  LeetCode
//
//  Created by Quien on 2023/7/7.
//

import Foundation

/**
 ** 152. Maximum Product Subarray
 ** https://leetcode.com/problems/maximum-product-subarray/
 */

/// Time Complexity : O(N)
/// Space Complexity : S(1)
func maxProduct(_ nums: [Int]) -> Int {
  var minProduct = 1
  var maxProduct = 1
  var answer = -Int.max
  for num in nums {
    if num < 0 {
      swap(&maxProduct, &minProduct)
    }
    minProduct = min(num * minProduct, num)
    maxProduct = max(num * maxProduct, num)
    answer = max(answer, maxProduct)
  }
  return answer
}

/// Time Complexity : O(N)
/// Space Complexity : S(N)
/// Algorithm : `Dynamic Programming`
/// Recurrence :
///   d[n] = [(max, min)]
///   d[n].max = max( nums[n] x d[n-1], nums[n] )
///   d[n].min = max( nums[n] x d[n-1], nums[n] )
///   if nums[n] greater 0 swap( d[n].max, d[n].min )
func maxProduct2(_ nums: [Int]) -> Int {
  let n = nums.count
  var dp = [(max: Int, min: Int)](repeating: (0, 0), count: n)
  dp[0] = (nums[0], nums[0])
  var answer = nums[0]
  for i in 1..<n {
    if nums[i] < 0 {
      dp[i-1] = (dp[i-1].min, dp[i-1].max)
    }
    dp[i].min = min(nums[i] * dp[i-1].min, nums[i])
    dp[i].max = max(nums[i] * dp[i-1].max, nums[i])
    answer = max(answer, dp[i].max)
  }
  return answer
}
