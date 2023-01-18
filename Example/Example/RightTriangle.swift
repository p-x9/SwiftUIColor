//
//  RightTriangle.swift
//  Example
//
//  Created by p-x9 on 2023/01/19.
//  
//

import SwiftUI

struct RightTriangle: Shape {

    enum RightAngle: CaseIterable {
        case topLeft, topRight, bottomLeft, bottomRight

        var transform: CGAffineTransform {
            switch self {
            case .topLeft: return .identity
            case .topRight: return .init(scaleX: -1, y: 1)
            case .bottomLeft: return .init(scaleX: 1, y: -1)
            case .bottomRight: return .init(scaleX: -1, y: -1)
            }
        }

        func offset(from rect: CGRect) -> CGPoint {
            let size = rect.size
            switch self {
            case .topLeft: return .zero
            case .topRight: return .init(x: -size.width, y: 0)
            case .bottomLeft: return .init(x: 0, y: -size.height)
            case .bottomRight: return .init(x: -size.width, y: -size.height)
            }
        }
    }

    var rightAngle: RightAngle = .topLeft

    func path(in rect: CGRect) -> Path {
        var path = CGMutablePath()
        path.move(to: .zero)
        path.addLine(to: .init(x: rect.maxX, y: 0))
        path.addLine(to: .init(x: 0, y: rect.maxY))
        path.addLine(to: .zero)

        let offset = rightAngle.offset(from: rect)
        var transform = rightAngle.transform
            .translatedBy(x: offset.x, y: offset.y)

        if let flippedPath = path.mutableCopy(using: &transform) {
            path = flippedPath
        }

        return Path(path)
    }
}

