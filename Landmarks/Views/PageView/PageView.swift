//
//  PageView.swift
//  Landmarks
//
//  Created by Yuki Suzuki on 5/8/21.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 0
    
    var body: some View {
        VStack{
            PageViewController(pages: pages, currentPage: $currentPage)
            
            Button(action: {
                if (ModelData().features.endIndex-1 == self.currentPage)
                { self.currentPage = 0; do{ sleep( 1 / 10 ) } }
                else{ self.currentPage += 1 }

            }) {
                Text("Current Page: \(currentPage)")
                HStack {
                    Text("Jump to next page")
                }.padding(10.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 10.0)
                        .stroke(lineWidth: 1.0)
                )
            }

            
        }
        
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
