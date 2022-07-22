import SwiftUI

public struct CloseKeyboard: ViewModifier {
    public enum Gestures {
        case Tap,
             Swipe,
             All
    }
    
    var on: Gestures = .All
    
    public func body(content: Content) -> some View {
        switch on {
        case .Tap:
            content.onTapGesture {
                closeKeyboard()
            }
        case .Swipe:
            content.gesture(
                DragGesture(minimumDistance: 0, coordinateSpace: .local).onEnded({ gesture in
                    // Hide keyboard on swipe down
                    if gesture.translation.height > 0 {
                        closeKeyboard()
                    }
                })
            )
        case .All:
            content.onTapGesture {
                closeKeyboard()
            }
            .gesture(
                DragGesture(minimumDistance: 0, coordinateSpace: .local).onEnded({ gesture in
                    // Hide keyboard on swipe down
                    if gesture.translation.height > 0 {
                        closeKeyboard()
                    }
                })
            )
        }
    }
    
    func closeKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension View {
    public func closeKeyboard(on: CloseKeyboard.Gestures = .All) -> some View {
        modifier(CloseKeyboard(on: on))
    }
}
