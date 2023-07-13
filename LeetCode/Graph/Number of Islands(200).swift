//
//  Number of Islands(200).swift
//  LeetCode
//
//  Created by Quien on 2023/7/7.
//

import Foundation

/**
 ** 200. Number of Islands
 ** https://leetcode.com/problems/number-of-islands/
 */

/// Time Complexity : O(MN)
/// Space Complexity : S(MN)
/// Algorithm : `Breadth-First Search`, `Queue`
func numIslands(_ grid: [[Character]]) -> Int {
  let m = grid.count
  let n = grid[0].count
  var check = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
  var islands = 0
  for x in 0..<m {
    for y in 0..<n {
      if grid[x][y] == "1" && !check[x][y] {
        islands += 1
        numIslandsBFS(x, y, grid, &check, m, n)
      }
    }
  }
  return islands
}

func numIslandsBFS(_ x: Int, _ y: Int, _ grid: [[Character]], _ check: inout [[Bool]], _ m: Int, _ n: Int) {
  let dx = [0, 0, 1, -1]
  let dy = [1, -1, 0, 0]
  var queue = [(x: Int, y: Int)]()
  queue.append((x, y))
  check[x][y] = true
  while !queue.isEmpty {
    let square = queue.removeFirst()
    for i in 0..<4 {
      let nx = square.x + dx[i]
      let ny = square.y + dy[i]
      if nx >= 0 && nx < m && ny >= 0 && ny < n {
        if grid[nx][ny] == "1" && !check[nx][ny] {
          queue.append((nx, ny))
          check[nx][ny] = true
        }
      }
    }
  }
}
