import UIKit
import RxSwift
import RxCocoa

// 1
enum MyError: Error {
    case anError
}

// 2
func print<T: CustomStringConvertible>(label: String, event: Event<T>) {
    print(label, (event.element ?? event.error) ?? event)
}

let subject = BehaviorSubject(value: "Initial value")
let disposeBag = DisposeBag()

subject.subscribe {
    print(label: "1)", event: $0)
}
.disposed(by: disposeBag)

subject.onNext("X")

// 1
subject.onError(MyError.anError)

// 2
subject.subscribe {
    print(label: "2)", event: $0)
}
.disposed(by: disposeBag)

