import UIKit
import Foundation

// 1) Delegate 프로토콜 선언.
protocol XingXing {
    func ride(userId: String, IsDriver: Bool)
}

class User {
    var IsDriver: Bool?
    var userId: String?
    // 2) delegate 프로퍼티
    var delegate: XingXing?
    
    init(IsDriver: Bool, userId: String) {
        self.IsDriver = IsDriver
        self.userId = userId
        // 3) delegate를 자신으로 설정
        self.delegate = self
        
        xingxingRide(with: userId, IsDriver: IsDriver)
    }
    
    
    func xingxingRide(with userId: String, IsDriver: Bool) {
        // 6) 이벤트가 일어날 시 delegate가 동작함.
        delegate?.ride(userId: userId, IsDriver: IsDriver)
    }
}

// 4) XingXing 프로토콜을 따르도록 함
extension User: XingXing {
    // 5) XingXing 프로토콜에 적힌 메소드 구현.
    func ride(userId: String, IsDriver: Bool) {
        if IsDriver == true {
            print("\(userId)님과 함께 신나고 즐거운 씽씽 라이딩!! :)")
        } else if IsDriver == false {
            print("\(userId)님 죄송합니다. 씽씽 라이딩을 위해서는 운전면허가 필수 사항입니다. :(")
        }
        
    }
}

let xingxingAppUser = User(IsDriver: true, userId: "강민성")
let kakaoAppUser = User(IsDriver: false, userId: "김성미")
