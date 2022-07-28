import Foundation

// NSArray가 동일 타입으로만 구성된 경우
let nsFibonacciArray: NSArray = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]

// NSArray 강제 언래핑 사용
let swiftFibonacciArray: [Int] = nsFibonacciArray as! [Int]

// 타입 캐스팅 연산자 사용
if let swiftFibonacciArray: [Int] = nsFibonacciArray as? [Int] {
    // swiftFibonacciArray 배열 사용
}

// NSArray에 다른 타입이 포함된 경우
let mixedNSArray: NSArray = NSArray(array: [0, 1, "1", 2, "3", 5, "8", 13, 21, 34])

let swiftArrayMixed: [Int] = mixedNSArray as! [Int]
// 모든 데이터 타입이 Int가 아니므로 예외 오류 발생

if let swfitArrayMixed: [Int] = mixedNSArray as? [Int] {
    // 이 조건문은 false이므로 코드 실행 없이 그냥 넘어감.
}
