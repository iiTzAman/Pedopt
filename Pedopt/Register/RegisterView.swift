//
//  RegisterView.swift
//  Pedopt
//
//  Created by Aman Giri on 2024-05-12.
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var firstTextField = ""
    @State private var secondTextField = ""
    @State private var emailTextField = ""
    @State private var passwordTextField = ""
    @State private var confirmPasswordTextField = ""
    @State private var contactTextField = ""
    @State private var showLoginPage = false
    
    var body: some View {
        GeometryReader{ geo in
            VStack{
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .foregroundStyle(.white)
                            .font(.title)
                    }
                    .padding(.leading, 15)
                    Text("Create Account")
                        .font(.system(size: 25))
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .padding(.leading,-15)
                }
                .padding()
                .padding(.top,40)
                .frame(height: 130)
                .background(.accentPurple)
                HStack{
                    TextField("First Name", text: $firstTextField)
                        .multilineTextAlignment(.leading)
                        .minimumScaleFactor(0.5)
                        .textContentType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .padding()
                        .padding(.horizontal,10)
                        .foregroundStyle(.black)
                        .frame(width: geo.size.width/2.8, height: 60)
                        .overlay{
                            RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1)
                        }
                        .padding(.vertical,10)
                    Spacer()
                    TextField("Last Name", text: $secondTextField)
                        .multilineTextAlignment(.leading)
                        .minimumScaleFactor(0.5)
                        .textContentType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .padding()
                        .padding(.horizontal,10)
                        .foregroundStyle(.black)
                        .frame(width: geo.size.width/2.8, height: 60)
                        .overlay{
                            RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1)
                        }
                        .padding(.vertical,10)
                }
                .frame(width: geo.size.width/1.3)
                .padding(.top,30)
                
                TextField("Email", text: $emailTextField)
                    .multilineTextAlignment(.leading)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .padding()
                    .padding(.horizontal,10)
                    .foregroundStyle(.black)
                    .frame(width: geo.size.width/1.3, height: 60)
                    .overlay{
                        RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1)
                    }
                    .padding(.bottom,10)
                SecureField("Password", text: $passwordTextField)
                    .multilineTextAlignment(.leading)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .padding()
                    .padding(.horizontal,10)
                    .foregroundStyle(.black)
                    .frame(width: geo.size.width/1.3, height: 60)
                    .overlay{
                        RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1)
                    }
                    .padding(.bottom,10)
                
                SecureField("Confirm Password", text: $confirmPasswordTextField)
                    .multilineTextAlignment(.leading)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .padding()
                    .padding(.horizontal,10)
                    .foregroundStyle(.black)
                    .frame(width: geo.size.width/1.3, height: 60)
                    .overlay{
                        RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1)
                    }
                    .padding(.bottom,10)
                
                TextField("Contact", text: $contactTextField)
                    .multilineTextAlignment(.leading)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .padding()
                    .padding(.horizontal,10)
                    .foregroundStyle(.black)
                    .frame(width: geo.size.width/1.3, height: 60)
                    .overlay{
                        RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1)
                    }
                    .padding(.bottom,30)
                Button{
                    
                } label: {
                    
                    Text("Register")
                        .font(.title2)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .frame(width: geo.size.width/1.45)
                        .padding()
                        .background(.accentPink)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(radius: 10)
                        .transition(.blurReplace)
                }
                
                HStack{
                    Text("Already have an account?")
                    Button{
                        showLoginPage.toggle()
                    } label: {
                        Text("Sign In")
                            .font(.headline)
                    }
                }
                .padding(.top, 30)
                
                Spacer()
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $showLoginPage, content: {
            LoginView()
        })
    }
}

#Preview {
    RegisterView()
}
