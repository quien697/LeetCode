//
//  Pacific Atlantic Water Flow(417).swift
//  LeetCode
//
//  Created by Quien on 2023/7/7.
//

import Foundation

/**
 ** 417. Pacific Atlantic Water Flow
 ** https://leetcode.com/problems/pacific-atlantic-water-flow/
 */

/// Time Complexity : O(MN)
/// Space Complexity : S(MN)
/// Algorithm : `Flood Fill`, `Depth-First Search`, `Recursion`
func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
  let m = heights.count
  let n = heights[0].count
  var pacific = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
  var atlantic = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
  var ans = [[Int]]()
  for i in 0..<m {
    pacificAtlanticDFS(i, 0, heights, &pacific, m, n)
    pacificAtlanticDFS(i, n-1, heights, &atlantic, m, n)
  }
  for i in 0..<n {
    pacificAtlanticDFS(0, i, heights, &pacific, m, n)
    pacificAtlanticDFS(m-1, i, heights, &atlantic, m, n)
  }
  for i in 0..<m {
    for j in 0..<n {
      if pacific[i][j] && atlantic[i][j] {
        ans.append([i, j])
      }
    }
  }
  return ans
}

func pacificAtlanticDFS(_ x: Int, _ y: Int, _ heights: [[Int]], _ grid: inout [[Bool]], _ m: Int, _ n: Int) {
  if grid[x][y] { return }
  grid[x][y] = true
  let dire = [(0, 1), (0, -1), (1, 0), (-1, 0)]
  for d in dire {
    let dx = x + d.0
    let dy = y + d.1
    let isValid = dx >= 0 && dx < m && dy >= 0 && dy < n
    if isValid && heights[x][y] <= heights[dx][dy] {
      pacificAtlanticDFS(dx, dy, heights, &grid, m, n)
    }
  }
}

/// Time Complexity : O(MN)
/// Space Complexity : S(MN)
/// Algorithm : `Flood Fill`, `Breadth-First Search`, `Queue`
func pacificAtlantic2(_ heights: [[Int]]) -> [[Int]] {
  let m = heights.count
  let n = heights[0].count
  var pacific = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
  var atlantic = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
  var pQueue = [(x: Int, y: Int)]()
  var aQueue = [(x: Int, y: Int)]()
  var ans = [[Int]]()
  for i in 0..<m {
    pQueue.append((i, 0))
    aQueue.append((i, n-1))
  }
  for i in 0..<n {
    pQueue.append((0, i))
    aQueue.append((m-1, i))
  }
  pacificAtlantic2BFS(heights, &pacific, &pQueue, m, n)
  pacificAtlantic2BFS(heights, &atlantic, &aQueue, m, n)
  for i in 0..<m {
    for j in 0..<n {
      if pacific[i][j] && atlantic[i][j] {
        ans.append([i, j])
      }
    }
  }
  return ans
}

func pacificAtlantic2BFS(_ heights: [[Int]], _ visited: inout [[Bool]], _ queue: inout [(x: Int, y: Int)], _ m: Int, _ n: Int) {
  let dire = [(0, 1), (0, -1), (1, 0), (-1, 0)]
  while !queue.isEmpty {
    let square = queue.removeFirst()
    let x = square.x
    let y = square.y
    visited[x][y] = true
    for d in dire {
      let dx = x + d.0
      let dy = y + d.1
      let isValid = dx >= 0 && dx < m && dy >= 0 && dy < n
      if isValid && !visited[dx][dy] && heights[x][y] <= heights[dx][dy] {
        queue.append((dx, dy))
      }
    }
  }
}
