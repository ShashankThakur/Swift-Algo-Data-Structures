//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Definition for singly-linked list.
  public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
          self.val = val
          self.next = nil
      }
 }
 
class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if(l1 == nil) {return l2}
        if(l2 == nil) {return l1}
        var result:ListNode? = nil
        
        if(l1!.val <= l2!.val) {
            result = l1
            result!.next = mergeTwoLists(l1!.next,l2)
        }
        else {
            result = l2
            result!.next = mergeTwoLists(l1,l2!.next)
        }
        return result
    }
}
