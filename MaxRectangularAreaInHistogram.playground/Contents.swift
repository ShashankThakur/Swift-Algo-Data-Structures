import UIKit

var str = "Hello, playground"
/*
 Time complexity - O(n)
 Space Complexity - O(n)
 */




class Stack<T> {
    private var list:[T]
    init(){
        self.list = [T]()
    }
    func push(_ val:T) {
        list.append(val)
    }
    func pop() ->T? {
        
        return list.count > 0 ? list.removeLast() : nil
    }
    func peek() ->T? {
        return list.last
    }
    var isEmpty:Bool {
        return list.count == 0
    }
}

func maxArearInHistogram(_ num:[Int]) ->Int {
    let stack = Stack<Int>()
    var maxArea = 0
    var area = 0
    var i = 0
    while(i < num.count) {
        if(stack.isEmpty || num[stack.peek()!] <= num[i]){
            stack.push(i)
            i += 1
        }
        else {
            if let top = stack.pop(){
                if(stack.isEmpty){
                    area = num[top] * i;
                }
                else{
                    area = num[top] * (i - stack.peek()! - 1);
                }
                if(area > maxArea){
                    maxArea = area;
                }
            }
            
        }
    }
    while !stack.isEmpty {
        let top = stack.pop()
        if(stack.isEmpty) {
            area = num[top!] * i
        }
        else{
            area = num[top!] * (i - stack.peek()! - 1);
        }
        if(area > maxArea){
            maxArea = area;
        }
    }
    return maxArea
}

let input = [2,1,5,6,2,3]

maxArearInHistogram(input)
