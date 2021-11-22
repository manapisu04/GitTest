//
//  CardView.swift
//  HighAndLowSample
//
//  Created by cmStudent on 2021/11/22.
//

import SwiftUI

// Viewの細分化
struct CardView: View {
    let imageName: String
    
    init(imageName: String) {
        self.imageName = imageName
    }
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height:90)
    }
}
