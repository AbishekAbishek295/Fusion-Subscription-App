//
//  AlwaysIncludedSection.swift
//  SubscriptionApp
//
//  Created by Abishek on 26/04/26.
//

import SwiftUI


struct AlwaysIncludedSection: View {
    var onSellEverywhereTap: (() -> Void)? = nil

    struct Feature: Identifiable {
        let id = UUID()
        let icon: String
        let title: String
        let description: String
        var tappable: Bool = false
    }

    let features: [Feature] = [
        Feature(icon: "paintbrush",
                title: "No-code design",
                description: "Use one of our professional themes to set up quickly"),
        Feature(icon: "cart",
                title: "Best -converting checkout",
                description: "Use one of our professional themes to set up quickly"),
        Feature(icon: "square.grid.2x2",
                title: "Sell everywhere",
                description: "In- person and on social channels ...\nTiktok , Instagram , Google and more",
                tappable: true),
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Always included. Every plan")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.black)
                .padding(.horizontal, 16)
                .padding(.top, 14)
                .padding(.bottom, 4)

            ForEach(Array(features.enumerated()), id: \.element.id) { index, feature in
                VStack(spacing: 0) {
                    HStack(alignment: .top, spacing: 12) {
                        Image(systemName: feature.icon)
                            .font(.system(size: 18))
                            .foregroundColor(.black)
                            .frame(width: 26, height: 26)

                        VStack(alignment: .leading, spacing: 3) {
                            Text(feature.title)
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.black)
                            Text(feature.description)
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 13)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        if feature.tappable { onSellEverywhereTap?() }
                    }

                    if index < features.count - 1 {
                        Divider().padding(.horizontal, 16)
                    }
                }
            }
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}
