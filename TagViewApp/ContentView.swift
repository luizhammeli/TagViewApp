//
//  ContentView.swift
//  TagViewApp
//
//  Created by Luiz Diniz Hammerli on 19/09/23.
//

import SwiftUI
import LHHelpers

struct ContentView: View {
    @State var selectedTag: String = ""
    
    let tags = ["hardcore",
                "music",
                "live",
                "metal",
                "metalcore",
                "show",
                "gig",
                "concert",
                "australia",
                "brazil",
                "rock",
                "band",
                "storyoftheyear",
                "or",
                "screamo"]
    
    var body: some View {
        GeometryReader(content: { proxy in
            VStack(alignment: .leading, spacing: 24) {
                TagView(tags: tags, width: proxy.size.width - 32)
                Spacer()
            }.padding(.all, 16)
        })
        .navigationTitle("TagsView")
    }
}

#Preview {
    ContentView()
}
