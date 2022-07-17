import UIKit
import Foundation

// Notification Name 설정.
extension Notification.Name {
    static let secretKey = Notification.Name("PUMP")
}

// Notification과 관련된 인스턴스
enum NotificationKey {
    case getQR
}

class XingXingMasterApp {
    func readQR() {
        print("QR코드를 읽혀주세요.")
        // NotificationCenter로 post하기 (발송하기)
        NotificationCenter.default.post(name: Notification.Name.secretKey, object: nil, userInfo: [NotificationKey.getQR: "정상적인 기기의 QR입니다:::"])
    }
}

class FieldMasters {
    let mastersName: String
    
    init(mastersName: String) {
        self.mastersName = mastersName
        // NotificationCenter에 Observer 등록하기.
        NotificationCenter.default.addObserver(self, selector: #selector(responseToMasters(notification:)), name: Notification.Name.secretKey, object: nil)
    }
    
    @objc func responseToMasters(notification: Notification) {
        // notification.userInfo 값을 받아온다.
        guard let response = notification.userInfo?[NotificationKey.getQR] as? String else { return }
        print("\(mastersName) 마스터님, \(response) 작업 진행 바랍니다.")
    }
}

let masterAppActive = XingXingMasterApp()

// 관찰자들 (observer)
let masterOne = FieldMasters(mastersName: "김땡땡")
let masterTwo = FieldMasters(mastersName: "이땡땡")
let masterThree = FieldMasters(mastersName: "박땡땡")

// observer들에게 일을 수행하라고 시킨다.
masterAppActive.readQR()

