//
//  Card.swift
//  Sets
//
//  Created by Daniyaal Beg on 11/01/2018.
//  Copyright © 2018 dan. All rights reserved.
//

import Foundation

struct Card {

    let shape: Shape
    let color: Color
    let number: Number
    let shading: Shading
    
    init(shape: Shape, color: Color, number: Number, shading: Shading) {
        self.shape = shape
        self.color = color
        self.number = number
        self.shading = shading
    }
    
    enum Shape {
        case shape1, shape2, shape3
        static let all = [shape1, shape2, shape3]
    }
    
    enum Color {
        case color1, color2, color3
        static let all = [color1, color2, color3]
    }
    
    enum Number: Int {
        case number1 = 1, number2, number3
        static let all = [number1, number2, number3]
    }
    
    enum Shading {
        case shading1, shading2, shading3
        static let all = [shading1, shading2,shading3]
    }
}

extension Card: Equatable {
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.shape == rhs.shape && lhs.color == rhs.color && lhs.number == rhs.number && lhs.shading == rhs.shading
    }
}
