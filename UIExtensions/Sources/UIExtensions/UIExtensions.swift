import SwiftUI

public extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}

public struct UIExtensions {
    public private(set) var text = "Hello, World!"

    public init() {
    }
}

