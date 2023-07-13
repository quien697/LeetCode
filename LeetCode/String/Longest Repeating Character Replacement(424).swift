//
//  Longest Repeating Character Replacement(424).swift
//  LeetCode
//
//  Created by Quien on 2023/7/13.
//

import Foundation

/**
 ** 424. Longest Repeating Character Replacement
 ** https://leetcode.com/problems/longest-repeating-character-replacement/
 */

/// Time Complexity : O(N)
/// Space Complexity : S(N)
/// Data Structure : `Sliding Window`, `Hash Table`
func characterReplacement(_ s: String, _ k: Int) -> Int {
  let strArray = Array(s)
  var dict = [Character: Int]()
  var left = 0, curMaxChar = 0, ans = 0
  for (right, char) in s.enumerated() {
    dict[char, default: 0] += 1
    curMaxChar = max(curMaxChar, dict[char]!)
    let windowSize = right - left + 1
    if (windowSize - curMaxChar) <= k {
      ans = max(ans, windowSize)
    } else {
      while (right - left + 1 - curMaxChar) > k {
        dict[strArray[left], default: 0] -= 1
        left += 1
      }
    }
  }
  return ans
}
