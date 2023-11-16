//
//  SearchView.swift
//  SeSac3SwiftUI
//
//  Created by 염성필 on 2023/11/16.
//

import SwiftUI

struct Movie: Hashable {
    let id = UUID() // 모델에 Hashable한 게 있으면 생략가능하지만 없을때 UUID() 생성
    let name: String
    let color = Color.random()
}

struct SearchView: View {
    @State private var searchQuery = ""
    let movie: [Movie] = [
        Movie(name: "AVdsdC"),
        Movie(name: "asads"),
        Movie(name: "SRO@@SD"),
        Movie(name: "DNC@DWI"),
        Movie(name: "DJE@!!I"),
        Movie(name: "FJESDSDI"),
        ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(movie, id: \.id) { item in
                    NavigationLink(destination: {
                        SearchDetailView(data: item)
                    }, label: {
                        HStack {
                            Circle().fill(item.color)
                            Text("안녕하세요 \(item.name)")
                            
                        }
                        .frame(height: 60)
                    })
                }
            }
            .listStyle(.plain)
            .navigationTitle("검색")
        }
        // 검색하는 modifier text: 바인딩String, placement: 검색컨트롤로 위치, prompt: 플레이스홀더
        .searchable(text: $searchQuery, placement: .navigationBarDrawer, prompt: "검색해보세요")
        // 검색을 하는 시점 onSubmit
        .onSubmit(of: .search) {
            print("\(searchQuery)")
        }
    }
}

//struct SearchView: View {
//
//    @State private var randomNumber = 0
//
//    init(randomNumber: Int = 0) {
//        self.randomNumber = randomNumber
//        print("SearchView init")
//    }
//
//    var body: some View {
//
//        /*
//         상태가 변화하면 body에 있는 모든 것을 다시 랜더링 함 <- 🔴 구조체를 사용한것 제외
//         */
//        VStack {
//            Text("Hello, World! \(randomNumber)")
//                .background(Color.random())
//            second()
//            third
//            FourView()
//            Button("클릭") {
//                randomNumber = Int.random(in: 1...100)
//            }
//        }
//    }
//    // func 로 분리
//    func second() -> some View {
//        Text("Hello, World!2")
//            .background(Color.random())
//    }
//
//    // 연산 프로퍼티로 분리
//    var third: some View {
//        Text("Hello, World!3")
//            .background(Color.random())
//    }
//}

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

struct SearchDetailView: View {
    
    let data : Movie
    var body: some View {
        Text("\(data.name)")
            .font(.title)
            .bold()
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
