//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


class Node <T> {
    var value:T
    var next:Node?
    init(value:T) {
        self.value = value
    }
}

class Stack <T> {
    private var top:Node<T>?
    public var count:Int = 0
    public func push(value:T) {
        let newNode = Node(value:value)
        newNode.next = top
        top = newNode
        
        count += 1
    }
    
    public func peek() ->Node<T>? {
        return top
    }
    
    public func pop() ->Node<T>?{
        if let node = top {
            top = top?.next
            count -= 1
            return node
        }
        return nil
    }
    public func isEmpty() ->Bool {
        return count == 0
    }
}
func reverseAStack(s:inout Stack<Int>) {
    if(!stack.isEmpty()) {
        let x = stack.pop()!
        reverseAStack(s: &s)
        insertAtBottom(stack: &stack, val: x.value)
    }
}

func insertAtBottom(stack:inout Stack<Int>,val:Int) {
    if (stack.isEmpty()){
        stack.push(value: val)
        return
    }
    let x = stack.pop()!
    insertAtBottom(stack: &stack, val: val)
    stack.push(value: x.value)
}

var stack = Stack<Int>()
stack.push(value: 2)
stack.push(value: 3)
stack.push(value: 4)

reverseAStack(s: &stack)

