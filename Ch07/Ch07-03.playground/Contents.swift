/*
Ch07-03. 스위프트 Structure
프로퍼티, 메소드
*/

import UIKit

// --- 프로퍼티

struct Person {
    var firstName: String {
//        willSet {
//            print("willSet: \(firstName) --> \(newValue)")
//        }
        
        didSet {
            print("didSet: \(oldValue) --> \(firstName)")
        }
    }
    var lastName: String
    
    lazy var isPopular: Bool = {
        if fullName == "Jay Park" {
            return true
        } else {
            return false
        }
    }()
    
    var fullName: String {
        get {
            return "\(firstName) \(lastName)"
        }
        
        set {
            if let firstName = newValue.components(separatedBy: " ").first {
                self.firstName = firstName
            }
            
            if let lastName = newValue.components(separatedBy: " ").last {
                self.lastName = lastName
            }
        }
    }
    
    static let isAlien: Bool = false
}

var person: Person = Person(firstName: "Jason", lastName: "Lee")

person.firstName
person.lastName

person.firstName = "Jim"
person.lastName = "Kim"

person.firstName
person.lastName
person.fullName

person.fullName = "Jay Park"
person.firstName
person.lastName
person.fullName

Person.isAlien

person.isPopular



// --- 메소드

struct Lecture {
    var title: String
    var maxStudents: Int = 10
    var numberOfRegistered: Int = 0
    
    func remainSeats() -> Int {
        let remainSeats = maxStudents - numberOfRegistered
        return remainSeats
    }
    
    mutating func register() {
        // 등록된 학생 수 증가시키기
        numberOfRegistered += 1
        
    }
    
    static let target: String = "Anybody want to learn something"
    
    static func 소속학원이름() -> String {
        return "패캠"
    }
}

var lec = Lecture(title: "iOS Basic")

//func remainSeats(of lec: Lecture) -> Int {
//    let remainSeats = lec.maxStudents - lec.numberOfRegistered
//    return remainSeats
//}

//remainSeats(of: lec)

lec.remainSeats()

lec.register()
lec.remainSeats()
Lecture.target
Lecture.소속학원이름()

struct Math {
    static func abs(value: Int) -> Int {
        if value > 0 {
            return value
        } else {
            return -value
        }
    }
}

Math.abs(value: -20)


// 제곱, 반값
extension Math {
    static func square(value: Int) -> Int {
        return value * value
    }
    
    static func half(value: Int) -> Int {
        return value / 2
    }
}

Math.square(value: 5)
Math.half(value: 20)

var value: Int = 10
// 제곱, 반값

extension Int {
    func square() -> Int {
        return self * self
    }
    
    func half() -> Int {
        return self / 2
    }
}

value.square()
value.half()
