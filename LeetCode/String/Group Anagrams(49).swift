//
//  Group Anagrams(49).swift
//  LeetCode
//
//  Created by Quien on 2023/7/13.
//

import Foundation

/**
 ** 49. Group Anagrams
 ** https://leetcode.com/problems/group-anagrams/
 */

/// Time Complexity : O(MN(LogN))
/// Space Complexity : S(MN)
/// Algorithm : `Hash Table`, `Sorting`
/// Detail :
/// M represents the size of strs (strs.count)
/// N represents the size of each string in strs (strs[0].count)
func groupAnagrams(_ strs: [String]) -> [[String]] {
  var dict = [String: [String]]()
  
  for str in strs {
    let sortedStr = String(str.sorted())
    dict[sortedStr, default: []].append(str)
  }
  
  return Array(dict.values)
}

