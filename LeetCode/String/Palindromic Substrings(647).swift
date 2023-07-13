//
//  Palindromic Substrings(647).swift
//  LeetCode
//
//  Created by Quien on 2023/7/13.
//

import Foundation

/**
 ** 647. Palindromic Substrings
 ** https://leetcode.com/problems/palindromic-substrings/
 */

/// Time Complexity : O(N)
/// Space Complexity : S(N)
/// Recurrence : dp[i][j] = s[i] == s[j] && ( (i - j) <= 2 || dp[i-1][j+1] )
func countSubstrings(_ s: String) -> Int {
  let char = Array(s)
  let n = char.count
  var dp = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
  var count = 0
  
  for i in 0..<n {
    for j in 0...i {
      if char[i] == char[j] && ((i - j) <= 2 || dp[i-1][j+1]) {
        dp[i][j] = true
        count += 1
      }
    }
  }
  
  return count
}
