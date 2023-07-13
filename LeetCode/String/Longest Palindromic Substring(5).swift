//
//  Longest Palindromic Substring(5).swift
//  LeetCode
//
//  Created by Quien on 2023/7/13.
//

import Foundation

/**
 ** 5. Longest Palindromic Substring
 ** https://leetcode.com/problems/longest-palindromic-substring/
 */

/// Time Complexity : O(N)
/// Space Complexity : S(N)
/// Recurrence : dp[i][j] = s[i] == s[j] && ( (i - j) <= 2 || dp[i-1][j+1] )
func longestPalindrome(_ s: String) -> String {
  let char = Array(s)
  let n = char.count
  var dp = [[Bool]](repeating: [Bool](repeating: false, count: n) , count: n)
  var left = 0, right = 0
  
  for i in 0..<n {
    for j in 0...i {
      if char[i] == char[j] {
        if ((i - j) <= 2 || dp[i-1][j+1]) {
          dp[i][j] = true
        }
        let diff = i - j + 1
        if dp[i][j] && right < diff {
          right = diff
          left = j
        }
      }
    }
  }
  
  return String(char[left..<left+right])
}
