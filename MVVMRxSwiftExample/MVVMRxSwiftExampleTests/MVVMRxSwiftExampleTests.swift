//
//  MVVMRxSwiftExampleTests.swift
//  MVVMRxSwiftExampleTests
//
//  Created by Minseong Kang on 2022/10/01.
//

import Foundation
import Nimble
import RxCocoa
import RxNimble
import RxSwift
import RxTest
import XCTest
import Moya

@testable
import MVVMRxSwiftExample

extension Endpoint {
	class func succeedEndpointClosure<T: TargetType, E: Encodable>(_ targetType: T.Type, with object: E) -> (T) -> Endpoint {
		return { (target: T) -> Endpoint in
			let data = try! JSONEncoder().encode(object)
			return Endpoint(url: URL(target: target).absoluteString,
							sampleResponseClosure: {.networkResponse(200, data)},
							method: target.method,
							task: target.task,
							httpHeaderFields: target.headers)
		}
	}
}

final class MVVMRxSwiftExampleTests: XCTestCase {
	// 테스트를 하나하나 실행할때마다 setUp() 메소드에서 값들을 초기화해주기 때문에 껍데기로 선언한다.
	var viewModel: CounterViewModel!
	var output: CounterViewModel.Output!
	var scheduler: TestScheduler!
	var disposeBag: DisposeBag!
	
	var refreshSubject: PublishSubject<Void>!
	var plusSubject: PublishSubject<Void>!
	var substractSubject: PublishSubject<Void>!
	
	// setup 메소드 채워주기
	override func setUp() {
		scheduler = TestScheduler(initialClock: 0)
		disposeBag = DisposeBag()
		
		plusSubject = PublishSubject<Void>()
		substractSubject = PublishSubject<Void>()
		refreshSubject = PublishSubject<Void>()
		
		viewModel = CounterViewModel()
		viewModel.provider = MoyaProvider<CounterAPI>(endpointClosure: Endpoint.succeedEndpointClosure(CounterAPI.self, with: CounterDataModel(counterDefaultValue: 5)),
													  stubClosure: MoyaProvider.immediatelyStub)
		
		output = viewModel.transform(input: .init(refresh: .just(()),
												  plusAction: plusSubject.asObservable(),
												  subtractAction: substractSubject.asObservable()))
	}
	
	// countedValue에 대한 테스트 코드 짜기
	func testCountedValue() {
		scheduler.createColdObservable(
			[
				.next(10, ()),
				.next(20, ()),
				.next(30, ())
			]
		).bind(to: plusSubject).disposed(by: disposeBag)
		
		scheduler.createColdObservable(
			[
				.next(25, ())
			]
		)
		.bind(to: substractSubject)
		.disposed(by: disposeBag)
		
		expect(self.output.countedValue).events(scheduler: scheduler, disposeBag: disposeBag).to(
			equal(
				[
					.next(0, 5),
					.next(10, 6),
					.next(20, 7),
					.next(25, 6),
					.next(30, 7)
				]
			)
		)
	}
}
