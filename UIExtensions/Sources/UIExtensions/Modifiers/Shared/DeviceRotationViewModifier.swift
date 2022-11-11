//
//  DeviceRotationViewModifier.swift
//  
//
//  Created by Cédric Bahirwe on 31/10/2022.
//

import SwiftUI

/// A view modifier that detects device's rotation.
public struct DeviceRotationViewModifier: ViewModifier {
    public let action: (UIDeviceOrientation) -> Void

    public func body(content: Content) -> some View {
        content
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}
