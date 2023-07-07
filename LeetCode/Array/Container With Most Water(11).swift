//
//  Container With Most Water(11).swift
//  LeetCode
//
//  Created by Quien on 2023/7/7.
//

import Foundation

/**
 ** 11. Container With Most Water
 ** https://leetcode.com/problems/container-with-most-water/
 */

/// Time Complexity : O(N)
/// Space Complexity : S(1)
/// Algorithm : `Two Pointer - left and right`
/// Detail : the is two pointer left and right
/// if right > left, left += 1, otherwise right += 1
func maxArea(_ height: [Int]) -> Int {
  var left = 0
  var right = height.count - 1
  var answer = 0
  while left < right {
    let amount = min(height[left], height[right]) * (right - left)
    answer = max(answer, amount)
    if height[left] < height[right] {
      left += 1
    } else {
      right -= 1
    }
  }
  return answer
}
