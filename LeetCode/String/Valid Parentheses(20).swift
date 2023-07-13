//
//  Valid Parentheses(20).swift
//  LeetCode
//
//  Created by Quien on 2023/7/13.
//

import Foundation

/**
 ** 20. Valid Parentheses
 ** https://leetcode.com/problems/valid-parentheses/
 */

/// Time Complexity : O(N)
/// Space Complexity : S(1)
/// Algorithm : `Stack`
func isValid(_ s: String) -> Bool {
  var stack = [Character]()
  for char in s {
    if char == "(" || char == "[" || char == "{" {
      stack.append(char)
    } else {
      if stack.isEmpty { return false }
      let last = stack.removeLast()
      if (char == ")" && last != "(") ||
          (char == "]" && last != "[") ||
          (char == "}" && last != "{") {
        return false
      }
    }
  }
  return stack.isEmpty
}
