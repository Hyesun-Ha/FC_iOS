/*
CH05-2. 스위프트 Function_and_Optional 실습 파일
- Optional
 */

import UIKit

/// ---- Optional

var carName: String?
carName = nil
carName = "땡크"


// 아주 간단한 과제
// 여러분이 최애하는 영화 배우의 이름을 담는 변수를 작성해 보세요(타입: String?)
// let num = Int("10") -> 타입은 뭘까요?

var favoriteMovieStar: String? = "Minho"
let num = Int("10")


// 고급 기능 4가지

// forced unwrapping
// Optional binding(if let)
// Optional binding(guard)
// Nil calescing

carName = nil
//print(carName!) 오류!

if let unwrappedCarName = carName {
    print(unwrappedCarName)
} else {
    print("Car Name 없다")
}

func printParsedInt(from: String) {
    if let parsedInt = Int(from){
        print(parsedInt)
        // Cyclomatic Complextity
    } else {
        print("Int로 컨버팅 안되지롱")
    }
}

printParsedInt(from: "100")
printParsedInt(from: "헬로우")


func printParsedInt2(from: String) {
    guard let parsedInt = Int(from) else {
        print("Int로 컨버팅 안되지롱")
        return
    }
    print(parsedInt)
}
printParsedInt2(from: "100")
printParsedInt2(from: "헬로헬로")

carName = nil
let myCarName: String = carName ?? "모델 S"


// --- 도전 과제

// 1. 최애 음식 이름을 담는 변수를 작성하시고 (String?),
let favoriteFood: String? = "홈런볼"

// 2. 옵셔널 바인딩을 이용해서 값을 확인해보기
if let foodName = favoriteFood {
    print(foodName)
} else {
    print("엉엉 좋아하는 음식이 없네요")
}

let foodName: String = favoriteFood ?? "오징어 땅콩"

// 3. 닉네임을 받아서 출력하는 함수 만들기, 조건 입력 파라미터는 String?
func printNickName(_ name: String?) {
    guard let nickName = name else {
        print("별명이 없뉑! 만들어보자")
        return
    }
    print(nickName)
}

printNickName("혜팡이")
printNickName(nil)
