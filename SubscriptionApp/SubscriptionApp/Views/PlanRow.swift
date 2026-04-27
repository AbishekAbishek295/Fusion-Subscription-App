//
//  PlanRow.swift
//  SubscriptionApp
//
//  Created by Abishek on 26/04/26.
//

import SwiftUI

struct PlanRow: View {
    let plan: SubscriptionPlan
    let isSelected: Bool
    let showDivider: Bool

    var subtitle: String {
        switch plan.plan {
        case "Starter":
            return "For selling on social"
        case "Plus", "Pro":
            return "For more complex businesses"
        default:
            return "Complete software solution"
        }
    }

    var priceOnRight: Bool {
        ["Restaurant Pro", "Takeaway Pro", "Starter"].contains(plan.plan)
    }

    var isPopular: Bool {
        plan.plan == "Plus"
    }

    var priceBelow: Bool {
        !priceOnRight
    }

    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 4) {

                    HStack(spacing: 8) {
                        Text(plan.plan)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.black)

                        if isPopular {
                            Text("Most popular")
                                .font(.system(size: 10, weight: .medium))
                                .foregroundColor(.green)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 3)
                                .background(Color.green.opacity(0.13))
                                .clipShape(Capsule())
                        }

                        Spacer()

                        if priceOnRight {
                            PriceView(amount: plan.amount)
                        }
                    }

                    Text(subtitle)
                        .font(.system(size: 13))
                        .foregroundColor(.gray)

                    if priceBelow {
                        PriceView(amount: plan.amount)
                            .padding(.top, 1)
                    }
                }

                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .padding(.leading, 8)
                        .padding(.top, 2)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 14)
            .background(isSelected ? Color(UIColor.systemGray6) : Color.white)

            if showDivider {
                Divider().padding(.horizontal, 16)
            }
        }
    }
}
