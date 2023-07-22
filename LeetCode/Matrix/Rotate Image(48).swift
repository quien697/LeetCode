//
//  Rotate Image(48).swift
//  LeetCode
//
//  Created by Quien on 2023/7/20.
//

import Foundation


/**
 ** 48. Rotate Image
 ** https://leetcode.com/problems/rotate-image/
 */

/// Time Complexity : O(MN)
/// Space Complexity : S(1)
/// Detail :
/// 1. Reverse the matrix
/// 2. Transpose the matrix
func rotate(_ matrix: inout [[Int]]) {
  matrix.reverse()
  
  for i in 0..<matrix.count {
    for j in 0...i {
      let temp = matrix[i][j]
      matrix[i][j] = matrix[j][i]
      matrix[j][i] = temp
    }
  }
}

/// Time Complexity : O(MN)
/// Space Complexity : S(1)
/// Detail :
/// 1. Transpose the matrix
/// 2. Reverse the matrix
func rotate2(_ matrix: inout [[Int]]) {
  let n = matrix.count
  let m = matrix[0].count
  
  for i in 0..<n {
    for j in 0...i {
      let temp = matrix[i][j]
      matrix[i][j] = matrix[j][i]
      matrix[j][i] = temp
    }
  }
  
  for i in 0..<n {
    for j in 0..<m/2 {
      let temp = matrix[i][j]
      matrix[i][j] = matrix[i][m-j-1]
      matrix[i][m-j-1] = temp
    }
  }
}
