//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
Reverse a singly linked list.

Example:

Input: 1->2->3->4->5->NULL
Output: 5->4->3->2->1->NULL
 */


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
    func reverseList(_ head: ListNode?) -> ListNode? {
        var prev:ListNode? = nil
        var current = head
        while (current != nil) {
            let next = current!.next
            current!.next = prev
            prev = current
            current = next
        }
        return prev
    }
}
