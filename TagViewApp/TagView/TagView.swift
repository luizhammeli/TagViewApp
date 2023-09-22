//
//  TagView.swift
//  TagViewApp
//
//  Created by Luiz Diniz Hammerli on 19/09/23.
//

import SwiftUI

struct TagView: View {
    private let width: CGFloat
    private let tags: [String]
    private let action: ((String) -> Void)?
    @StateObject var viewModel = TagViewModel()
    
    init(tags: [String], width: CGFloat, action: ((String) -> Void)? = nil) {
        self.width = width
        self.tags = tags
        self.action = action
    }

    var body: some View {
        VStack(alignment: .leading, spacing: viewModel.vSpacing) {
            ForEach(viewModel.tags, id: \.self) { row in
                HStack(spacing: viewModel.hSpacing) {
                    ForEach(row) { item in
                        if action == nil {
                            TagText(text: item.value)
                        } else {
                            Button {
                                action?(item.value)
                            } label: {
                                TagText(text: item.value)
                            }
                        }
                    }
                }
            }
        }.onAppear(perform: {
            viewModel.setupTags(tags, width: width)
        })
    }
}

struct TagText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .padding(.horizontal, 14)
            .frame(height: 30)
            .background(Color.black)
            .cornerRadius(.infinity)
            .foregroundColor(.white)
            .font(.system(size: 13, weight: .bold))
    }
}

#Preview {
    TagView(tags: ["music", "live", "song"], width: UIScreen.main.bounds.width - 48) { value in
        print(value)
    }
}


