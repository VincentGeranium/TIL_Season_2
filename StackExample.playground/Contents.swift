import UIKit

public struct Stack<T> {
    private var elements = [T]()
    
    public init() {}
    
    public mutating func pop() -> T? {
        return self.elements.popLast()
    }
    
    public mutating func push(element: T) {
        self.elements.append(element)
    }
    
    public func peek() -> T? {
        return self.elements.last
    }
    
    public func isEmpty() -> Bool {
        return self.elements.isEmpty
    }
    
    public var count: Int {
        return self.elements.count
    }
    
}

var myStack = Stack<Int>()

myStack.push(element: 5) // [5]

myStack.push(element: 44) // [5], [44]

myStack.push(element: 23) // [5]. [44]. [23]

var x = myStack.pop() // x = 23

x = myStack.pop() // x = 44

x = myStack.pop() // x = 5

x = myStack.pop() // x = nil


