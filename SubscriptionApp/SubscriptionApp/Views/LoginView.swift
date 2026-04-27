//
//  ContentView.swift
//  SubscriptionApp
//
//  Created by Abishek on 26/04/26.
//

import SwiftUI

struct LoginView: View {
   @StateObject private var vm = LoginViewModel()

   var body: some View {
       ZStack {
           VStack(spacing: 0) {
               Color(UIColor.systemGray6)
               Color.white
           }
           .ignoresSafeArea()

           VStack(spacing: 0) {
               ZStack {
                   Circle()
                       .fill(Color.white)
                       .frame(width: 130, height: 130)
                       .shadow(color: .black.opacity(0.08), radius: 16, x: 0, y: 4)

                   Image("fusion")
                       .resizable()
                       .scaledToFit()
                       .frame(width: 76, height: 76)
               }
               .padding(.top, 120)
               .padding(.bottom, 120)
               .frame(maxWidth: .infinity)

               VStack(spacing: 20) {

                   Text("Enter Mobile Number")
                       .font(.system(size: 20, weight: .bold))
                       .foregroundColor(.black)
                       .padding(.top, 6)

                   HStack(spacing: 0) {
                       Button { vm.showCountryPicker = true } label: {
                           HStack(spacing: 6) {
                               Image(vm.selectedCountry.flagAsset)
                                   .resizable()
                                   .scaledToFill()
                                   .frame(width: 26, height: 18)
                                   .clipShape(RoundedRectangle(cornerRadius: 3))

                               Text(vm.selectedCountry.dialCode)
                                   .font(.system(size: 15, weight: .medium))
                                   .foregroundColor(.black)

                               Image(systemName: "chevron.down")
                                   .font(.system(size: 10, weight: .semibold))
                                   .foregroundColor(.gray)
                           }
                           .padding(.leading, 12)
                           .padding(.trailing, 10)
                       }

                       Rectangle()
                           .fill(Color(UIColor.systemGray4))
                           .frame(width: 1, height: 28)

                       TextField("Your 10 digit number", text: $vm.phoneNumber)
                           .keyboardType(.numberPad)
                           .font(.system(size: 15))
                           .foregroundColor(.black)
                           .padding(.horizontal, 12)
                           .onChange(of: vm.phoneNumber) { _, new in
                               vm.phoneNumber = String(new.filter(\.isNumber).prefix(10))
                           }
                   }
                   .frame(height: 52)
                   .background(Color.white)
                   .clipShape(RoundedRectangle(cornerRadius: 10))
                   .overlay(
                       RoundedRectangle(cornerRadius: 10)
                           .stroke(Color(UIColor.systemGray4), lineWidth: 1)
                   )

                   if let err = vm.errorMessage {
                       Text(err)
                           .font(.system(size: 13))
                           .foregroundColor(.red)
                           .frame(maxWidth: .infinity, alignment: .leading)
                   }

                   NavigationLink(destination: SubscriptionView(), isActive: $vm.navigateToPlans) {
                       EmptyView()
                   }

                   Button {
                       Task { await vm.getOTP() }
                   } label: {
                       ZStack {
                           RoundedRectangle(cornerRadius: 12)
                               .fill(Color.black)
                               .frame(height: 52)

                           if vm.isLoading {
                               ProgressView().tint(.white)
                           } else {
                               Text("GET OTP")
                                   .font(.system(size: 16, weight: .bold))
                                   .foregroundColor(.white)
                           }
                       }
                   }
                   .disabled(vm.isLoading)

                   HStack(spacing: 12) {
                       Rectangle().fill(Color(UIColor.systemGray5)).frame(height: 1)
                       Text("or sign-in-with")
                           .font(.system(size: 13))
                           .foregroundColor(.gray)
                           .fixedSize()
                       Rectangle().fill(Color(UIColor.systemGray5)).frame(height: 1)
                   }

                   HStack(spacing: 20) {
                       SocialButton(assetName: "apple")
                       SocialButton(assetName: "google")
                       SocialButton(assetName: "microsoft")
                   }

                   HStack(spacing: 4) {
                       Text("Don't have a account")
                           .font(.system(size: 13))
                           .foregroundColor(.gray)
                       Button {
                           
                       } label: {
                           Text("sign up")
                               .font(.system(size: 13, weight: .medium))
                               .foregroundColor(.black)
                               .underline()
                       }
                   }
                   .padding(.bottom, 10)
               }
               .padding(.horizontal, 24)
               .padding(.vertical, 24)
               .background(Color.white)
               .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
               .shadow(color: .black.opacity(0.06), radius: 16, x: 0, y: -6)

               Spacer()
           }
       }
       .confirmationDialog("Select Country", isPresented: $vm.showCountryPicker, titleVisibility: .visible) {
           ForEach(Country.allCases) { country in
               Button(country.rawValue) {
                   vm.selectedCountry = country
               }
           }
       }
       .navigationBarHidden(true)
   }
}

struct SocialButton: View {
   let assetName: String

   var body: some View {
       Button { } label: {
           Image(assetName)
               .resizable()
               .scaledToFit()
               .frame(width: 28, height: 28)
               .padding(14)
               .background(Color.white)
               .clipShape(RoundedRectangle(cornerRadius: 12))
               .shadow(color: .black.opacity(0.10), radius: 8, x: 0, y: 2)
       }
   }
}

#Preview {
    LoginView()
}
