import DivKit
import SwiftUI

public struct DivKitView: UIViewRepresentable {
    @Binding public var source: DivViewSource?
    
    public func makeUIView(context: Context) -> DivView {
        .init(divKitComponents: .init())
    }
        
    public func updateUIView(_ uiView: DivView, context: Context) {
        if let source {
            Task {
                await uiView.setSource(source)
            }
        }
    }
}
