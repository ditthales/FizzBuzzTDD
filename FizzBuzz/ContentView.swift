//
//  ContentView.swift
//  FizzBuzz
//
//  Created by ditthales on 13/02/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: ContentViewModel
    
    init(viewModel: ContentViewModel = ContentViewModel()) {
        self.viewModel = viewModel
    }
    
    
    var body: some View {
        ZStack {
            Color(viewModel.colorBackground)
            VStack {
                LivesView(totalLives: $viewModel.totalLives, remainingLives: $viewModel.remainingLives)
                
                Spacer()
                
                VStack (spacing: 25) {
                    HStack (spacing: 25) {
                        Button {
                            viewModel.scorePressed()
                        } label: {
                            Text("\(viewModel.currentLevel)")
                                .font(.system(size: 50))
                                .frame(width: 65, height: 65)
                                .padding()
                                .border(.white, width: 4)
                                .cornerRadius(5)
                        }
                        Button {
                            viewModel.champagnePressed()
                        } label: {
                            Image("champagne")
                                .frame(width: 65, height: 65)
                                .padding()
                                .border(.white, width: 4)
                                .cornerRadius(5)
                        }

                    }
                    HStack (spacing: 25) {
                        Button {
                            viewModel.lightningPressed()
                        } label: {
                            Image("lightning")
                                .frame(width: 65, height: 65)
                                .padding()
                                .border(.white, width: 4)
                                .cornerRadius(5)
                        }
                        Button {
                            viewModel.spacePressed()
                        } label: {
                            Image("space")
                                .frame(width: 65, height: 65)
                                .padding()
                                .border(.white, width: 4)
                                .cornerRadius(5)
                        }
                        
                    }
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    Button {
                        viewModel.playAgainPressed()
                    } label: {
                        Text ("PLAY AGAIN")
                            .font(.title3)
                            .bold()
                    }

                }
            }
            .foregroundColor(.white)
            .padding(50)
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
