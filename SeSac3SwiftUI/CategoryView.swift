//
//  CategoryView.swift
//  SeSac3SwiftUI
//
//  Created by 염성필 on 2023/11/15.
//

import SwiftUI

/*
 ForEach
 - Swift KeyPath \.
 - id: KeyPath <- Hashable 해야함
 */


// ForEach문에서 보여주는 모델은 Hashable 해야함
// Identifiable : id라는 값을 강제해서 사용할 수 있게 해줌
struct Category: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let count: Int
}

struct CategoryView: View {
    
    let category = [
    Category(name: "스릴러", count: 3),
    Category(name: "드라마", count: 4),
    Category(name: "액션", count: 5),
    Category(name: "로먄스", count: 6),
    Category(name: "다큐", count: 7),
    Category(name: "다큐", count: 3)
    ]
    var body: some View {
        VStack {
            // 반복문을 돌면서 Hashable하게끔 설정 데이터를 넣고 고유값을 설정 할 수 있음
            // id에서 설정한 값에 따라 item에 들어오는 데이터가 달라짐
            ForEach(category, id: \.id) { item in
                Text("안녕하세요 \(item.name) \(item.count)")
                    .font(.title)
            }
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
