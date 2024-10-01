import DivKit
import SwiftUI

public struct URLCardView: View {
    public let divKitComponents: DivKitComponents
    @State private var source: DivViewSource?
    private let url: URL
    
    public init(url: URL = .local) {
        divKitComponents = .init(urlHandler: DivKitActionHandler())
        self.url = url
    }
    
    public var body: some View {
        DivKitView(divKitComponents: divKitComponents, source: $source)
            .task {
                await loadFromURL()
            }
    }
    
    @MainActor
    public func loadFromURL() async {
        do {
            let url = url
            let (data, _) = try await URLSession.shared.data(from: url)
            let cardId = DivCardID(rawValue: url.relativePath)
            source = .init(kind: .data(data), cardId: cardId)
        } catch {}
    }
}

public extension URL {
    static var local: URL {
        Bundle.module.url(forResource: "card", withExtension: ".json")!
    }
    
    static var remote: URL {
        URL(string: "http://localhost:8080/card")!
    }
}

#Preview {
    URLCardView()
}
