//
//  Valid Anagram(242).swift
//  LeetCode
//
//  Created by Quien on 2023/7/13.
//

import Foundation

/**
 ** 242. Valid Anagram
 ** https://leetcode.com/problems/valid-anagram/
 */

/// Time Complexity : O(N)
/// Space Complexity : S(N)
/// Algorithm : `Hash Table`
func isAnagram(_ s: String, _ t: String) -> Bool {
  guard s.count == t.count else { return false }
  
  var dict = [Character: Int]()
  for char in s {
    dict[char, default: 0] += 1
  }
  for char in t {
    if let count = dict[char], count > 0 {
      dict[char] = count - 1
    } else {
      return false
    }
  }
  
  return true
}

/// Time Complexity : O(N LogN)
/// Space Complexity : S(1)
/// Algorithm : `Sorting`
func isAnagram2(_ s: String, _ t: String) -> Bool {
  return s.sorted() == t.sorted()
}
