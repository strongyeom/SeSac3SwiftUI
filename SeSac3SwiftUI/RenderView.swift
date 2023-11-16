//
//  RenderView.swift
//  SeSac3SwiftUI
//
//  Created by 염성필 on 2023/11/13.
//

import SwiftUI

// View가 어떻게 그려지고 생성이 되는지
struct RenderView: View {
    
    
    
    // @State : 값이 변경될때마다 RenderView안에 있는 View를 다시 그림
    @State var age = 10
    @State var text: String = ""
    @State var isEnabled: Bool = false
    
    init() {
        self.age = age
        self.text = text
        self.isEnabled = isEnabled
        print("RenderView - init")
    }
    
    var body: some View {
        //  NavigationView : UIKit NavigationController 느낌
        NavigationView  {
            VStack {
                
                HStack {
                    RoundedRectangle(cornerRadius: 30)
                        // fill 안에는 Color 뿐만 아니라 Gradient를 넣을 수 있음
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [.black, .red, .blue]), startPoint: .bottomLeading, endPoint: .trailing)
                        
                        )
                    RoundedRectangle(cornerRadius: 30)
                        .fill(
                            RadialGradient(colors: [.orange, .blue, .green], center: .center, startRadius: 5, endRadius: 60)
                            
                        )
                    RoundedRectangle(cornerRadius: 30)
                        .fill(
                            AngularGradient(colors: [.yellow, .brown, .red], center: .center, angle: .degrees(123))
                        
                        )
                }
                .frame(height: 100)
                
                // 다른 화면으로 Push 하고 할때는 NavigationLink 사용
                NavigationLink() {
                        MenuView()
                    } label: {
                        Text("Push")
                    }
                
                
                Toggle("토글입니다", isOn: $isEnabled)
                
                TextField("플레이스 홀더입니다.", text: $text)
                
                Text("Jack: \(Int.random(in: 1...100))")
                bran
                // KokoView는 다른 구조체로 이뤄져 있기 때문에 reload가 적용되지 않음
                KokoView()
                ResultTextField(text: $text)
                
                if isEnabled {
                    Text("Hue: \(age) \(Int.random(in: 1...100))")
                        .foregroundColor(.red)
                } else {
                    Text("Hue: \(age) \(Int.random(in: 1...100))")
                        .foregroundColor(.blue)
                }
                Button("클릭") {
                    age = Int.random(in: 1...100)
                }
            }
            .padding()
            // ⭐️ NavigationView 안쪽에 title을 작성
            .navigationTitle("네비게이션 타이틀")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Text("클릭"))
        } // <- UIKit NavigationControlle에 직접 타이틀 및 속성을 적용하는게 아니라 RoorVC에서 적용되는 것과 똑같음
    }
    
    var bran: some View {
        Text("Bran: \(Int.random(in: 1...100))")
    }
}

struct ResultTextField: View {
    @Binding var text: String
    var body: some View {
        Text(text)
    }
}

struct KokoView: View {
    var body: some View {
        Text("Koko: \(Int.random(in: 1...100))")
    }
}



struct RenderView_Previews: PreviewProvider {
    static var previews: some View {
        RenderView()
    }
}
