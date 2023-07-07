//
//  BestTimeToBuyAndSellStock(121).swift
//  LeetCode
//
//  Created by Quien on 2023/7/5.
//

import Foundation

/**
 ** 121. Best Time to Buy and Sell Stock
 ** https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
 */

/// Time Complexity : O(N)
/// Space Complexity : S(1)
/// Algorithm : `Two Pointer - fast and slow`
/// Detail : the is two pointer fast and slow which is buy and sell in this case
/// sell pointer gonna be every single price
/// buy pointer = min(buy, sell)
func maxProfit(_ prices: [Int]) -> Int {
  var buy = Int.max
  var profit = 0
  for sell in prices {
    buy = min(buy, sell)
    profit = max(profit, sell - buy)
  }
  return profit
}

/// Time Complexity : O(N)
/// Space Complexity : S(1)
/// Algorithm : `Two Pointer - fast and slow`
/// Detail : the is two pointer fast and slow which is buy and sell in this case
/// sell pointer gonna keep moving
/// buy pointer will move to sell point if sell > buy
func maxProfit2(_ prices: [Int]) -> Int {
  var buy = 0
  var sell = 1
  var profit = 0
  while sell < prices.count {
    if prices[sell] > prices[buy] {
      profit = max(profit, prices[sell] - prices[buy])
    } else {
      buy = sell
    }
    sell += 1
  }
  return profit
}

/// Time Complexity : O(N)
/// Space Complexity : S(N)
/// Algorithm : `Dynamic Programming`
/// Recurrence : dp[n] = max(dp[n-1], prices[n] - minPrice) where minPrice = min(minPrice, prices[n])
func maxProfit3(_ prices: [Int]) -> Int {
  let n = prices.count
  var dp = [Int](repeating: 0, count: n)
  var buy = prices[0]
  for i in 1..<n {
    let sell = prices[i]
    buy = min(buy, sell)
    dp[i] = max(dp[i-1], sell - buy)
  }
  return dp[n - 1]
}
