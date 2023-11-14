//
//  TamagochiView.swift
//  SeSac3SwiftUI
//
//  Created by 염성필 on 2023/11/14.
//

import SwiftUI

struct User {
    var nickname = "고래밥"
    
    var introduce: String {
        // 연산 프로퍼티에서 값을 변경하는 방법은 ?
        // get 앞에 mutating을 붙이면 됨
        mutating get {
            return "안녕하세여 \(nickname)입니다."
        }
       
    }
    
    // 구조체에서 변수를 변경할때는 mutating 사용해야함
    mutating func changeNickname() {
        nickname = "c칙칙촉촉"
    }
}

// ⭐️ UI는 데이터에 의존해서 자신의 상태를 결정하게 된다.
// @State == SOT (Source of Truth) , 상태 프로퍼티(State Property)
// @Binding : @State에서 파생된 데이터
struct TamagochiView: View {
    
    @State private var number: Int = 0 // View에 대한 상태를 관리하기 위해 존재
    @State private var riceNumber: Int = 0
    @State private var isOn = false
    @State private var text = ""
    // body 연산 프로퍼티 안에 get {} 이 있지만 생략해서 사용하는 것이고, nickname을 바꿀려면 get 앞에 mutating을 작성해야한디.
    // ⭐️ SwiftUI에서는 body에 get만 사용할 수 있고 mutating을 사용할 수 없음 -> 변수를 수정 할 수 없음 -> @State 사용
    var body: some View {
        VStack {
            
            TextField("물방울의 갯수 입력하기", text: $text)
               
            
            Toggle("스위치", isOn: $isOn)
                
            
            ExtractedView(title: "물방울 갯수", count: $number)
            
            Button("물방울 증가") {
                number += 1
                if let textNumber = Int(text) {
                    number += textNumber
                }
                isOn.toggle()
            }
            .font(.title)
            .padding(50)
            .background(.green)
            ExtractedView(title: "밥알 갯수", count: $riceNumber)
            
            // titleKey와의 차이점 : 1. Label에 다양한 modifier 설정이 가능함 / 2. 버튼의 padding이 적용되었을때 버튼 클릭 범위 다름
            Button {
                riceNumber += 1
            } label: {
                HStack {
                    Image(systemName: "flame")
                    Text("밥알 갯수")
                        .font(.title)
                        .padding(50)
                       
                }
                .background(.green)
                    
            }
        } // VStack
        .padding()
    }
}

struct TamagochiView_Previews: PreviewProvider {
    static var previews: some View {
        TamagochiView()
    }
}

struct ExtractedView: View {
    // 하위 뷰에서 변수가 바뀌는 경우에도 상위 뷰의 데이터에 영향을 주기 위해서 Binding 사용 즉, 하위뷰의 상태 변화 -> 상위 뷰 동기화
    
    let title: String
    @Binding var count: Int
    
    var body: some View {
        HStack {
            Text("\(title) \(count)") // 데이터가 달라질때 View를 다시 Reendering 함
                .background(.black)
                .foregroundColor(.white)
            .font(.title)
            
            Button {
                count += 1
            } label: {
                Text("하위 뷰 버튼")
            }

        }
    }
}
