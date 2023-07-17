//
//  Implement Trie (Prefix Tree)(208).swift
//  LeetCode
//
//  Created by Quien on 2023/7/16.
//

import Foundation

/**
 ** 208. Implement Trie (Prefix Tree)
 ** https://leetcode.com/problems/implement-trie-prefix-tree/
 */

class Trie {
  
  private class Node {
    var isEnd: Bool = false
    var children: [Character: Node] = [:]
  }
  
  private let root: Node
  
  init() {
    self.root = Node()
  }
  
  func insert(_ word: String) {
    var root = root
    for c in word {
      root.children[c] = root.children[c] ?? Node()
      root = root.children[c]!
    }
    root.isEnd = true
  }
  
  func search(_ word: String) -> Bool {
    return searchHelper(word, false)
  }
  
  func startsWith(_ prefix: String) -> Bool {
    return searchHelper(prefix, true)
  }
  
  func searchHelper(_ word: String, _ isPrefix: Bool) -> Bool {
    var root = root
    for c in word {
      if root.children[c] == nil {
        return false
      }
      root = root.children[c]!
    }
    return isPrefix ? true : root.isEnd
  }
  
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */
