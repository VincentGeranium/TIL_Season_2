import UIKit
import Foundation

enum ArithmeticExpression {
	case number(Int)
	indirect case addition(ArithmeticExpression, ArithmeticExpression)
	indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let four = ArithmeticExpression.number(4)
let five = ArithmeticExpression.number(5)

let sum = ArithmeticExpression.addition(four, five)

let final = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evalute(_ expression: ArithmeticExpression) -> Int {
	switch expression {
	case .number(let value):
		return value
	case .addition(let left, let right):
		return evalute(left) + evalute(right)
	case .multiplication(let left, let right):
		return evalute(left) * evalute(right)
	}
}
let result_1: Int = evalute(final)
print("RESULT_1 => (5 + 4) * 2 = \(result_1)")

indirect enum ArithmeticExpression_2 {
	case number(Int)
	case addition(ArithmeticExpression_2, ArithmeticExpression_2)
	case multiplication(ArithmeticExpression_2, ArithmeticExpression_2)
}

let four_2 = ArithmeticExpression_2.number(4)
let five_2 = ArithmeticExpression_2.number(5)

let sum_2 = ArithmeticExpression_2.addition(four_2, five_2)

let final_2 = ArithmeticExpression_2.multiplication(sum_2, ArithmeticExpression_2.number(2))

func evalute(_ expression: ArithmeticExpression_2) -> Int {
	switch expression {
	case .number(let value):
		return value
	case .addition(let left, let right):
		return evalute(left) + evalute(right)
	case .multiplication(let left, let right):
		return evalute(left) * evalute(right)
	}
}

let result_2: Int = evalute(final_2)

print("RESULT_2 => (5 + 4) * 2 = \(result_2)")
