//
//  Longest Common Subsequence(1143).swift
//  LeetCode
//
//  Created by Quien on 2023/7/7.
//

import Foundation

/**
 ** 1143. Longest Common Subsequence
 ** https://leetcode.com/problems/longest-common-subsequence/
 */

/// Time Complexity : O(N^2)
/// Space Complexity : S(N^2)
/// Algorithm : `Dynamic Programming`
/// Recurrence :
/// if text1[i] == text2[j]
///   DP[i][j] = DP[i - 1][j - 1] + 1
/// otherwise
///   DP[i][j] = max(DP[i - 1][j], DP[i][j - 1])
func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
  let text1 = Array(text1)
  let text2 = Array(text2)
  let n1 = text1.count
  let n2 = text2.count
  var dp = [[Int]](repeating: [Int](repeating: 0, count: n2 + 1), count: n1 + 1)
  var result = 0
  for i in 1...n1 {
    for j in 1...n2 {
      if text1[i-1] == text2[j-1] {
        dp[i][j] = dp[i-1][j-1] + 1
      } else {
        dp[i][j] = max(dp[i][j-1], dp[i-1][j])
      }
      result = max(result, dp[i][j])
    }
  }
  return result
}
