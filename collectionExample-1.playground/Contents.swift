import UIKit

struct Person {
    var firstName: String
    var lastName: String
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

class Address {
    var street: String = ""
    var city: String = ""
    var state: String = ""
    var zipcode: String = ""
    init(street: String, city: String, state: String, zipcode: String) {
        self.street = street
        self.city = city
        self.state = state
        self.zipcode = zipcode
    }
}

// Person 구조체의 상수 인스턴스 생성
let person = Person(firstName: "Minsung", lastName: "Kang")

// 컴파일 에러 발생
//person.firstName = "Vincent"

// 클래스의 상수 인스턴스 생성
let address = Address(street: "1 Infinite Loop", city: "Cupertino", state: "CA", zipcode: "95014")

// Address가 래퍼런스 타입이므로
// 컴파일 타임 에러 발생하지 않고 정상 작동
address.city = "1991 Jun Avenue"

// Address 인스턴스가 상수이고 다른 인스턴스로 전달하는
// 시점에서는 수정 불가하므로 컴파일 타임 에러 발생
address = Address(street: "1991 Jun Avenue", city: "Cupertino", state: "CA", zipcode: "95014")
