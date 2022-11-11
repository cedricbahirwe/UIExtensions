import SwiftUI

public extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }

    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundableCorners(radius: radius, corners: corners))
    }

    func hideKeyboard() {
        UIApplication.shared
            .sendAction(#selector(UIResponder.resignFirstResponder),
                        to: nil,
                        from: nil,
                        for: nil)
    }

    /// A View's extension for dismissing `keyboard` when the views is tapped
    /// - Returns: A View which when tapped dismisses the keyboard if it is shown
    func dissmissKeyBoardOnTap() -> some View {
        onTapGesture {
            withAnimation {
                hideKeyboard()
            }
        }
    }

    /// A view's extension for decteting the device's shaking gesture
    /// - Parameter action: the action to perform when the shaking gesture ends
    func onShake(perform action: @escaping () -> Void) -> some View {
        self.modifier(DeviceShakeViewModifier(action: action))
    }
}

public struct UIExtensions {
    public private(set) var text = "Hello, World!"

    public init() {
    }
}

