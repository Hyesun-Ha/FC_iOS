/*
CH06. 스위프트 Collection 실습 파일
 - Array
 - Dictionary
 - Set
 - Closure + Capturing Value
 */

import UIKit

// --- Array

var evenNumbers: [Int] = [2, 4, 6, 8]
//let evenNumbers2: Array<Int> = [2, 4, 6, 8]


evenNumbers.append(10)
evenNumbers += [12, 14, 16]
evenNumbers.append(contentsOf: [18, 20])


let isEmpty = evenNumbers.isEmpty
evenNumbers.count

//evenNumbers = []
let firstItem = evenNumbers.first

if let firstElement = evenNumbers.first {
    print("---> first item is \(firstElement)")
}

evenNumbers.min()
evenNumbers.max()


var firstItem2 = evenNumbers[0]
var secondItem = evenNumbers[1]
var tenthItem = evenNumbers[9]

let firstThree = evenNumbers[0...2]
evenNumbers.contains(3)
evenNumbers.contains(4)


evenNumbers.insert(0, at: 0)
//evenNumbers.removeAll()
evenNumbers.remove(at: 0)
evenNumbers


evenNumbers[0] = -2
evenNumbers

evenNumbers[0...2] = [-2, 0, 2]
evenNumbers

//evenNumbers.swapAt(0, 9)


//for num in evenNumbers {
//        print(num)
//}

for (index, num) in evenNumbers.enumerated() {
    print("idx: \(index), value: \(num)")
}


let firstThreeRemoved = evenNumbers.dropFirst(3)
evenNumbers

let lastRemoved = evenNumbers.dropLast()
evenNumbers

let firstThree2 = evenNumbers.prefix(3)
firstThree2

let lastThree = evenNumbers.suffix(3)
lastThree



// --- Dictionary

var scoreDic: [String: Int] = ["Jason": 88, "Jay": 98, "Jake": 90]
//var scoreDic: Dictionary<String, Int> = ["Jason": 88, "Jay": 98, "Jake": 90]

if let score = scoreDic["Jason"] {
    score
} else {
    //.. score 없음
}

scoreDic["Jay"]
scoreDic["Jerry"]

// scoreDic = [:]
scoreDic.isEmpty
scoreDic.count

// 기존 사용자 업데이트
scoreDic["Jason"] = 99
scoreDic

// 사용자 추가
scoreDic["Jack"] = 100
scoreDic

// 사용자 제거
scoreDic["Jack"] = nil
scoreDic


// For Loop
for (name, score) in scoreDic {
    print("\(name), \(score)")
}

for key in scoreDic.keys {
    print(key)
}



// 도전 과제
// 1. 이름, 직업, 도시에 대해서 본인의 딕셔너리 만들기
var myDic: [String: String] = ["name": "Hyepang", "occupation": "White Lion", "city": "Seoul"]

// 2. 여기서 도시를 부산으로 업데이트 하기
myDic["city"] = "Busan"

// 3. 딕셔너리를 받아서 이름과 도시 프린트하는 함수 만들기
func printNameAndCity(dic: [String: String]) {
    if let name = dic["name"], let city = dic["city"] {
        print("name: \(name), city: \(city)")
    } else {
        print("---> Can not find")
    }
}

printNameAndCity(dic: myDic)



// --- Set

//var someArray: Array<Int> = [1, 2, 3, 1]
var someSet: Set<Int> = [1, 2, 3, 1]

someSet.isEmpty
someSet.count
someSet.contains(4)


someSet.insert(5)
someSet
someSet.remove(1)
someSet



// --- Closure

var multiplyClosure: (Int, Int) -> Int = { $0 * $1 }
let result = multiplyClosure(4, 2)


func operateTwoNum(a: Int, b: Int, operation: (Int, Int) -> Int) -> Int {
    let result = operation(a, b)
    return result
}
operateTwoNum(a: 4, b: 2, operation: multiplyClosure)

var addClosure: (Int, Int) -> Int = { a, b in
    return a * b
}
operateTwoNum(a: 4, b: 2, operation: addClosure)

operateTwoNum(a: 4, b: 2) { a, b in
    return a / b
}

let voidClosure: () -> Void = {
    print("iOS  개발자 짱, 클로저 사랑해")
}

voidClosure



// --- Capturing Values

var count = 0

let incrementer = {
    count += 1
}

incrementer()
incrementer()
incrementer()
count
