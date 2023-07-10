//
//  Longest Increasing Subsequence(300).swift
//  LeetCode
//
//  Created by Quien on 2023/7/7.
//

import Foundation

/**
 ** 300. Longest Increasing Subsequence
 ** https://leetcode.com/problems/longest-increasing-subsequence/
 */

/// Time Complexity : O(N^2)
/// Space Complexity : S(N)
/// Algorithm : `Binary Search`
func lengthOfLIS(_ nums: [Int]) -> Int {
  var d = [Int]()
  for num in nums {
    var lower = 0
    var upper = d.count
    while lower < upper {
      let mid = (upper + lower) / 2
      if d[mid] < num {
        lower = mid + 1
      } else {
        upper = mid
      }
    }
    if lower == d.count {
      d.append(num)
    } else {
      d[lower] = num
    }
  }
  return d.count
}

/// Time Complexity : O(N^2)
/// Space Complexity : S(N)
/// Algorithm : `Dynamic Programming`
func lengthOfLIS2(_ nums: [Int]) -> Int {
  var dp = [Int]()
  for num in nums {
    if let n = dp.firstIndex(where: { $0 >= num }) {
      if num <= dp[n] {
        dp[n] = num
      }
    } else {
      dp.append(num)
    }
  }
  return dp.count
}
