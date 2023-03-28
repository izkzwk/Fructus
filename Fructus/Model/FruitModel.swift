//
//  FruitModel.swift
//  Fructus
//
//  Created by Dzmitry Bladyka on 28.03.23.
//

import SwiftUI

struct Fruit: Identifiable {
    
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var gradientColors: [Color]
    var description: String
    var nutrition: [String]
    
}
