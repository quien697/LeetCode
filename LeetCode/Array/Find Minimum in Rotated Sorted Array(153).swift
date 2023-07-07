//
//  Find Minimum in Rotated Sorted Array(153).swift
//  LeetCode
//
//  Created by Quien on 2023/7/7.
//

import Foundation

/**
 ** 153. Find Minimum in Rotated Sorted Array
 ** https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/
 */

/// Time Complexity : O(Log N)
/// Space Complexity : S(1)
/// Algorithm : `Binary Search`
func findMin(_ nums: [Int]) -> Int {
  var lower = 0
  var upper = nums.count - 1
  while lower < upper {
    let mid = (lower + upper) / 2
    if nums[mid] > nums[upper] {
      lower = mid + 1
    } else {
      upper = mid
    }
  }
  return nums[lower]
}
