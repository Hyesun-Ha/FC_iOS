/*
Ch08-02. 스위프트 Class 실습
Inheritance
*/

import UIKit

struct Grade {
    var letter: Character
    var points: Double
    var credits: Double
}

class Person {
    var firstName: String
    var lastName: String

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }

    func printMyName() {
        print("My name is \(firstName) \(lastName)")
    }
}

class Student: Person {
    var grades: [Grade] = []
}

let jay = Person(firstName: "Jay", lastName: "Lee")
let jason = Student(firstName: "Jason", lastName: "Lee")

jay.firstName
jason.firstName

jay.printMyName()
jason.printMyName()

let math = Grade(letter: "B", points: 8.5, credits: 3)
let history = Grade(letter: "A", points: 10.0, credits: 3)
jason.grades.append(math)
jason.grades.append(history)

jason.grades.count


// 학생인데 운동선수
class StudentAthlete: Student {
    var minimumTrainingTime: Int = 2
    var trainedTime: Int = 0
    
    func train() {
        trainedTime += 1
    }
}

// 운동선수인데 축구선수
class FootballPlayer: StudentAthlete {
    var footballTeam = "FC Swift"
    
    override func train() {
        trainedTime += 2
    }
}

//Person > Student > Athlete > FootballPlayer

var athlete1 = StudentAthlete(firstName: "Yuna", lastName: "Kim")
var athlete2 = FootballPlayer(firstName: "Heung", lastName: "Son")

athlete1.firstName
athlete2.firstName

athlete1.grades.append(math)
athlete2.grades.append(math)

athlete1.minimumTrainingTime
athlete2.minimumTrainingTime

athlete2.footballTeam

athlete1.train()
athlete1.trainedTime

athlete2.train()
athlete2.trainedTime


athlete1 = athlete2 as StudentAthlete
athlete1.train()
athlete1.trainedTime

if let son = athlete1 as? FootballPlayer {
    print("---> team: \(son.footballTeam)")
}

