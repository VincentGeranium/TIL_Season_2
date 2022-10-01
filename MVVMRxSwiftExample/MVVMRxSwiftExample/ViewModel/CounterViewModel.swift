//
//  CounterViewModel.swift
//  MVVMRxSwiftExample
//
//  Created by Minseong Kang on 2022/10/01.
//

import Foundation
import RxSwift
import RxCocoa
import Moya

struct CounterDataModel: Codable {
	var counterDefaultValue: Int
}

struct CounterAPI: TargetType {
	var baseURL: URL {
		URL(string: "[https://swift.org](https://swift.org)")!
	}
	
	var path: String {
		""
	}
	
	var method: Moya.Method {
		.get
	}
	
	var task: Moya.Task {
		.requestPlain
	}
	
	var headers: [String : String]? {
		nil
	}
	
	var sampleData: Data {
		"}".data(using: .utf8)!
	}
}

final class CounterViewModel: ViewModelType {
	
	let disposeBag = DisposeBag()
	var provider = MoyaProvider<CounterAPI>()
	
	struct Input {
		var refresh: Observable<Void>
		var plusAction: Observable<Void>
		var subtractAction: Observable<Void>
	}
	
	struct Output {
		var countedValue: Driver<Int>
	}
	
	func transform(input: Input) -> Output {
		let countedValue = BehaviorRelay(value: 0)
		
		let counterObservable = input
			.refresh
			.flatMapFirst { [provider] _ in
				return provider.rx.request(.init())
					.map(CounterDataModel.self)
			}.share()
		
		counterObservable.map { $0.counterDefaultValue }
			.subscribe(onNext: { defaultValue in
				countedValue.accept(defaultValue)
			}).disposed(by: self.disposeBag)
		
		input.plusAction
			.skip(until: counterObservable)
			.subscribe { _ in
				countedValue.accept(countedValue.value + 1)
			}
			.disposed(by: disposeBag)
		
		input.subtractAction
			.skip(until: counterObservable)
			.subscribe { _ in
				countedValue.accept(countedValue.value - 1)
			}
			.disposed(by: disposeBag)
		
		return Output(countedValue: countedValue.asDriver(onErrorJustReturn: 0))
	}
}
