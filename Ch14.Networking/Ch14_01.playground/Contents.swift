/*
Ch14-01. 스위프트 GCD
GCD 실습
*/

import UIKit

// Queue - Main, Global, Custom

// Main
DispatchQueue.main.async {
    // UI update
    let view = UIView()
    view.backgroundColor =  #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
}

// Global
DispatchQueue.global(qos: .userInteractive).async {
    // 진짜 핵중요, 지금 해야하는 것
}

DispatchQueue.global(qos: .userInitiated).async {
    // 거의 바로 해줘야 할것, 사용자가 결과를 기다린다.
}

DispatchQueue.global(qos: .default).async {
    // 이건 굳이??
}

DispatchQueue.global(qos: .utility).async {
    // 시간이 좀 걸리는 일들, 사용자가 당장 기다리지 않는 것
    // 네트워킹, 큰 파일 불러올 때?
}

DispatchQueue.global(qos: .background).async {
    // 사용자에게 당장 인식될 필요가 없는 것들
    // 뉴스 데이터 미리 받기, 위치 업데이트, 영상 다운받는다던지...
}

// Custom
let concurrentQueue = DispatchQueue(label: "concurrent", qos: .background, attributes: .concurrent)
let serialQueue = DispatchQueue(label: "serial", qos: .background)


// 복합적인 상황
func downloadImageFromServer() -> UIImage {
    // Heavy task
    return UIImage()
}

func updateUI(image: UIImage) {
    
}

DispatchQueue.global(qos: .background).async {
    let image = downloadImageFromServer()
    
    DispatchQueue.main.async {
        updateUI(image: image)
    }
}

// Sync, Async

/*
// Async
DispatchQueue.global(qos: .background).async {
    for i in 0...5 {
        print("🤍 \(i)")
    }
}

DispatchQueue.global(qos: .userInteractive).async {
    for i in 0...5 {
        print("💜 \(i)")
    }
}
*/

//Sync
DispatchQueue.global(qos: .background).sync {
    for i in 0...5 {
        print("💛 \(i)")
    }
}

DispatchQueue.global(qos: .userInteractive).async {
    for i in 0...5 {
        print("💚 \(i)")
    }
}
