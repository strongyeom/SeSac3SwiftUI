//
//  StartView.swift
//  SeSac3SwiftUI
//
//  Created by 염성필 on 2023/11/15.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        TabView {
           HomeView()
                .tabItem {
                    Label("홈화면", systemImage: "house")
                }
            
            CategoryView()
                .tabItem {
                    Label("리스트", systemImage: "doc.fill")
                }
            
            RenderView()
                .tabItem {
                    Label("설정 화면", systemImage: "gearshape")
                }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
