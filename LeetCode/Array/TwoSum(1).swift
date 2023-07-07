//
//  TwoSum(1).swift
//  LeetCode
//
//  Created by Quien on 2023/7/5.
//

import Foundation

/**
 ** 1. Two Sum
 ** https://leetcode.com/problems/two-sum/
 */

/// Time Complexity : O(N)
/// Space Complexity : S(N)
/// Data Structure : `Hash Table`
/// Detail : dict = [key: value] = [target - num : index]
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
  var dict = [Int: Int]()
  for (index, num) in nums.enumerated() {
    if let d = dict[num] {
      return [d, index]
    }
    dict[target - num] = index
  }
  return []
}

/// Time Complexity : O(N^2)
/// Space Complexity : S(1)
/// Algorithm : `Brute Force`
/// Detail : Return answer if nums[i] + nums[j] = target
func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
  let n = nums.count
  for i in 0..<n-1 {
    for j in i+1..<n {
      if nums[i] + nums[j] == target {
        return [i, j]
      }
    }
  }
  return []
}
