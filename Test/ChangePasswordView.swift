//
//  ContentView.swift
//  Test
//
//  Created by Marek on 01/07/2024.
//

import SwiftUI

struct ChangePasswordView: View {
    @State private var currentPassword = ""
    @State private var newPassword = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("Change password")
                    .font(.title)
                    .bold()
                Spacer()
                Button("Log out") {
                    // Add logout action
                }
            }
            .padding()
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text("Your password has expired. Set new password below:")
                    .padding(.bottom, 20)
                
                SecureField("Current password", text: $currentPassword)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                
                SecureField("New password", text: $newPassword)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                
                SecureField("Confirm password", text: $confirmPassword)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                
                PasswordRequirementsView(newPassword: newPassword, confirmPassword: confirmPassword)
                
                Button(action: {
                    // Add password change action
                }) {
                    Text("Set new password")
                        .bold()
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.top, 20)
                .disabled(!isPasswordValid)
                
            }
            .padding()
            
            Spacer()
        }
        .background(Color(.systemBackground))
        .navigationBarHidden(true)
    }
    
    var isPasswordValid: Bool {
        // Add validation logic based on requirements
        return newPassword.count >= 8 &&
            newPassword != currentPassword &&
            newPassword.rangeOfCharacter(from: .lowercaseLetters) != nil &&
            newPassword.rangeOfCharacter(from: .uppercaseLetters) != nil &&
            newPassword.rangeOfCharacter(from: .decimalDigits) != nil &&
            newPassword.rangeOfCharacter(from: CharacterSet(charactersIn: "!@#$%^&*()-_")) != nil &&
            newPassword == confirmPassword
    }
}

struct PasswordRequirementsView: View {
    var newPassword: String
    var confirmPassword: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Requirements")
                .font(.headline)
                .padding(.vertical)
            
            RequirementView(requirement: "At least 8 characters long", isValid: newPassword.count >= 8)
            RequirementView(requirement: "Cannot match your login username", isValid: true) // Placeholder, replace with actual validation
            RequirementView(requirement: "At least one lower case letter", isValid: newPassword.rangeOfCharacter(from: .lowercaseLetters) != nil)
            RequirementView(requirement: "At least one upper case letter", isValid: newPassword.rangeOfCharacter(from: .uppercaseLetters) != nil)
            RequirementView(requirement: "At least one number", isValid: newPassword.rangeOfCharacter(from: .decimalDigits) != nil)
            RequirementView(requirement: "At least one special character !@#$%^&*()-_", isValid: newPassword.rangeOfCharacter(from: CharacterSet(charactersIn: "!@#$%^&*()-_")) != nil)
            RequirementView(requirement: "New and confirm password entries match", isValid: newPassword == confirmPassword)
        }
        .padding(.top, 10)
    }
}

struct RequirementView: View {
    var requirement: String
    var isValid: Bool
    
    var body: some View {
        HStack {
            Image(systemName: isValid ? "checkmark.circle" : "circle")
                .foregroundColor(isValid ? .green : .red)
            Text(requirement)
                .foregroundColor(isValid ? .primary : .red)
        }
    }
}

//struct ChangePasswordView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChangePasswordView()
//    }
//}

#Preview {
    ChangePasswordView()
}
