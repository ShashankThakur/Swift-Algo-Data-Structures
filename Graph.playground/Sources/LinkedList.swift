import Foundation

public struct Queue<T>{
    private var  items = [T]()
    public mutating func enqueue(value:T){
        items.append(value)
    }
    public mutating func deque() ->T{
        assert(items.count > 0)
        return items.removeFirst()
    }
    public func peek() -> T? {
        return items.first
    }
    
}

