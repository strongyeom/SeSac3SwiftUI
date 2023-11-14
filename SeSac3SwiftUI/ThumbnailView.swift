//
//  ThumbnailView.swift
//  SeSac3SwiftUI
//
//  Created by 염성필 on 2023/11/14.
//

import SwiftUI

struct ThumbnailView: View {
    @State private var isShow: Bool = false
    var body: some View {
        ZStack {
           
            Image("image")
                .resizable() // 사이즈 조절할 수 있게 설정 도와줌
                .ignoresSafeArea()
            Image("image")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: .center)
                .border(.blue, width: 2)
            Text("크크크 치킨")
            
            VStack {
                Button("SHOW") {
                   //Bool 값에 따라 화면 전환하기
                    isShow = true
                }
                .padding()
                .background(.white)
                Spacer()
            }
            .border(.red)
            
            VStack {
                Spacer()
                HStack {
                        Circle()
                        .stroke(.red, lineWidth: 2)
                        .overlay {
                            Image("image")
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                        }
                        
                      
                        
                        Circle()
                        Circle()
//                        Image("image")
//                            .resizable()
//                            .scaledToFit()
//                            .border(.blue, width: 2)
//                        Image("image")
//                            .resizable()
//                            .scaledToFit()
//                            .border(.blue, width: 2)
//                        Image("image")
//                            .resizable()
//                            .scaledToFit()
//                            .border(.blue, width: 2)
                }
            }
            .border(.green)
        }
        // ThumbnailView 위로 새로운 뷰가 띄어지는 것이기 때문에 ZStack 전체서 sheet 적용
        .sheet(isPresented: $isShow) {
            TamagochiView()
        }
//        .fullScreenCover(isPresented: <#T##Binding<Bool>#>, content: <#T##() -> View#>)
        
        
    }
}

struct ThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        ThumbnailView()
    }
}
