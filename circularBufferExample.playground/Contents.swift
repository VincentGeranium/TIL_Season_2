import UIKit

private struct Constants {
    fileprivate static let defaultBufferCapacity: Int = 16
}

public enum CircularBufferOperation {
    case Ignore, Overwrite
}

public struct CircularBuffer<T> {
    fileprivate var data: [T]
    fileprivate var head: Int = 0
    fileprivate var tail: Int = 0
    
    private var internalCount: Int = 0
    private var overwriteOperation: CircularBufferOperation = CircularBufferOperation.Overwrite
    
    /// 빈 CircularBuffer 구조 생성
    public init() {
        data = [T]()
        data.reserveCapacity(Constants.defaultBufferCapacity)
    }
    
    /// 'count' 프로퍼티의 CircularBuffer를 생성
    /// - 주의: 'count'만큼 2를 거듭제곱하지 않은 경우,
    ///  그에 가장 가까운 수만큼 2를 거듭제곱함
    public init(_ count: Int, overwriteOperation: CircularBufferOperation = .Overwrite) {
        var capacity = count
        if (capacity < 1) {
            capacity = Constants.defaultBufferCapacity
        }
        
        // 'count' 만큼 2를 거듭제곱으로 함
        if ((capacity & (~capacity + 1)) != capacity) {
            var b = 1
            while (b < capacity) {
                b = b << 1
            }
            capacity = b
        }
        
        data = [T]()
        data.reserveCapacity(capacity)
        self.overwriteOperation = overwriteOperation
    }
    
    /// 시퀀스에서 CircularBuffer를 생성
    public init<S: Sequence>(_ elements: S, size: Int) where S.Iterator.Element == T {
            self.init(size)
            elements.forEach({push(element: $0)})
    }
}
