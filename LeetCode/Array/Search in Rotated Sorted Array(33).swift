//
//  Search in Rotated Sorted Array(33).swift
//  LeetCode
//
//  Created by Quien on 2023/7/7.
//

import Foundation

/**
 ** 33. Search in Rotated Sorted Array
 ** https://leetcode.com/problems/search-in-rotated-sorted-array
 */

/// Time Complexity : O(Log N)
/// Space Complexity : S(1)
/// Algorithm : `Binary Search`
func search(_ nums: [Int], _ target: Int) -> Int {
  var lower = 0
  var upper = nums.count - 1
  while lower <= upper {
    let mid = (lower + upper) / 2
    if nums[mid] == target {
      return mid
    }
    if nums[lower] <= nums[mid] {
      if nums[lower] <= target && target <= nums[mid] {
        upper = mid - 1
      } else {
        lower = mid + 1
      }
    } else {
      if nums[mid] <= target && target <= nums[upper] {
        lower = mid + 1
      } else {
        upper = mid - 1
      }
    }
  }
  return -1
}
