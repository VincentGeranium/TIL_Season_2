import UIKit
import RxSwift
import RxCocoa

let subject = PublishSubject<String>()
subject.on(.next("Is anyone listening?"))

let subscriptionOne = subject.subscribe(onNext: { string in
    print(string)
})

subject.on(.next("1"))
subject.onNext("2")

let subscriptionTwo = subject
  .subscribe { event in
    print("2)", event.element ?? event)
  }

subject.onNext("3")

subscriptionOne.dispose()

subject.onNext("4")

subject.onCompleted() // 1
subject.onNext("5") // 2

subscriptionTwo.dispose()

let disposeBag = DisposeBag()

subject.subscribe { // 4
    print("3)", $0.element ?? $0)
}.disposed(by: disposeBag)

subject.onNext("?")
