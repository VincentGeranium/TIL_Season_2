//
//  Entity.swift
//  MVVM-example
//
//  Created by Minseong Kang on 2022/10/14.
//

import Foundation

struct UtcTimeModel: Codable {
	let id: String
	let currentDateTime: String
	let utcOffset: String
	let isDayLightSavingsTime: Bool
	let dayOfTheWeek: String
	let timeZoneName: String
	let currentFileTime: Int
	let ordinalDate: String
	let serviceResponse: String?

	enum CodingKeys: String, CodingKey {
		case id = "$id"
		case currentDateTime
		case utcOffset
		case isDayLightSavingsTime
		case dayOfTheWeek
		case timeZoneName
		case currentFileTime
		case ordinalDate
		case serviceResponse
	}
}
