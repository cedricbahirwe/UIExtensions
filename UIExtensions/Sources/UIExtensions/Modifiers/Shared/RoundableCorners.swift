//
//  RoundableCorners.swift
//  
//
//  Created by Cédric Bahirwe on 11/11/2022.
//

import SwiftUI

public struct RoundableCorners: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    public func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(
                width: radius,
                height: radius
            )
        )
        return Path(path.cgPath)
    }
}
