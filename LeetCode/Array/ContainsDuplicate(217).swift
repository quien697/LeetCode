//
//  ContainsDuplicate(217).swift
//  LeetCode
//
//  Created by Quien on 2023/7/5.
//

import Foundation

/**
 ** 217. Contains Duplicate
 ** https://leetcode.com/problems/contains-duplicate/
 */

/// Time Complexity : O(N)
/// Space Complexity : S(N)
/// Data Structure  : `Ordered Set`
/// Detail : for the Set, each element appears only once in a collection.
func containsDuplicate(_ nums: [Int]) -> Bool {
  return Set(nums).count != nums.count
}

/// Time Complexity : O(N LogN)
/// Space Complexity : S(1)
func containsDuplicate2(_ nums: [Int]) -> Bool {
  let nums = nums.sorted()
  for i in 0..<nums.count - 1 {
    if nums[i] == nums[i+1] {
      return true
    }
  }
  return false
}

/// Time Complexity : O(N)
/// Space Complexity : S(N)
/// Algorithm : `Hash Table`
/// Detail : if dict[n] != nil return true
func containsDuplicate3(_ nums: [Int]) -> Bool {
  var dict = [Int: Int]()
  for i in 0..<nums.count {
    let n = nums[i]
    if dict[n] == nil {
      dict[n] = n
    } else {
      return true
    }
  }
  return false
}

