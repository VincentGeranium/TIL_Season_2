//
//  main.swift
//  ObserPatternExample
//
//  Created by Kwangjun Kim on 2022/07/16.
//

import Foundation

let pumpCompany = PUMPcompany(observers: [])

let kakaoUserSEOUL = Users(id: "kakaoUserSEOUL")
let xingxingUserSEOUL = Users(id: "xingxingUserSEOUL")
let xingxingUserDEAJEON = Users(id: "xingxingUserDEAJEON")
let xingxingUserSEJONG = Users(id: "xingxingUserSEJONG")
let kakaoUserSEJONG = Users(id: "kakaoUserSEJONG")
let kakaoUserINCHEON = Users(id: "kakaoUserINCHEON")
let xingxingUserDAEGU = Users(id: "xingxingUserDAEGU")
let xingxingUserBUSAN = Users(id: "xingxingUserBUSAN")

pumpCompany.subscribe(observer: kakaoUserSEOUL)
pumpCompany.subscribe(observer: xingxingUserSEOUL)
pumpCompany.subscribe(observer: xingxingUserDEAJEON)
pumpCompany.subscribe(observer: xingxingUserSEJONG)
pumpCompany.subscribe(observer: xingxingUserDAEGU)
pumpCompany.subscribe(observer: xingxingUserBUSAN)

pumpCompany.notify(message: "신나게 달리길 원하는 씽씽이")

pumpCompany.unSubscribe(observer: xingxingUserSEOUL)

pumpCompany.messageToCompany(message: "알림을 꺼놨습니다")

