//
//  Course Schedule(207).swift
//  LeetCode
//
//  Created by Quien on 2023/7/7.
//

import Foundation

/**
 ** 207. Course Schedule
 ** https://leetcode.com/problems/course-schedule/
 */

/// Time Complexity : O(V+E)
/// Space Complexity : S(V+E)
/// Algorithm : `Breadth-First Search`, `Queue`
/// Detail :
/// V represents the number of courses (numCourses)
/// E represents the number of prerequisite relationships (prerequisites)
func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
  var adjList = [[Int]](repeating: [], count: numCourses)
  var indegree = [Int: Int]()
  for prerequisite in prerequisites {
    let u = prerequisite[1]
    let v = prerequisite[0]
    adjList[u].append(v)
    indegree[v, default: 0] += 1
  }
  
  var queue = [Int]()
  for i in 0..<numCourses {
    if indegree[i] == nil {
      queue.append(i)
    }
  }
  while !queue.isEmpty {
    let u = queue.removeFirst()
    for v in adjList[u] {
      indegree[v]! -= 1
      if indegree[v] == 0 {
        indegree.removeValue(forKey: v)
        queue.append(v)
      }
    }
  }
  
  return indegree.isEmpty
}
