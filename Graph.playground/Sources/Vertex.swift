import Foundation

public struct Vertex<T: Hashable> {
    var data: T
}

extension Vertex:Hashable{
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func ==(lhs: Vertex<T>, rhs: Vertex<T>) -> Bool {
        return lhs.data == rhs.data
    }

    public var hashValue:Int {
        return "\(data)".hashValue
    }
}

extension Vertex:CustomStringConvertible {
    public var description:String {
        return "\(data)"
    }
}
