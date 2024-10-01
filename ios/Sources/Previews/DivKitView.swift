import DivKit
import DivKitExtensions
import SwiftUI

public struct DivKitView: UIViewRepresentable {
    public let divKitComponents: DivKitComponents
    @Binding public var source: DivViewSource?
    
    init(divKitComponents: DivKitComponents, source: Binding<DivViewSource?>) {
        self.divKitComponents = divKitComponents
        _source = source
    }
    
    public func makeUIView(context: Context) -> DivView {
        .init(divKitComponents: divKitComponents)
    }
        
    public func updateUIView(_ uiView: DivView, context: Context) {
        if let source {
            Task {
                await uiView.setSource(source)
            }
        }
    }
}
