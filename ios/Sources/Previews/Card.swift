import DivKit
import SwiftUI

public struct Card: View {
    @State private var source: DivViewSource?
    
    public init() {}
    
    public var body: some View {
        DivKitView(source: $source)
            .task {
                await loadCard()
            }
    }
    
    public func loadCard() async {
        let url = URL(string: "http://localhost:8080/card")!

        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            DispatchQueue.main.async {
                self.source = .init(kind: .data(data), cardId: "someCardId")
            }
        } catch {}
    }
}

#Preview {
    Card()
}
