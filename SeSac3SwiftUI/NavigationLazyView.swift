//
//  NavigationLazyView.swift
//  SeSac3SwiftUI
//
//  Created by 염성필 on 2023/11/16.
//

import SwiftUI

// View 프로토콜을 채택하고 있는 요소만 T에 들어올 수 있음
struct NavigationLazyView<T: View>: View {
    let build: () -> T
    // body 내의 데이터를 들어가게 하려고  @escaping () -> T 구성
    // @autoclosure : 클로저구문인데 {} 사용하지 않아됨
    init(_ build :@autoclosure @escaping () -> T) {
        self.build = build
    }
    var body: some View {
        // EmptyView가 많아지면 계속 만들어줘야 되기 때문에 Generic 구조로 만들면 편함 즉 어떤 요소가 들어올 수 있음
        build()
    }
}
