//
//  GirdView.swift
//  SeSac3SwiftUI
//
//  Created by 염성필 on 2023/11/17.
//

import SwiftUI

struct GridView: View {
    
    @Binding var movie: [Movie]
    
//    private let layout = [
//        GridItem(.fixed(120)),
//        GridItem(.fixed(120)),
//        GridItem(.fixed(120)),
//        GridItem(.fixed(120))
//    ]
    
//    private let layout = [
//        // flexible: size의 최소 최대를 직접 지정해줄 수 있음
//        GridItem(.flexible(minimum: 100, maximum: 250)),
//        GridItem(.fixed(100)),
//        GridItem(.fixed(100))
//    ]
    
    private let layout = [
        // spacing: 여백에 대해 보장해줌
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    @State var dummy = Array(1...100).map { "오늘의 영화 순위 \($0)" }
    var body: some View {
        
        // columns : 수직 스크롤시 itme을 몇개를 넣어 줄것이냐
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach(dummy, id: \.self) { item in
                    ZStack {
                        Color.random()
                        Text(item)
                    }
                }
            }
            .padding()
        }
        // onAppear: View가 뜨기 전에 액션을 취할 수 있음
        .onAppear {
            // 이부분에 네트워크 통신 많이함
            dummy.insert("enend", at: 0)
        }
        // task: 비동기로 처리할 수 있음 무거운 작업들
        .task {
            // ex) 네트워크 통신 할때 사용
        }
        
    }
    
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        // .constant : 실질적인 값을 Binding<T>의 형태로 감싸서 return 해줌
        GridView(movie: .constant([Movie(name: "영화"),
                                    Movie(name: "드라마"),
                                    Movie(name: "장르"),]))
    }
}
