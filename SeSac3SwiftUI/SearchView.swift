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
    
    // 전체데이터
    let movie: [Movie] = [
        Movie(name: "AVdsdC"),
        Movie(name: "asads"),
        Movie(name: "SRO@@SD"),
        Movie(name: "DNC@DWI"),
        Movie(name: "DJE@!!I"),
        Movie(name: "FJESDSDI"),
        ]
    
    // 필터 데이터 생성
    var filteredMovieData: [Movie] {
        return searchQuery.isEmpty ? movie : movie.filter { $0.name.contains(searchQuery)}
    }
    
   //@State var aa: [Movie] = []
    
    var body: some View {
        NavigationStack { // NavigationLink(Value: , label: )을 사용해야함 => 왜쓰나요>??
            // 이유 : init을 타지 않게 하기 해서 NavationLazyView를 사용했는데 16.0 이상부터 NavigationStack을 사용하면 손쉽게 해결 init()을 안타게 할 수 있음
            List {
                ForEach(filteredMovieData, id: \.self) { item in
                    // 네비게이션 뷰 일때 사용
//                    NavigationLink(destination: {
//                        SearchDetailView(data: item)
//                    }, label: {
//                        HStack {
//                            Circle().fill(item.color)
//                            Text("안녕하세요 \(item.name)")
//
//                        }
//                        .frame(height: 60)
//                    })
                    
                    // NavigationStack을 사용할때 value: 을 사용한다. 데이터기반 Hashable
                    NavigationLink(value: item) {
                        HStack {
                            Circle().fill(item.color)
                            Text("안녕하세요 \(item.name)")
                        }
                        .frame(height: 60)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("검색")
            .navigationBarTitleDisplayMode(.large)
            // toolbar : 네이게이션 컨트롤러에 사용되고, 하단에 UIToolBar의 영역으로도 사용 할 수 있음
            .toolbar(content: {
                
                // ToolbarItemGroup : Toolbar에서 요소의 위치를 선정해 줄 수 있음
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    // Button으로 UIBarButton과 Button을 같이 쓸 수 있음
                    Button {
                        print("클릭되었습니다.")
                    } label: {
                        Image(systemName: "star.fill")
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        print("클릭되었습니다.")
                    } label: {
                        Image(systemName: "star")
                    }
                }

            })
            // 전환하려고하는 View
            // for: Hashable 모델의 그 자체
            // 클로저 구문안에 Hashable 한것 즉, 해당 모델
            .navigationDestination(for: Movie.self) { item in
                SearchDetailView(data: item)
            }
            // 검색하는 modifier text: 바인딩String, placement: 검색컨트롤로 위치, prompt: 플레이스홀더
            .searchable(text: $searchQuery, placement: .navigationBarDrawer, prompt: "검색해보세요")
            // 검색을 하는 시점(enter를 눌렀을때) onSubmit
            .onSubmit(of: .search) {
                print("\(searchQuery)")
        }
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
    // 현재는 단방향이기 때문에 Binding까지는 필요없음
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
