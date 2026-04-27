//
//  PlansCard.swift
//  SubscriptionApp
//
//  Created by Abishek on 26/04/26.
//

import SwiftUI


struct PlansCard: View {
    let plans: [SubscriptionPlan]
    @Binding var selectedPlan: SubscriptionPlan?

    var body: some View {
        VStack(spacing: 8) {
            ForEach(plans) { plan in
                PlanRow(
                    plan: plan,
                    isSelected: selectedPlan?.id == plan.id,
                    showDivider: false
                )
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.15)) {
                        selectedPlan = (selectedPlan?.id == plan.id) ? nil : plan
                    }
                }
            }
        }
    }
}


