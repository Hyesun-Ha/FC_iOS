/*
Ch06-02. Closures 실습 파일
*/

import UIKit

/*
{ (param) -> return type in
    statement
    ...
}
*/

// Ex 1: Simple Closure
let simpleClosure = {
    
}

simpleClosure()


// Ex 2: 코드 블록을 구현한 Closure
let simpleClosure2 = {
    print("Hello, 클로저, 코로나 하이!")
}

simpleClosure2()

// Ex 3: Inpur parameter를 받는 Closure
let simpleClosure3: (String) -> Void = {name in
    print("Hello, 클로저, 나의 이름은 \(name) 입니다.")
}

simpleClosure3("코로나 미워")

// Ex 4: 값을 return 하는 Closure
let simpleClosure4: (String) -> String = {name in
    let message = "iOS 개발 만만세, \(name)님 경제적 자유를 얻으실 거예요!"
    return message
}

let result = simpleClosure4("코로나 미워")
print(result)

// Ex 5: Closure를 parameter로 받는 함수 구현
func someSimpleFunction(simpleClosure2: () -> Void) {
    print("함수에서 호출이 되었어요")
    simpleClosure2()
}

someSimpleFunction(simpleClosure2: {
    print("Hello 코로나 from closure~")
})

// Ex 6: Trailing Closure
func someSimpleFunction(message: String, simpleClosure2: () -> Void) {
    print("함수에서 호출이 되었어요, 메세지: \(message)")
    simpleClosure2()
}

someSimpleFunction(message: "로나로나 메로나, 코로나는 싫어!") {
    print("Hello 코로나 from closure")
}
