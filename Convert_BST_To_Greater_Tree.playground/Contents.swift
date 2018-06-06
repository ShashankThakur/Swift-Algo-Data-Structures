//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


/*Given a Binary Search Tree (BST), convert it to a Greater Tree such that every key of the original BST is changed to the original key plus sum of all keys greater than the original key in BST.

Example:

Input: The root of a Binary Search Tree like this:
5
/   \
2     13

Output: The root of a Greater Tree like this:
18
/   \
20     13
 */


 // Definition for a binary tree node.
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


//Complexity - O(n)

func convertBST(_ root: TreeNode?) -> TreeNode? {
    var rightSum  = 0
    convertUtil(root,&rightSum)
    return root
}
func convertUtil(_ root:TreeNode?, _ rightSum:inout Int) {
    if(root == nil) {
        return
    }
    convertUtil(root!.right, &rightSum)
    root!.val = root!.val + rightSum
    rightSum = root!.val
    convertUtil(root!.left,&rightSum)
}

let root = TreeNode(5)
let left = TreeNode(2)
let right = TreeNode(13)

root.left = left
root.right = right




