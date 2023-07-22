//
//  Spiral Matrix(54).swift
//  LeetCode
//
//  Created by Quien on 2023/7/20.
//

import Foundation

/**
 ** 54. Spiral Matrix
 ** https://leetcode.com/problems/spiral-matrix/
 */

/// Time Complexity : O(MN)
/// Space Complexity : S(1)
/// /// Detail : m = row, n = col
func spiralOrder(_ matrix: [[Int]]) -> [Int] {
  var left = 0
  var right = matrix[0].count
  var top = 0
  var bottom = matrix.count
  var ans = [Int]()
  
  while left < right && top < bottom {
    for i in left..<right {
      ans.append(matrix[top][i])
    }
    top += 1
    
    for i in top..<bottom {
      ans.append(matrix[i][right-1])
    }
    right -= 1
    
    if left >= right || top >= bottom { break }
    
    for i in (left..<right).reversed() {
      ans.append(matrix[bottom-1][i])
    }
    bottom -= 1
    
    for i in (top..<bottom).reversed() {
      ans.append(matrix[i][left])
    }
    left += 1
  }
  
  return ans
}
