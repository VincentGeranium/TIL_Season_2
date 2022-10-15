//
//  Logic.swift
//  MVVM-example
//
//  Created by Minseong Kang on 2022/10/14.
//

import Foundation

class Service {
	
	let repository = Repository()
	
	var currentModel = Model(currentDateTime: Date())
	
	func fetchNow(onCompleted: @escaping (Model) -> Void) {
		repository.fetchNow { [weak self] entity in
			let formatter = DateFormatter()
			formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:'Z'"
			
			guard let now = formatter.date(from: entity.currentDateTime) else { return }
			
			let model = Model(currentDateTime: now)
			self?.currentModel = model
			  
			onCompleted(model)
		}
	}
	
	func moveDay(day: Int) {
		guard let movedDay = Calendar.current.date(bySetting: .day,
													value: day,
													of: currentModel.currentDateTime) else {
			return
		}
		currentModel.currentDateTime = movedDay
	}
	
	
}
