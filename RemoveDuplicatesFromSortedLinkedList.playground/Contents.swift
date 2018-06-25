//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func removeDuplicateFromSorted(_ head:ListNode?) ->ListNode?{
    if (head == nil) {return head}
    var current = head!
    while(current.next != nil) {
        if(current.val == current.next!.val) {
            current.next = current.next!.next
        }
        else {
            current = current.next!
        }
    }
    return head
}
