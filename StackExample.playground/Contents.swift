import UIKit

public struct Stack<T> {
    fileprivate var elements = [T]()
    
    public init() {}
    
    public init<S : Sequence>(_ s: S) where S.Iterator.Element == T {
        self.elements = Array(s.reversed())
    }
    
    mutating public func pop() -> T? {
        return self.elements.popLast()
        
    }
    
    mutating public func push(element: T){
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

extension Stack: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        return self.elements.description
    }

    public var debugDescription: String {
        return self.elements.debugDescription
    }
}

extension Stack: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: T...) {
        self.init()
        elements.forEach {push(element: $0)}
    }
}

extension Stack: Sequence {
    
    public struct ArrayIterator<T>: IteratorProtocol {
        var currentElement: [T]
        
        init(elements: [T]) {
            self.currentElement = elements
        }
        
        mutating public func next() -> T? {
            if (!self.currentElement.isEmpty) {
                return self.currentElement.popLast()
            }
            return nil
        }
    }
    
    public func makeIterator() -> AnyIterator<T> {
        return AnyIterator(IndexingIterator(_elements: self.elements.lazy.reversed()))
    }
    
}




//var myStack = Stack<Int>()
//
//myStack.push(element: 5) // [5]
//
//myStack.push(element: 44) // [5], [44]
//
//myStack.push(element: 23) // [5]. [44]. [23]
//
//var x = myStack.pop() // x = 23
//
//x = myStack.pop() // x = 44
//
//x = myStack.pop() // x = 5
//
//x = myStack.pop() // x = nil

// 배열 리터럴 문법 사용
var myStack:Stack<Int> = [4,5,6,7]

// 미리 정의해둔 초기화 객체를 사용한다
var myStackFromStack = Stack<Int>(myStack) // [4, 5. 6. 7]

myStackFromStack.push(element: 55) // [4, 5, 6, 7, 55]

myStack.push(element: 70) // [4, 5, 6, 7, 70]
