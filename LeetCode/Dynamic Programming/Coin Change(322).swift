//
//  Coin Change(322).swift
//  LeetCode
//
//  Created by Quien on 2023/7/7.
//

import Foundation

/**
 ** 322. Coin Change
 ** https://leetcode.com/problems/coin-change/description/
 */

/// Time Complexity : O(NM)
/// Space Complexity : S(M)
/// N = coins.count, M = amount
/// Algorithm : `Dynamic Programming`
/// Recurrence : d[n] = min(d[n], d[i-n] + 1) where i > n
func coinChange(_ coins: [Int], _ amount: Int) -> Int {
  if amount < 1 { return 0 }
  
  var dp = [Int](repeating: amount + 1, count: amount + 1)
  dp[0] = 0
  for i in 1...amount {
    for coin in coins {
      if i >= coin  {
        dp[i] = min(dp[i], dp[i-coin] + 1)
      }
    }
  }
  return dp[amount] > amount ? -1 : dp[amount]
}
