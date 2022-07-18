import UIKit
import Foundation

let adminRole: Set = ["READ", "EDIT", "DELETE", "CREATE", "SETTINGS", "PUBLISH_ANY", "ADD_USER", "EDIT_UESR", "DELETE_UESR"]

let editorRole: Set = ["READ", "EDIT", "DELETE", "CREATE", "PUBLISH_ANY"]

let authorRole: Set = ["READ", "EDIT_OWN", "DELETE_OWN", "PUBLISH_OWN", "CREATE"]

let contributorRole: Set = ["CREATE", "EDIT_OWN"]

let subscricberRole: Set = ["READ"]

// 두 개 세트에 있는 요소를 모두 포함시킴.
let fooResource = subscricberRole.union(contributorRole)
print(fooResource)
// 두 개 세트에 공통적으로 있는 요소를 포함시킴.
let commonPermissions = authorRole.intersection(contributorRole)
print(commonPermissions)

// 한 쪽에는 있지만, 다른 한쪽에는 없는 요소만을 포함시킴.
let exclusivePermissions = authorRole.symmetricDifference(contributorRole)
print(exclusivePermissions)
