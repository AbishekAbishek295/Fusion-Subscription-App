//
//  Untitled.swift
//  SubscriptionApp
//
//  Created by Abishek on 26/04/26.
//

import SwiftUI

struct PriceView: View {
    let amount: String
    var formattedAmount: String {
        let value = Double(amount) ?? 0
        return value.truncatingRemainder(dividingBy: 1) == 0
            ? String(Int(value))
            : amount
    }
    var body: some View {
        HStack(spacing: 5) {
            Text("£\(formattedAmount)")
                .font(.system(size: 13))
                .foregroundColor(.gray)
                .strikethrough(true, color: .gray)
            Text("£1")
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(.black)
            Text("GBP")
                .font(.system(size: 12, weight: .regular))
                .foregroundColor(.black)
        }
    }
}
