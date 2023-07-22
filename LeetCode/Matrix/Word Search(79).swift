//
//  Word Search(79).swift
//  LeetCode
//
//  Created by Quien on 2023/7/21.
//

import Foundation

/**
 ** 79. Word Search
 ** https://leetcode.com/problems/word-search/
 */

/// Time Complexity : O(MN)
/// Space Complexity : S(MN)
/// Detail : m = row, n = col, L = the length of word
func exist(_ board: [[Character]], _ word: String) -> Bool {
  let word = Array(word)
  let m = board.count
  let n = board[0].count
  var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
  
  for row in 0..<m {
    for col in 0..<n {
      if existDFS(board, &visited, row, col, word, 0) {
        return true
      }
    }
  }
  return false
}

func existDFS(_ board: [[Character]], _ visited: inout [[Bool]], _ row: Int, _ col: Int, _ word: [Character], _ index: Int) -> Bool {
  if board[row][col] != word[index] { return false }
  if index == word.count - 1 { return true }
  
  visited[row][col] = true
  let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]
  for d in directions {
    let r = row + d.0
    let c = col + d.1
    if r >= 0 && r < board.count && c >= 0 && c < board[0].count {
      if !visited[r][c] && existDFS(board, &visited, r, c, word, index + 1) {
        return true
      }
    }
  }
  visited[row][col] = false
  return false
}
