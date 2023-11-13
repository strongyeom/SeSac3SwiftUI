//
//  MenuView.swift
//  SeSac3SwiftUI
//
//  Created by 염성필 on 2023/11/13.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        HStack(spacing: 15) {
            CardView()
            CardView()
            CardView()
            
        }
       
            
    }
}



struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct CardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(systemName: "star")
                .background(.red)
            Text("토스 월드")
                .foregroundColor(.white)
        }
        .padding()
        .background(.blue)
    }
}
