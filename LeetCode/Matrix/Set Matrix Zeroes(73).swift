//
//  Set Matrix Zeroes(73).swift
//  LeetCode
//
//  Created by Quien on 2023/7/19.
//

import Foundation

/**
 ** 73. Set Matrix Zeroes
 ** https://leetcode.com/problems/set-matrix-zeroes/
 */

/// Time Complexity : O(MN)
/// Space Complexity : S(M+N)
/// Detail : m = row, n = col
func setZeroes(_ matrix: inout [[Int]]) {
  let m = matrix.count
  let n = matrix[0].count
  var row = [Int](), col = [Int]()
  
  for r in 0..<m {
    for c in 0..<n {
      if matrix[r][c] == 0 {
        row.append(r)
        col.append(c)
      }
    }
  }
  for r in 0..<m {
    for c in 0..<n {
      if row.contains(r) || col.contains(c) {
        matrix[r][c] = 0
      }
    }
  }
}
