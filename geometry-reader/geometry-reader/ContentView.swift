import SwiftUI

struct AdaptiveCardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.teal)
                .aspectRatio(168 / 262, contentMode: .fit)
            
            VStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .overlay(
                        Text("Inner Text")
                            .font(.body)
                            .foregroundColor(.black)
                    )
                    .padding(.horizontal, 12)
                    .padding(.top, 120)
            }
            .padding(.top, 16)
        }
    }
}

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            let totalSpacing: CGFloat = 18 * 3
            let cardWidth = (geometry.size.width - totalSpacing) / 2
            
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(0..<3) { _ in
                        HStack(spacing: 16) {
                            AdaptiveCardView()
                                .frame(width: cardWidth)
                            AdaptiveCardView()
                                .frame(width: cardWidth)
                        }
                    }
                }
                .padding(.horizontal, 18)
                .padding(.top, 18)
            }
        }
    }
}

#Preview {
    ContentView()
}
