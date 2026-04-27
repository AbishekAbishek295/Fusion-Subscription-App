# Fusion-Subscription-App

## 📌 Overview

This application is built using **Swift**, **SwiftUI**, and **MVVM architecture**.
It provides a simple flow where the user enters a mobile number and is redirected to a plan selection screen.

There is **no OTP verification** in this application.

All data (plans and features) are **loaded from API**.

---

## 🚀 App Flow

### 1. Login Screen

* User enters a **10-digit mobile number**
* User taps on **"Get OTP"** button

> Note:
> "Get OTP" button is used only for navigation.
> There is **no OTP process**.

👉 User is redirected to the **Pick Your Plan** screen.

---

### 2. Pick Your Plan Screen

* Displays a list of plans
* All plans are **fetched from API**
* No hardcoded data

Each plan includes:

* Plan name
* Description
* Price

---

### 3. More Plans

* User taps on **"More Plans"**
* Additional plans are displayed

✔ These plans:

* Come from API
* Are dynamic (can change anytime)

---

### 4. Features Section

Section title: **"Always included. Every plan"**

Common features displayed:

* No-code design
* Best-converting checkout
* Sell everywhere

---

### 5. Feature Interaction

* When user taps on **"Sell everywhere"**

👉 An alert popup is shown

#### Alert Details:

* Title: **Basic Plan**
* Message: Feature not available in current plan
* Action: **Change Plan Anytime**

---

## 🔄 Navigation Flow

Login Screen
↓
Enter Mobile Number
↓
Tap "Get OTP"
↓
Pick Your Plan Screen
↓
Tap "More Plans"
↓
View Additional Plans
↓
Scroll to Features
↓
Tap "Sell everywhere"
↓
Show Alert Popup

---

## 🧱 Architecture

* MVVM (Model-View-ViewModel)

---

## 🛠️ Tech Stack

* Swift
* SwiftUI
* MVVM

---

## 📱 Screens

1. Login Screen
2. Plan Selection Screen
3. More Plans Section
4. Features Section
5. Alert Popup

---

## 💡 Notes

* All data is loaded from API
* No hardcoded plans
* Simple navigation flow
* "Get OTP" acts as a continue button

---

## 👨‍💻 Author

Abishek M
iOS Developer
