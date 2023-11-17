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
    var body: some View {
        VStack {
            Text("차트")
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
