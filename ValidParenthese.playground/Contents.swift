//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
class Solution {
    func isValid(_ s: String) -> Bool {
        let stackList = Stack<Character>()
        for c in s {
            if(c == "(") {
                stackList.push(")")
            }
            else if(c == "[") {
                stackList.push("]")
            }
            else if(c == "{") {
                stackList.push("}")
            }
            else if (stackList.isEmpty() || stackList.pop() != c) {
                return false
            }
        }
        return stackList.isEmpty();
    }
    
}
class Stack<T> {
    private var list:[T]
    init(){
        self.list = []
    }
    func push(_ val:T) {
        list.append(val)
    }
    func pop() ->T? {
        let last = list.last
        if (last != nil) {
            list.removeLast()
        }
        return last
    }
    func isEmpty() -> Bool {
        return list.count == 0
    }
}
