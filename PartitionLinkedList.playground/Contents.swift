//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Complexity - O(n)
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
    if (head == nil) {return nil}
    var current = head
    var l1 = ListNode(0)
    var l2 = ListNode(0)
    let h1 = l1
    let h2 = l2
    while (current != nil) {
        if(current!.val < x) {
            l1.next = current!
            l1 = l1.next!
        }
        else {
            l2.next = current!
            l2 = l2.next!
        }
        current = current!.next
    }
    l2.next = nil
    l1.next = h2.next
    return h1.next
}
