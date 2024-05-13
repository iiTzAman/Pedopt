//
//  ContentView.swift
//  Pedopt
//
//  Created by Aman Giri on 2024-05-11.
//

import SwiftUI
import CoreData

struct OnboardingView: View {
    
    @State private var showIconAnimation = false
    @State private var animatedText: String = ""
    @State private var showLoginPage = false
    @State private var showRegisterPage = false
    @State private var showHeaderAnimation = false

    var body: some View {
        GeometryReader{ geo in
            ZStack(alignment:.top){
                VStack {
                    if showIconAnimation {
                        Image(.background)
                            .resizable()
                            .scaledToFit()
                            .offset(y: geo.size.height/4.5)
                            .transition(.move(edge: .bottom).combined(with: .opacity))
                    }
                }
                .animation(.linear(duration: 0.5).delay(1), value: showIconAnimation)
                VStack {
                    if showIconAnimation {
                        Text("Pedopt")
                            .font(.system(size: 50, weight: .semibold, design: .rounded))
                            .offset(y:90)
                        .foregroundStyle(.accentPurple)
                        .transition(.scale.combined(with: .push(from: .top)))
                        .onAppear{
                            withAnimation(.easeInOut(duration: 1).repeatForever().delay(1)){
                                showHeaderAnimation.toggle()
                            }
                        }
                        .scaleEffect(showHeaderAnimation ? 1.01 : 1)
                        
                    }
                }
                .animation(.spring(duration: 0.5).delay(1), value: showIconAnimation)

                VStack{
                    Spacer(minLength: geo.size.height/3)
                    ZStack{
                        VStack {
                            if showIconAnimation {
                                Image(.house)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 200)
                                    .transition(.scale)
                            }
                        }
                        .animation(.bouncy(duration: 1).delay(1.5), value: showIconAnimation)
                        VStack {
                            if showIconAnimation {
                                Image(.ellipse)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 140, height: 140)
                                    .offset(y: 10)
                                    .transition(.scale)
                            }
                        }
                        .animation(.easeOut(duration: 0.5).delay(2), value: showIconAnimation)
                        VStack {
                            if showIconAnimation {
                                Image(.icon)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 200)
                                    .transition(.blurReplace.combined(with: .scale))
                            }
                        }
                        .animation(.easeOut(duration: 0.5).delay(2), value: showIconAnimation)
                    }
                    
                            Text(animatedText)
                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                                .padding(.top,20)
                                .padding(.bottom,40)
                 
                    Button{
                        showLoginPage.toggle()
                    } label: {
                        VStack {
                            if showIconAnimation {
                                Text("Sign in")
                                    .font(.title2)
                                    .foregroundStyle(.accentPurple)
                                    .fontWeight(.bold)
                                    .frame(width: geo.size.width/2)
                                    .padding()
                                    .background(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .shadow(radius: 10)
                                    .transition(.scale)
                            }
                        }
                        .animation(.easeOut(duration: 0.5).delay(2.5), value: showIconAnimation)
                    }
                    .padding(.bottom,15)
                    Button{
                        showRegisterPage.toggle()
                    } label: {
                        VStack {
                            if showIconAnimation {
                                Text("Create Account")
                                    .font(.title2)
                                    .foregroundStyle(.white)
                                    .fontWeight(.semibold)
                                    .frame(width: geo.size.width/2)
                                    .padding()
                                    .background(.accentPink)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .shadow(radius: 10)
                                    .transition(.opacity)

                            }
                        }
                        .animation(.easeOut(duration: 0.5).delay(3), value: showIconAnimation)
                    }
                    Spacer()
                }
                .frame(width: geo.size.width, height: geo.size.height)
                .foregroundStyle(.white)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
        .onAppear{
            showIconAnimation = true
            animateText(for: "Pet Adoption Made EASY", delay: 2)
        }
        .fullScreenCover(isPresented: $showLoginPage, content: {
            LoginView()
        })
        .fullScreenCover(isPresented: $showRegisterPage, content: {
            RegisterView()
        })
    }
    
    func animateText(for text: String, delay time: Double) {
        animatedText = ""
            for (index, character) in text.enumerated() {
                DispatchQueue.main.asyncAfter(deadline: .now() + time){
                    DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.1) {
                        animatedText.append(character)
                    }
                }
            }
        }
}

#Preview {
    OnboardingView()
}
