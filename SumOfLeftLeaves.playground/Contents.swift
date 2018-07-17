//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 Find the sum of all left leaves in a given binary tree.
 
 Example:
 
 3
 / \
 9  20
 /  \
 15   7
 
 There are two left leaves in the binary tree, with values 9 and 15 respectively. Return 24.

 */

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        var sum = 0
        if(root == nil){
            return sum
        }
        helper(root!, false, &sum)
        return sum
    }
    
    func helper(_ root:TreeNode, _ isleft:Bool, _ sum:inout Int) {
        if(root.left == nil && root.right == nil && isleft) {
            sum = sum + root.val
        }
        if(root.left != nil) {
            helper(root.left!, true, &sum)
        }
        if(root.right != nil) {
            helper(root.right!, false, &sum)
        }
    }
}
