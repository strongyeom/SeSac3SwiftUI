//
//  ChartView.swift
//  SeSac3SwiftUI
//
//  Created by 염성필 on 2023/11/17.
//

import SwiftUI
import Charts

struct ChartView: View {
    let movie : [Movie]
    
    
    @Environment(\.colorScheme) var color
    
    //  @ViewBuilder : 구조체로 따로 빼지 않고 한개의 구조체에서 프로퍼티를 만들어 UI에 표현할까 사용
    // 즉, body를 제외한 모든 프로퍼티가 UI에 적용되려면 사용해야함 => 어느정도 생략해도 괜찮지만 if 문으로 분기처리 되었을때는 사용해야한다.
    @ViewBuilder
    var chartTitle: some View {
        if color == .dark {
            Text("다크 차트")
        } else {
            Text("라이트 차트")
        }
    }
    
    // body : 내부에 @ViewBuilder 내장되어 있음
    var body: some View {
        
        VStack {
           chartTitle
            // data: 보여주고 싶은 모델
            // id : UUID 값 or 구조체 자체가 Hashable하다면 \.self 사용 가능
            Chart(movie, id: \.self) { item in
                
//                BarMark(
//                RectangleMark(
//                LineMark(
                AreaMark(
                    // x: x축에 보여줄 요소들
                    x: .value("장르", item.name),
                    // x: y축에 보여줄 요소들
                    y: .value("관람횟수", item.count))
                .foregroundStyle(Color.random())
            }
        }
        .frame(height: 200)
        .padding()
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(movie: [
        Movie(name: "영화"),
        Movie(name: "드라마"),
        Movie(name: "장르"),
        
        ])
    }
}
