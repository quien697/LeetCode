//
//  Longest Substring Without Repeating Characters(3).swift
//  LeetCode
//
//  Created by Quien on 2023/7/13.
//

import Foundation

/**
 ** 3. Longest Substring Without Repeating Characters
 ** https://leetcode.com/problems/longest-substring-without-repeating-characters/
 */

/// Time Complexity : O(N)
/// Space Complexity : S(N)
/// Data Structure : `Sliding Window`, `Hash Table`
func lengthOfLongestSubstring(_ s: String) -> Int {
  var dict = [Character: Int]()
  var left = 0
  var ans = 0
  for (right, char) in s.enumerated() {
    if let index = dict[char] {
      left = max(left, index + 1)
    }
    dict[char] = right
    ans = max(ans, (right - left + 1))
  }
  return ans
}
