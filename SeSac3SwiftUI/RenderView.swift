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
   
    var body: some View {
        VStack {
            Text("Hue: \(age) \(Int.random(in: 1...100))")
            Text("Jack: \(Int.random(in: 1...100))")
            bran
            // KokoView는 다른 구조체로 이뤄져 있기 때문에 reload가 적용되지 않음
            KokoView()
            
            Button("클릭") {
                age = Int.random(in: 1...100)
            }
        }
    }
    
    var bran: some View {
        Text("Bran: \(Int.random(in: 1...100))")
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
