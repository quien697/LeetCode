//
//  Missing Number(268).swift
//  LeetCode
//
//  Created by Quien on 2023/7/18.
//

import Foundation

/**
 ** 268. Missing Number
 ** https://leetcode.com/problems/missing-number/
 */

/// Time Complexity : O(N)
/// Space Complexity : S(1)
/// Algorithm : `Bitwise XOR ^`
func missingNumber(_ nums: [Int]) -> Int {
  let n = nums.count
  var ans = 0
  for i in 1...n { ans ^= i }
  for n in nums { ans ^= n }
  return ans
}

/// Time Complexity : O(N)
/// Space Complexity : S(1)
func missingNumber2(_ nums: [Int]) -> Int {
  let n = nums.count
  let sumOfNums = nums.reduce(0, +)
  let sum = n * (n + 1) / 2
  return sum - sumOfNums
}

/// Time Complexity : O(N LogN)
/// Space Complexity : S(N)
func missingNumber3(_ nums: [Int]) -> Int {
  var nums = nums.sorted()
  let n = nums.count
  for i in 0..<n {
    if nums[i] != i {
      return i
    }
  }
  return n
}
