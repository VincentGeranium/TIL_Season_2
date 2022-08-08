import UIKit
import RxSwift

enum MyError: Error {
    case anError
}

let disposeBag = DisposeBag()
Observable<String>.create { observer in
    observer.onNext("1")
//    observer.onError(MyError.anError)
//    observer.onCompleted()
    observer.onNext("?")
    
    return Disposables.create()
}.subscribe(
    onNext: { print($0) },
    onError: { print($0) },
    onCompleted: { print("Completed") },
    onDisposed: { print("Disposed") }
)//.disposed(by: disposeBag)
// 3개의 주석 처리로 인하여 memory leak 이 발생중인 상태임.

