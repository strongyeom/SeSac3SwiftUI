//
//  TransitionView.swift
//  SeSac3SwiftUI
//
//  Created by 염성필 on 2023/11/15.
//



/*
 1. 버튼을 클릭해서 화면 Dismiss / Pop 시도
 2. 화면 전환 할때 데이터 전달
 3. 화면 전환시 분기 처리 - 버튼을 하나 눌렀을때 상태에 따라 분기처리 방법 
 */


import SwiftUI

struct TransitionView: View {
    
    @State private var isFull: Bool = false
    @State private var isSheet: Bool = false
    
    init(isFull: Bool = false, isSheet: Bool = false) {
        self.isFull = isFull
        self.isSheet = isSheet
        print("TransitionView init")
    }
    
    var body: some View {
        NavigationView {
            HStack(spacing: 20) {
                Button("Full") {
                    isFull.toggle()
                }
                
                Button("Sheet") {
                    isSheet = true
                }

                // Push 전환시 Btn 사용하지 않고 NavigationLink 사용
                // 링크로 연결시 A가 B의 상태를 갖고 있기 때문에 init 구문내에 네트워크 통신을 하게 되면 A View에서 다 통신하게 됨
                // 한반더 감싸서 연산 프로퍼티로 만들게 되면 RendetView가 init되지 않게 설정 할 수 있음 
                NavigationLink("Push") {
                     // NavigationLink -> NavigationLazyView -> build -> RenderView
                    // init을 과하게 하지 않기 위해서 랩핑 과정 필요 
                    NavigationLazyView(
                        // View 프로토콜을 따르는 객체 적으면 됨
                        RenderView()
                    )
                }
                
                NavigationLink("Push") {
                     // NavigationLink -> NavigationLazyView -> build -> RenderView
                    // init을 과하게 하지 않기 위해서 랩핑 과정 필요
                    NavigationLazyView(PosterView())
                }
            }
            .sheet(isPresented: $isSheet, content: {
                RenderView()
            })
            .fullScreenCover(isPresented: $isFull) {
                RenderView()
        }
        }
    }
}

struct TransitionView_Previews: PreviewProvider {
    static var previews: some View {
        TransitionView()
    }
}
