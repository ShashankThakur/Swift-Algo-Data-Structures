import UIKit

var str = "Hello, playground"

func permute(nums:[Int]) ->[[Int]] {
    var result = [[Int]]()
    if(nums.count == 0) {
        return result
    }
    permuteHelp(nums, 0, nums.count - 1, &result)
    print(result)
    return result
}

func permuteHelp(_ a:[Int], _ start:Int, _ end:Int, _ result:inout[[Int]]) {
    var input = a
    if start == end {
        result.append(a)
    }
    else {
        for i in start...end {
            //swapping
            
            (input[i],input[start]) = (input[start],input[i])
            permuteHelp(input, start + 1, end, &result)
            (input[i],input[start]) = (input[start],input[i])
        }
    }
}
permute(nums: [1,2,3])
