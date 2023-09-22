//
//  Value.swift
//  TagViewApp
//
//  Created by Luiz Diniz Hammerli on 19/09/23.
//

import Foundation

struct Tag: Identifiable, Hashable {
    var id: UUID = UUID()
    var value: String
}
