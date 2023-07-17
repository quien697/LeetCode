//
//  Design Add and Search Words Data Structure(211).swift
//  LeetCode
//
//  Created by Quien on 2023/7/16.
//

import Foundation

/**
 ** 211. Design Add and Search Words Data Structure
 ** https://leetcode.com/problems/design-add-and-search-words-data-structure/
 */

class WordDictionary {
  
  private class Node {
    var isEnd: Bool = false
    var children: [Character: Node] = [:]
  }
  
  private let root: Node
  
  init() {
    self.root = Node()
  }
  
  func addWord(_ word: String) {
    var root = root
    for c in word {
      root.children[c] = root.children[c] ?? Node()
      root = root.children[c]!
    }
    root.isEnd = true
  }
  
  func search(_ word: String) -> Bool {
    return searchHelper(Array(word), 0, root)
  }
  
  private func searchHelper(_ word: [Character], _ index: Int, _ node: Node) -> Bool {
    if index == word.count {
      return node.isEnd
    }
    
    let char = word[index]
    if char == "." {
      for child in node.children.values {
        if searchHelper(word, index + 1, child) {
          return true
        }
      }
      return false
    } else if let child = node.children[char] {
      return searchHelper(word, index + 1, child)
    } else {
      return false
    }
  }
}

/**
 * Your WordDictionary object will be instantiated and called as such:
 * let obj = WordDictionary()
 * obj.addWord(word)
 * let ret_2: Bool = obj.search(word)
 */
