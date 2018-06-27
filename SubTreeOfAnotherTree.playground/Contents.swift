//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



//Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}


//Complexity - O(n*n)

func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
    if(s == nil) {return false}
    if(isSame(s,t)){
        return true
    }
    return isSubtree(s!.left,t) || isSubtree(s!.right,t)
}
func isSame(_ s:TreeNode?, _ t:TreeNode?) ->Bool {
    if(s == nil && t == nil) {
        return true
    }
    if(s == nil || t == nil) {
        return false
    }
    if(s!.val != t!.val) {
        return false
    }
    return isSame(s!.left, t!.left) && isSame(s!.right, t!.right)
}

