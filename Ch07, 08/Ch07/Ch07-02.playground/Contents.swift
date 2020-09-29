/*
Ch07-02. 스위프트 Structure
구조체 도전과제, 프로토콜
*/

import UIKit

// 도전 과제 -- 내가 만든 것
// 1. 강의 이름, 강사 이름, 학생수를 가지는 Struct 만들기 (Lecture)
struct Lecture {
    let lectureName: String
    let teacher: String
    let studentCount: Int
}

// 2. 강의 array와 강사 이름을 받아서, 해당 강사의 강의 이름을 출력하는 함수 만들기
func printLectureName(lectures: [Lecture], teacherName: String) {
    if let searchedLectureName = lectures.first(where: { $0.teacher == teacherName })?.lectureName {
        print("LectureName: \(searchedLectureName)")
    } else {
        print("Lecture by \(teacherName) doesn't exist")
    }
}

// 3. 강의 3개 만드록 강사 이름으로 강사 찾기
let lecture1 = Lecture(lectureName: "Math", teacher: "Rabbit", studentCount: 6)
let lecture2 = Lecture(lectureName: "English", teacher: "Turtle", studentCount: 12)
let lecture3 = Lecture(lectureName: "Korean", teacher: "Wind", studentCount: 8)

let myLectures = [lecture1, lecture2, lecture3]

printLectureName(lectures: myLectures, teacherName: "Sam")




// 도전 과제 -- 풀이
// 1. 강의 이름, 강사 이름, 학생수를 가지는 Struct 만들기 (Lecture)
// 2. 강의 array와 강사 이름을 받아서, 해당 강사의 강의 이름을 출력하는 함수 만들기
// 3. 강의 3개 만드록 강사 이름으로 강사 찾기


// --- CustomStringConvertible

struct Lecture2: CustomStringConvertible {
    var description: String {
        return "Title: \(name), Instructor: \(instructor)"
    }
    
    let name: String
    let instructor: String
    let numOfStudent: Int
}

func printLectureName(from instructor: String, lectures: [Lecture2]) {
    let lectureName = lectures.first { $0.instructor == instructor }?.name ?? ""
    
    print("아 그 강사님 강의는요 \(lectureName)")
}

let lec1 = Lecture2(name: "iOS Basic", instructor: "Jason", numOfStudent: 5)
let lec2 = Lecture2(name: "iOS Advanced", instructor: "Jack", numOfStudent: 5)
let lec3 = Lecture2(name: "iOS Pro", instructor: "Jim", numOfStudent: 5)

let lectures = [lec1, lec2, lec3]

printLectureName(from: "Jack", lectures: lectures)
print(lec1)
