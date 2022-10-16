import RxSwift
import Foundation

print("----Just----")
Observable<Int>.just(1)
	.subscribe { (emitter: Int) in
		print(emitter)
	}

print("----Of (1)----")
Observable<Int>.of(1, 2, 3, 4, 5)
	.subscribe { (emitter: Int) in
		print(emitter)
	}


print("----Of (2)----")
Observable.of([1, 2, 3, 4, 5])
	.subscribe { (emitter: [Int]) in
		print(emitter)
	}


print("----From----")
Observable.from([1, 2, 3, 4, 5])
	.subscribe { (emitter: Int) in
		print(emitter)
	}

print("----Subscribe (1)----")
