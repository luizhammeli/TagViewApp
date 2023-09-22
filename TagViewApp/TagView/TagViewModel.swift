//
//  TagViewModel.swift
//  TagViewApp
//
//  Created by Luiz Diniz Hammerli on 19/09/23.
//

import LHHelpers
import SwiftUI

final class TagViewModel: ObservableObject {
    @Published var tags: [[Tag]] = []
    
    let hSpacing: CGFloat = 6
    let vSpacing: CGFloat = 8
    
    func setupTags(_ tags: [String], width: CGFloat) {
        var totalSize: CGFloat = .zero
        var lineLabels = [Tag]()
        var elements: [[Tag]] = []
        
        tags.forEach { tag in
            let font = UIFont.systemFont(ofSize: 13, weight: .bold)
            let labelSize = (tag.width(withConstrainedHeight: 30, font: font) ) + 28 + hSpacing
            totalSize += labelSize
            
            if (totalSize - hSpacing) < width {
                lineLabels.append(.init(value: tag))
            } else {
                elements.append(lineLabels)
                lineLabels = [.init(value: tag)]
                totalSize = labelSize
            }
        }
        
        if !lineLabels.isEmpty {
            elements.append(lineLabels)
        }
        
        self.tags = elements
    }
}
