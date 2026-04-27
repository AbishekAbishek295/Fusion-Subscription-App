//
//  Models.swift
//  SubscriptionApp
//
//  Created by Abishek on 26/04/26.
//

import SwiftUI

struct SubscriptionResponse: Codable {
    let status: Bool
    let message: String
    let data: [String: SubscriptionPlan]
    let response_code: Int
}
 
struct SubscriptionPlan: Codable, Identifiable, Hashable {
    let id: Int
    let plan: String
    let amount: String
    let duration: Int
    let type: String
    let is_new: String
    let vat_percentage: String
    let discount: Int
    let finalAmount: String
    let vat_amount: String
    let VatfinalAmount: String
}
 
enum Country: String, CaseIterable, Identifiable {
    case uk    = "UK"
    case india = "India"
 
    var id: String {
        rawValue
    }
 
    var dialCode: String {
        switch self {
        case .uk:
            return "+44"
        case .india:
            return "+91"
        }
    }
 
    var flagAsset: String {
        switch self {
        case .uk:
            return "uk"
        case .india:
            return "india"
        }
    }
}
