//
//  MenuView.swift
//  SeSac3SwiftUI
//
//  Created by 염성필 on 2023/11/13.
//

import SwiftUI

struct MenuView: View {
    
    // 다른 View에서 사용하지 않으면 프로퍼티로 만들어서 사용할 수 있음
    var cardProperty: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(systemName: "star")
                .background(.red)
            Text("cardProperty")
                .foregroundColor(.white)
        }
        .padding()
        .background(.blue)
    }
    
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                CardView(text: "1312")
                cardProperty
                CardView(text: "Gfdg")
                 
            }
            
            List {
                Section("첫번째 섹션") {
                    DatePicker("Date", selection: .constant(Date()))
                    Text("보안과 인증")
                        .modifier(PointBoardText())
                    Text("내 신용점수")
                    Text("보안과 인증")
                }
            
                Section("자산") {
                    Text("보안과 인증")
                        .asPointBorderText()
                    Text("내 신용점수")
                    Text("보안과 인증")
                }
            }
            .listStyle(.plain)
        }
    }
}



struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct CardView: View {
    
    let text : String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(systemName: "star")
                .background(.red)
            Text(text)
                .foregroundColor(.white)
                // 밑 줄
                .underline(color: .red)
                // 취소선
                .strikethrough()
        }
        .padding()
        .background(.blue)
    }
}

// 반복되는 modifier를 커스텀으로 만들어보기
struct PointBoardText: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.title)
            .padding(10)
            .foregroundColor(.white)
            .background(.purple)
            .clipShape(Capsule())
    }
}

extension View {
    
    func asPointBorderText() -> some View {
        modifier(PointBoardText())
    }
}
