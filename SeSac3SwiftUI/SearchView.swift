//
//  SearchView.swift
//  SeSac3SwiftUI
//
//  Created by 염성필 on 2023/11/16.
//

import SwiftUI

struct SearchView: View {
    
    @State private var randomNumber = 0
    
    init(randomNumber: Int = 0) {
        self.randomNumber = randomNumber
        print("SearchView init")
    }
    
    var body: some View {
        
        /*
         상태가 변화하면 body에 있는 모든 것을 다시 랜더링 함 <- 🔴 구조체를 사용한것 제외
         */
        VStack {
            Text("Hello, World! \(randomNumber)")
                .background(Color.random())
            second()
            third
            FourView()
            Button("클릭") {
                randomNumber = Int.random(in: 1...100)
            }
        }
    }
    // func 로 분리
    func second() -> some View {
        Text("Hello, World!2")
            .background(Color.random())
    }
    
    // 연산 프로퍼티로 분리
    var third: some View {
        Text("Hello, World!3")
            .background(Color.random())
    }
}

// 구조체로 분리
struct FourView: View {
    
    // init()을 사용을 해당 구조체가 생성되는지 확인 가능 -> 즉, body가 랜더링 될때마다 다시 생성됨
    
    init() {
        print("FourView init")
        // ❗️네트워크 통신 구문 같은 경우 init에 적용하면 안됨 왜?? => 랜더링 될때마다 계속 init이 탐
    }
    
    // => ❓ 근데 왜 body의 내용은 바뀌지 않는거지??
    // body가 연산 프로퍼티이기 때문에 메모리에 올라가지 않음 -> 직접 호출을 해야 메모리를 먹게됨
    // init() 과 body는 별도로 동작함
    var body: some View {
        Text("Hello, World!4")
            .background(Color.random())
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

extension Color {
    static func random() -> Color {
        return Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }
}
