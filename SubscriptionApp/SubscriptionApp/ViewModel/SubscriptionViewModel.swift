//
//  SubscriptionViewModel.swift
//  SubscriptionApp
//
//  Created by Abishek on 26/04/26.
//

import Foundation
import Combine

class SubscriptionViewModel: ObservableObject {
    @Published var allPlans: [SubscriptionPlan] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var selectedPlan: SubscriptionPlan? = nil
    @Published var isMoreBtn: Bool = true
    
    var featuredPlans: [SubscriptionPlan] {
        if isMoreBtn{
            allPlans
                .filter { $0.is_new == "1" && $0.type == "week" }
                .filter { ["Retail Pro", "Restaurant Pro", "Takeaway Pro"].contains($0.plan) }
                .sorted { $0.id < $1.id }
        }else{
            allPlans
                .filter { !["Starter", "Plus", "Pro"].contains($0.plan) }
                .sorted { $0.id < $1.id }
        }
        
    }
 
    var morePlans: [SubscriptionPlan] {
        allPlans
            .filter { $0.is_new == "1" && $0.type == "week" }
            .filter { !["Retail Pro", "Restaurant Pro", "Takeaway Pro"].contains($0.plan) }
            .sorted { $0.id < $1.id }
    }
 
    func fetchPlans() async {
        isLoading    = true
        errorMessage = nil
        defer {
            isLoading = false
        }
 
        guard let url = URL(string: "https://api-newdev.fmb.eposapi.co.uk/subscribeList") else {
            errorMessage = "Invalid URL"; return
        }
 
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
 
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoded = try JSONDecoder().decode(SubscriptionResponse.self, from: data)
            allPlans = Array(decoded.data.values)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
