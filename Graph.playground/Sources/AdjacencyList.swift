import Foundation

public class AdjacencyList <T:Hashable> {
    public var adjacencyDict : [Vertex<T>: [Edge<T>]] = [:]
    public var count = 0
    public init(){}
    fileprivate func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
        let edge = Edge(source: source, destination: destination, weight: weight) // 1
        adjacencyDict[source]?.append(edge) // 2
    }
    fileprivate func addUndirectedEdge(vertices: (Vertex<Element>, Vertex<Element>), weight: Double?) {
        let (source, destination) = vertices
        addDirectedEdge(from: source, to: destination, weight: weight)
        addDirectedEdge(from: destination, to: source, weight: weight)
    }
    
    
    public func breadthFirstSearch(source:Vertex<T>?) {
       var vertex = source
        if(vertex == nil) {
            return
        }
       var visited : [Vertex<Element>: Bool] = [:]
        
       var queue = Queue<Vertex<Element>>()
       queue.enqueue(value: vertex!)
       visited[vertex!] = true
       
        while(queue.peek() != nil) {
            vertex = queue.deque()
            print(vertex!.description)
            if let edges = edges(from: vertex!) {
                for edge in edges {
                    let neighbor = edge.destination
                    if(visited[neighbor] == nil){
                        queue.enqueue(value: neighbor)
                        visited[neighbor] = true
                    }
                }
            }
        }
    }
}

extension AdjacencyList:Graphable {
    public typealias Element = T
    public func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex(data: data)
        if (adjacencyDict[vertex] == nil) {
            adjacencyDict[vertex] = []
        }
        return vertex
    }
    public func add(_ type: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
        switch type {
        case .directed:
            addDirectedEdge(from: source, to: destination, weight: weight)
        case .undirected:
            addUndirectedEdge(vertices: (source,destination), weight: weight)
        }
        count += 1
    }
    public func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
        guard let edges = adjacencyDict[source] else {
            return nil
        }
        for edge in edges {
            if edge.destination == destination {
                return edge.weight
            }
        }
        return nil
    }
    public func edges(from source: Vertex<T>) -> [Edge<T>]? {
        return adjacencyDict[source]
    }
    public var description: CustomStringConvertible {
        var result = ""
        for (vertex, edges) in adjacencyDict {
            var edgeString = ""
            for (index, edge) in edges.enumerated() {
                if index != edges.count - 1 {
                    edgeString.append("\(edge.destination), ")
                } else {
                    edgeString.append("\(edge.destination)")
                }
            }
            result.append("\(vertex) ---> [ \(edgeString) ] \n ")
        }
        return result
    }
    
}
