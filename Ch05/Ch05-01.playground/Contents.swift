/*
CH05-1. 스위프트 Function_and_Optional 실습 파일
- Function
 */

import UIKit

func printName(){
    print("---> My name is Jason")
}

printName()

// param 1개
// 숫자를 받아서 10을 곱해서 출력한다

func printMutipleOfTen(value: Int) {
    print("\(value) * 10 = \(value * 10)")
}

printMutipleOfTen(value: 5)


// param 2개
// 물건 값과 개수를 받아서 전체 금액을 출력하는 함수

func printTotalPrice(price: Int, count: Int){
    print("Total Price = \(price * count)")
}

printTotalPrice(price: 1500, count: 5)

func printTotalPrice(_ price: Int, _ count: Int){
    print("Total Price = \(price * count)")
}

printTotalPrice(1500, 5)

func printTotalPrice2(price: Int, count: Int){
    print("Total Price = \(price * count)")
}

printTotalPrice2(price: 1500, count: 5)
printTotalPrice2(price: 1500, count: 10)
printTotalPrice2(price: 1500, count: 7)
printTotalPrice2(price: 1500, count: 1)

func printTotalPriceDefaultValue(price: Int = 1500, count: Int){
    print("Total Price = \(price * count)")
}

printTotalPriceDefaultValue(count: 5)
printTotalPriceDefaultValue(count: 10)
printTotalPriceDefaultValue(count: 7)
printTotalPriceDefaultValue(price: 2000, count: 1)


func totalPrice(price: Int, count: Int) -> Int {
    let totalPrice = price * count
    return totalPrice
}

let calculatedPrice = totalPrice(price: 10000, count: 77)
calculatedPrice



//---도전 과제
// 1. 성, 이름을 받아서 fullname을 출력하는 함수 만들기

func printFullName(firstName: String, lastName: String) {
    print(" fullname is \(firstName) \(lastName)")
}
printFullName(firstName: "Jason", lastName: "Lee")

// 2. 1번에서 만든 함수인데, 파라미터 이름을 제거하고 fullname 출력하는 함수 만들기
func printFullName(_ firstName: String, _ lastName: String){
    print(" fullname is \(firstName) \(lastName)")
}

printFullName("Jason", "Lee")

// 3. 성, 이름을 받아서 fullname return 하는 함수 만들기
func fullName(firstName: String, lastName: String) -> String{
    return " fullname is \(firstName) \(lastName)"
}

let name = fullName(firstName: "Jason", lastName: "Lee")
name

/*
func functionName(externalName param: ParameterType) -> returnType {
    // code...
    return returnValue
}
*/


// --- In-out parameter

var value = 3

func incrementAndPrint(_ value: inout Int) {
    value += 1
    print(value)
}
incrementAndPrint(&value)


// --- Function as a param

func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func subtract(_ a: Int, _ b: Int) -> Int {
    return a - b
}

var function = add
function(4, 2)
function = subtract
function(4, 2)

func printResult(_ function: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    let result = function(a, b)
    print(result)
}

printResult(add, 10, 5)
printResult(subtract, 10, 5)
