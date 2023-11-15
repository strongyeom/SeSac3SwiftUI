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
                NavigationLink("Push") {
                    RenderView()
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
