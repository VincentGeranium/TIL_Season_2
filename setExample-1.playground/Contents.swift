import UIKit
import Foundation

var stringSet: Set = ["Erik", "Mary", "Michael", "John", "Sally"]

for name in stringSet {
    print("name = \(name)")
}
print("------------------------------------")
for name in stringSet.sorted() {
    print("name = \(name)")
}

//stringSet.insert("Patrick")
//
//if stringSet.contains("Erik") {
//    print("Found element")
//} else {
//    print("Element not found")
//}
//
//stringSet.remove("Erik")
//
//if let idx = stringSet.firstIndex(of: "John") {
//    stringSet.remove(at: idx)
//}
//
//stringSet.removeFirst()
//
//stringSet.removeAll()
