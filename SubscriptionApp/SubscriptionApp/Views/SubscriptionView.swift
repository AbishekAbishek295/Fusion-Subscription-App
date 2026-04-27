//
//  SubscriptionView.swift
//  SubscriptionApp
//
//  Created by Abishek on 26/04/26.
//

import SwiftUI

struct SubscriptionView: View {
    
    @StateObject private var vm = SubscriptionViewModel()
    @Environment(\.dismiss) private var dismiss
    @State private var showBasicPopup = false
 
    var body: some View {
        ZStack(alignment: .bottom) {
            Color(UIColor.systemGray6).ignoresSafeArea()
 
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 0) {
 
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Pick your plan")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(.black)
                        Text("Get started for £1/ Week for 1 month")
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 20) 
                    .padding(.bottom, 16)
 
                    if vm.isLoading {
                        HStack { Spacer(); ProgressView(); Spacer() }
                            .padding(.top, 60)
 
                    } else if let err = vm.errorMessage {
                        Text(err)
                            .font(.system(size: 14))
                            .foregroundColor(.red)
                            .padding(16)
 
                    } else {
                        
                        if !vm.featuredPlans.isEmpty {
                            PlansCard(plans: vm.featuredPlans, selectedPlan: $vm.selectedPlan)
                                .padding(.horizontal, 16)
                        }
 
                        if !vm.morePlans.isEmpty {
                            HStack(spacing: 10) {
                                Rectangle()
                                    .fill(Color(UIColor.systemGray4))
                                    .frame(height: 1)

                                Button {
                                    vm.isMoreBtn.toggle()
                                }label: {
                                    if vm.isMoreBtn{
                                        Text("More plans")
                                            .font(.system(size: 13))
                                            .foregroundColor(.gray)
                                            .fixedSize()
                                    }else{
                                        Text("Less Plans")
                                            .font(.system(size: 13))
                                            .foregroundColor(.gray)
                                            .fixedSize()
                                    }
                                }
                                Rectangle()
                                    .fill(Color(UIColor.systemGray4))
                                    .frame(height: 1)
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 12)
 
                            PlansCard(plans: vm.morePlans, selectedPlan: $vm.selectedPlan)
                                .padding(.horizontal, 16)
                        }
 
                        AlwaysIncludedSection(onSellEverywhereTap: {
                            showBasicPopup = true
                        })
                        .padding(.horizontal, 16)
                        .padding(.top, 16)
                    }
 
                    Spacer().frame(height: 110)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.white, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button { dismiss() } label: {
                    HStack(spacing: 8) {
                        Image("previous")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                        Text("Pick your plan")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.black)
                    }
                }
                .tint(.black)
            }
            ToolbarItem(placement: .principal) {
                Color.clear
            }
        }
        .task { await vm.fetchPlans() }
        .overlay {
            if showBasicPopup {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture { showBasicPopup = false }
                    .overlay {
                        VStack(spacing: 6) {
                            Button {
                                showBasicPopup = false
                            } label: {
                                Text("Select Basic")
                                    .font(.system(size: 17, weight: .semibold))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 56)
                                    .background(Color.black)
                                    .clipShape(RoundedRectangle(cornerRadius: 14))
                            }

                            Button {
                                showBasicPopup = false
                            } label: {
                                Text("Change plan anytime")
                                    .font(.system(size: 13))
                                    .foregroundColor(.gray)
                                    .frame(height: 36)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 16)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(.horizontal, 24)
                    }
                    .transition(.opacity)
                    .animation(.easeInOut(duration: 0.2), value: showBasicPopup)
            }
        }
    }
}
