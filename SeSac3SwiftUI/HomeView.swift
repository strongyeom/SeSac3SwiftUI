//
//  HomeView.swift
//  SeSac3SwiftUI
//
//  Created by 염성필 on 2023/11/15.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 50) {
                ImageData()
                ImageData()
                ImageData()
                ImageData()
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
        }
        
    }
}

struct ImageData: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                AsyncImageView()
                AsyncImageView()
                AsyncImageView()
                AsyncImageView()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
