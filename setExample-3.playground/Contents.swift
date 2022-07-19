import UIKit

let adminRole: Set = ["READ", "EDIT", "DELETE", "CREATE", "SETTINGS", "PUBLISH_ANY", "ADD_USER", "EDIT_UESR", "DELETE_UESR"]

let editorRole: Set = ["READ", "EDIT", "DELETE", "CREATE", "PUBLISH_ANY"]

let authorRole: Set = ["READ", "EDIT_OWN", "DELETE_OWN", "PUBLISH_OWN", "CREATE"]

let contributorRole: Set = ["CREATE", "EDIT_OWN"]

let subscricberRole: Set = ["READ"]

// 두 개 세트에 있는 요소를 모두 포함시킴.
let fooResource = subscricberRole.union(contributorRole)
//print(fooResource)
// 두 개 세트에 공통적으로 있는 요소를 포함시킴.
let commonPermissions = authorRole.intersection(contributorRole)
//print(commonPermissions)

// 한 쪽에는 있지만, 다른 한쪽에는 없는 요소만을 포함시킴.
let exclusivePermissions = authorRole.symmetricDifference(contributorRole)
//print(exclusivePermissions)

// 세트의 요소의 순서는 중요하지 않다
var sourceSet: Set = [1, 2, 3]
var destSet: Set = [2, 1, 3]

var isEqual = sourceSet == destSet
//print(isEqual)

let contactResource = authorRole
print(contributorRole)

let userBob = subscricberRole
print(userBob)

let userSally = authorRole
print(userSally)

if userBob.isSubset(of: fooResource) {
    print("Access granted")
} else {
    print("Access denied")
}

if userSally.isSubset(of: fooResource) {
    print("Access granted")
} else {
    print("Access denied")
}

let isTrueOrFalse = authorRole.isDisjoint(with: editorRole)
print(isTrueOrFalse)

let isTrueOfFalse2 = editorRole.isSubset(of: adminRole)
print(isTrueOfFalse2)








