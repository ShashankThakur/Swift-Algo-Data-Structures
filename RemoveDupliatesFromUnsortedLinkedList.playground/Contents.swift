//: Playground - noun: a place where people can play

import UIKit

//Remove duplicates from unsorted linked list

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func removeDuplicates(_ node:ListNode?) {
    if(node == nil) {
        return
    }
    var current = node
    var prev:ListNode?
    var dict = [Int:Int]()
    while (current != nil) {
        let currentVal = current!.val
        if(dict[currentVal] != nil) {
            prev?.next = current?.next
        }
        else {
            dict[currentVal] = 1
            prev = current
        }
        current = current?.next
    }
}
