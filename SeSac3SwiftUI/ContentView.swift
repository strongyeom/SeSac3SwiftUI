//
//  ContentView.swift
//  SeSac3SwiftUI
//
//  Created by 염성필 on 2023/11/13.
//

/*
 SwiftUI : iOS 13 14 15 16 17
 
 WWDC19
 - UIKit > UILabel, UIButton
 - MapKt > MKMapView`
 
  구조체에서 상속하려면 Protocol 채택 해야함
 
 */

// Button<Text>  body의 타입 확인 : ModifiedContent<ModifiedContent<Button<Text>, _EnvironmentKeyWritingModifier<Optional<Color>>>, _BackgroundStyleModifier<Color>>

// Generic: 사용할 때 타입을 구체적으로 지정 즉, 컴파일 시점에서 타입이 지정됨
// some: 불투명 타입 ( Opaque type 5.1 ) , 역제네릭 타입 즉, 이미 알고 있는 타입을 거꾸로 숨김
// modifier => 뷰가 매번 반환된다.
import SwiftUI

struct ContentView: View { // View : 프로토콜로 되어 있음 / associatedType
    
    var body: some View { // ⭐️ some 빌드 시점 이후에 타입이 지정됨
        
//        Button("클릭하기") {
//            // body의 구체적인 타입 확인하기
//            let value = type(of: self.body)
//            print("body의 타입 확인 : \(value)") // body의 타입 확인 : Button<Text>
//        }
//        .foregroundColor(.red)
//        .background(.yellow)
        
        VStack {
            Text("안녕하세요")  // .으로 흘러가는 스트림을 View Modifier라고 함
                .foregroundColor(.green)
                .font(.largeTitle)
                .background(.gray)
                .padding()
                .background(.red)
                .border(.green, width: 10)
            
            Text("안녕하세요22")  // .으로 흘러가는 스트림을 View Modifier라고 함
                .foregroundColor(.green)
                .font(.largeTitle)
                .background(.gray)
                .padding()
                .background(.red)
                .border(.green, width: 10)
        }
            // .clipShape(Circle())
           
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
