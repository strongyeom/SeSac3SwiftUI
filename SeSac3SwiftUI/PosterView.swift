//
//  PosterView.swift
//  SeSac3SwiftUI
//
//  Created by 염성필 on 2023/11/15.
//

import SwiftUI

/*
 - ScrollView
 - LazyVStack : infinity로 설정하지 않아서 전체 Scene을 차지함 스크롤 뷰를 쓸때 자주 같이 사용됨
 👉 차이점: 테이블 뷰나 콜렉션 뷰 처럼 재사용 매커니즘처럼 Scene에서 보여지는 부분만 보여줌
 Scene에 보여지는 데이터가 많지 않으면 VStack을 써도 괜찮음
   ex) 네트워크 통신으로 가져와야 하는 상황일때 VStack인 경우 : 모든 데이터를 불러옴
                                  🔴 LazyVStack인 경우 : Scene에 보여지는 부분만 불러옴
 
 - List: 내부에 Lazy 속성이 있음
 
 - AsyncImage (iOS 15.0): 기존 이미지 URL 기반으로 이미지를 보여줬다면 Kingfisher를 사용하지 않고도 이미지를 보옂 줄 수 있음
 
 */


struct PosterView: View {
    
    @State private var isPresent: Bool = false
    
    var body: some View {

        ScrollView(showsIndicators: false) {
            LazyVStack {
                ForEach(0..<50) { item in
                    AsyncImageView()
                        // 크기를 지정할때 vs 크기를 지정하지 않았을때 차이점
                        .frame(width: 100, height: 100)
                        .border(.red, width: 2)
                        .onTapGesture {
                            print("\(item)인덱스 Tap")
                            isPresent.toggle()
                        }
                }
            }
            // LazyVStack 위에 띄어야하기 때문에 위치 중요 
            .sheet(isPresented: $isPresent) {
                RenderView()
            }
//            .frame(maxWidth: .infinity)
        }
        .background(.yellow) // 텍스트 크기만큼만 스크롤됨
        
    }
}

// 코드 분리를 위해 구조체 생성
struct AsyncImageView : View {
    let url = URL(string: "https://picsum.photos/200")
    
    var body: some View {
        // 이미지가 안올때 처리
        VStack {
//            AsyncImage(url: url) { image in
//                // 성공 했을때
//                image
//                    .resizable()
//                    .frame(width: 100, height: 100)
//                    .scaledToFit()
//    //                .cornerRadius(10)
//                // 이렇게 써야됌 cornerRadius deprecated 될 예정
//                    .clipShape(RoundedRectangle(cornerRadius: 20))
//            } placeholder: {
//                // 에러 발생했을때 나타날 기본 이미지 설정
//    //            Image(systemName: "flame")
//                ProgressView()
//        }
            
            
            // 🔴 서버에 응답이 없거나 URL이 잘못 된 경우???
            // AsyncImagePhase -> View로 구성되어 있는 AsyncImage 사용하여 에러 핸들링 가능
            AsyncImage(url: url) { data in
                // 각 단계별로
                switch data {
                case .empty:
                    // 이미지가 뜨기 전에 보여주는 부분
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .frame(width: 100, height: 100)
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                case .failure(_): // error를 사용하지 않기 때문에 생략 가능
                    // data(URL)가 잘못된 경우 기본 이미지 띄어주기
                    Image(systemName: "flame")
                @unknown default:
                    Image(systemName: "flame")
                }
            }
            
            
        }
       
    }
}

struct PosterView_Previews: PreviewProvider {
    static var previews: some View {
        PosterView()
    }
}
