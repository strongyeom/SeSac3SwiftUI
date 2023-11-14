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
struct TamagochiView: View {
    
   @State private var nickname: String = "고래고래" // View에 대한 상태를 관리하기 위해 존재
    
    // body 연산 프로퍼티 안에 get {} 이 있지만 생략해서 사용하는 것이고, nickname을 바꿀려면 get 앞에 mutating을 작성해야한디.
    // ⭐️ SwiftUI에서는 body에 get만 사용할 수 있고 mutating을 사용할 수 없음 -> 변수를 수정 할 수 없음 -> @State 사용
    var body: some View {
        VStack {
            Text("Hello, World! \(nickname)") // 데이터가 달라질때 View를 다시 Reendering 함
                .background(.black)
                .foregroundColor(.white)
                .font(.title)
            
            Button("버튼 확인") {
                nickname = "새싹이"
            }
        }
      
    }
}

struct TamagochiView_Previews: PreviewProvider {
    static var previews: some View {
        TamagochiView()
    }
}
