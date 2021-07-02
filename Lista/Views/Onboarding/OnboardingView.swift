//
//  OnboardingView.swift
//  Lista
//
//  Created by Jaime Jazareno III on 6/29/21.
//

import SwiftUI

struct OnboardingView: View {
    var data: OnboardingData
    @State private var isAnimating: Bool = false

    var body: some View {
        VStack {
            Spacer()
            Image(data.backgroundImage)
                .resizable()
                .scaledToFit()
                .scaleEffect(isAnimating ? 1 : 0.9)
            Spacer()

            VStack(spacing: 20) {
                Text(data.primaryText)
                    .font(.title2)
                    .bold()
                    .multilineTextAlignment(.center)

                Text(data.secondaryText)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 250)
            }

            Spacer()
            if data.id == 2 {
                HStack {
                    Spacer()
                    Spacer()
                    Button(action: {
                        UserDefaults.standard.set(false, forKey: "isFirstRun")
                    }, label: {
                        Image(symbol: .arrowRight)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                            .padding(20)
                            .background(
                                Circle()
                                    .foregroundColor(
                                        Color.accentColor
                                    )
                            )
                            .shadow(color: Color.black, radius: 10)
                            .scaleEffect(isAnimating ? 1 : 0.9)
                    })
                }
                .padding()
            }

            Spacer()
        }

        .onAppear(
            perform: {
                isAnimating = false
                withAnimation(.easeOut(duration: 0.5)) {
                    isAnimating = true
                }
            }
        )
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(data: OnboardingData.list.first!)
    }
}
