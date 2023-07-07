//
//  Maximum Subarray(53).swift
//  LeetCode
//
//  Created by Quien on 2023/7/7.
//

import Foundation

/**
 ** 53. Maximum Subarray
 ** https://leetcode.com/problems/maximum-subarray/
 */

/// Time Complexity : O(N)
/// Space Complexity : S(N)
/// Algorithm : `Dynamic Programming`
/// Recurrence :
func maxSubArray(_ nums: [Int]) -> Int {
  let n = nums.count
  var d = [Int](repeating: 0, count: n)
  d[0] = nums[0]
  var answer = nums[0]
  for i in 1..<n {
    if nums[i] > d[i-1] && d[i-1] < 0 {
      d[i] = nums[i]
    } else {
      d[i] = nums[i] + d[i-1]
    }
    answer = max(answer, d[i])
  }
  return answer
}
