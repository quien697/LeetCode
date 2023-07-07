//
//  3Sum(15).swift
//  LeetCode
//
//  Created by Quien on 2023/7/7.
//

import Foundation

/**
 ** 15. 3Sum
 ** https://leetcode.com/problems/3sum/
 */

/// Time Complexity : O(N^2)
/// Space Complexity : S(1)
/// Algorithm : `Two Pointer - left and right`
/// Detail : the is two pointer left and right which is j and k in this case
func threeSum(_ nums: [Int]) -> [[Int]] {
  let nums = nums.sorted()
  let n = nums.count
  var ans = [[Int]]()
  var i = 0
  while i <= n - 3 {
    // Skip the same num
    if i > 0 && nums[i] == nums[i-1] {
      i += 1
      continue
    }
    // Start two pointer algorithm here
    var j = i + 1
    var k = n - 1
    while j < k {
      let target = nums[i] + nums[j] + nums[k]
      if target == 0 {
        // Skip the same num
        if j - 1 > i && nums[j] == nums[j-1] {
          j += 1
          continue
        }
        ans.append([nums[i], nums[j], nums[k]])
        j += 1
      } else if target > 0 {
        k -= 1
      } else {
        j += 1
      }
    }
    i += 1
  }
  return ans
}

/// Time Complexity : O(N^2)
/// Space Complexity : S(1)
/// Algorithm : `Two Pointer - left and right`
/// Data Structure  : `Ordered Set`
/// Detail : the is two pointer left and right which is j and k in this case
func threeSum2(_ nums: [Int]) -> [[Int]] {
  let nums = nums.sorted()
  let n = nums.count
  var ans = Set<[Int]>()
  for i in 0..<n {
    // Start two pointer algorithm here
    var j = i + 1
    var k = n - 1
    while j < k {
      let target = nums[i] + nums[j] + nums[k]
      if target == 0 {
        ans.insert([nums[i], nums[j], nums[k]])
        j += 1
        k -= 1
      } else if target > 0 {
        k -= 1
      } else {
        j += 1
      }
    }
  }
  return Array(ans)
}
