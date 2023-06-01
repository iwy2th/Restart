

import SwiftUI

struct HomeView: View {
  // MARK: - PROPERTY
  @AppStorage("onboarding") var isOnBoardingViewActive: Bool = false
  @State private var isAnimating: Bool = false
  // MARK: - BODY
  var body: some View {
    VStack {
      // MARK: - HEADER
      Spacer()
      ZStack {
        CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
        Image("character-2")
          .resizable()
          .scaledToFit()
        .padding()
        .offset(y: isAnimating ? 35 : -35)
        .animation(Animation.easeInOut(duration: 4).repeatForever(), value: isAnimating)

      }
      // MARK: - CENTER
      Text("The time that leads to mastery is dependent on the intensity of our focus")
        .font(.title3)
        .fontWeight(.light)
        .foregroundColor(.secondary)
        .multilineTextAlignment(.center)
        .padding()
      // MARK: - FOOTER
      Spacer()

      Button {
        withAnimation {
          playSound(sound: "success", type: "m4a")
          isOnBoardingViewActive = true
        }
        // Some action
      } label: {
        Label("Restart", systemImage: "arrow.triangle.2.circlepath.circle.fill")
          .imageScale(.large)
          .font(.system(.title3, design: .rounded))
          .fontWeight(.bold)
      } //: BUTTON
      .buttonStyle(.borderedProminent)
      .buttonBorderShape(.capsule)
      .controlSize(.large)
    } //: VSTACK
    .onAppear {
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        isAnimating = true
        print(isAnimating)
      }
    }
  }
}
// MARK: - PREVIEW
struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
