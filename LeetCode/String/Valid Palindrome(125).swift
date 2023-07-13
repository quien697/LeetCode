//
//  Valid Palindrome(125).swift
//  LeetCode
//
//  Created by Quien on 2023/7/13.
//

import Foundation

/**
 ** 125. Valid Palindrome
 ** https://leetcode.com/problems/valid-palindrome/
 */

/// Time Complexity : O(N)
/// Space Complexity : S(1)
/// Algorithm : `Two Pointer - left and right`
func isPalindrome(_ s: String) -> Bool {
  var left = s.startIndex
  var right = s.index(before: s.endIndex)
  
  while left < right {
    if !s[left].isLetter && !s[left].isNumber {
      left = s.index(after: left)
      continue
    }
    if !s[right].isLetter && !s[right].isNumber {
      right = s.index(before: right)
      continue
    }
    if s[left].lowercased() != s[right].lowercased() {
      return false
    }
    left = s.index(after: left)
    right = s.index(before: right)
  }
  
  return true
}

/// Time Complexity : O(N)
/// Space Complexity : S(N)
/// Algorithm : `Two Pointer - left and right`
func isPalindrome2(_ s: String) -> Bool {
  let arr = Array(s.lowercased().filter { $0.isLetter || $0.isNumber })
  var left = 0
  var right = arr.count - 1
  
  while left <= right {
    if arr[left] != arr[right] { return false }
    left += 1
    right -= 1
  }
  
  return true
}

/// Time Complexity : O(N)
/// Space Complexity : S(N)
func isPalindrome3(_ s: String) -> Bool {
  let str = s.lowercased().filter { $0.isLetter || $0.isNumber }
  let reversedStr = String(str.reversed())
  return str == reversedStr
}
