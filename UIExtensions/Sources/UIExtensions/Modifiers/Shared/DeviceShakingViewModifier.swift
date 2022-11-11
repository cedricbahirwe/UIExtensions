//
//  DeviceShakingViewModifier.swift
//  
//
//  Created by Cédric Bahirwe on 11/11/2022.
//

import SwiftUI

/// A view modifier that detects when a device is shaked
public struct DeviceShakeViewModifier: ViewModifier {
    private let action: () -> Void
    init(action: @escaping () -> Void) {
        self.action = action
    }
    public func body(content: Content) -> some View {
        content
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.deviceDidShakeNotification)) { _ in
                #if DEBUG
                action()
                #endif
            }
    }
}

// The notification we'll send when a shake gesture happens.
private extension UIDevice {
    static let deviceDidShakeNotification = Notification.Name(rawValue: "deviceDidShakeNotification")
}

//  Override the default behavior of shake gestures to send our notification instead.
extension UIWindow {
     open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            NotificationCenter.default.post(name: UIDevice.deviceDidShakeNotification, object: nil)
        }
     }
}
