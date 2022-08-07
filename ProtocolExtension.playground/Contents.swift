import UIKit
import Foundation

extension Collection {
    func encryptElements(salt: String) -> [Iterator.Element] {
        guard !salt.isEmpty else { return [] }
        guard self.count > 0 else { return [] }
        var index = self.startIndex
        var result: [Iterator.Element] = []
        repeat {
            // Salt 방식으로 암호화된 뒤 결과값에 추가함
            let el = self[index]
            result.append(el)
            index = index.successor()
        } while (index != self.endIndex)
        return result
    }
}
var myarr = [String]()
myarr.append("Mary")

var result = myarr.encryptElements(salt: "test")
