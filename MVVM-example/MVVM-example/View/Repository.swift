//
//  Repository.swift
//  MVVM-example
//
//  Created by Minseong Kang on 2022/10/14.
//

import Foundation

class Repository {
	func fetchNow(onCompleted: @escaping (UtcTimeModel) -> Void) {
		let url = "http://worldclockapi.com/api/json/utc/now"

		URLSession.shared.dataTask(with: URL(string: url)!) { data, _, _ in
			guard let data = data else { return }
			guard let model = try? JSONDecoder().decode(UtcTimeModel.self, from: data) else { return }
			onCompleted(model)
		}.resume()
	}
}
