//
//  PromoView.swift
//  PromoCodeSwiftUI
//
//  Created by Александр Белый on 28.02.2025.
//

import SwiftUI

struct CustomText: View {
    let text: String
    let paddingLeading: CGFloat
    let paddingTrailing: CGFloat
    let colortext: Color
    
    
    var body: some View {
        Text(text)
            .font(Fonts.roboto2)
            .foregroundStyle(colortext)
            .padding(.leading, paddingLeading)
            .padding(.trailing, paddingTrailing)
        
        
    }
}

struct CustomButton: View {
    var body: some View {
        Button {
            
        } label: {
            Text("Применить промокод")
                .foregroundStyle(Colors.orangeRed)
                .frame(maxWidth: .infinity)
                .frame(height: 54)
                .background(Colors.orangeLight)
                .cornerRadius(12)
                .padding(.horizontal, 16)
                .padding(.top, 16)
            
            
        }
        
    }
}

struct HeaderView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Промокоды")
                    .font(Fonts.roboto)
                    .foregroundStyle(Color.black)
                    .padding(.top, 24)
                    .padding(.leading, 16)
                Spacer()
            }
            
            HStack {
                Text("На один товар можно применить только один\nпромокод")
                    .multilineTextAlignment(.leading)
                    .font(Fonts.roboto2)
                    .foregroundStyle(Colors.gray)
                    .padding(.top, 10)
                    .padding(.leading, 16)
                Spacer()
            }
            
            
        }
    }
}

struct PromoView: View {
    
    @ObservedObject var viewModel = PromoViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                HeaderView()
                CustomButton()
                
                    .padding(.bottom, 16)
                
                ScrollView {
                    ForEach(viewModel.promoCode.indices, id: \.self) { index in
                        ForEach(viewModel.promoCode[index].promocodes.indices, id: \.self) { promoIndex in
                            VStack(spacing: 0) {
                                
                                HStack {
                                    HStack(spacing: 4) {
                                        Text(viewModel.promoCode[index].promocodes[promoIndex].title)
                                            .font(Fonts.roboto3)
                                            .padding(.leading, 20)
                                            .padding(.top, 12)
                                           
                
                                        Text("-\(viewModel.promoCode[index].promocodes[promoIndex].percent)%")
                                            .font(Fonts.sfProText)
                                            .foregroundStyle(Colors.white)
                                            .frame(width: 35, height: 20)
                                            .background(Colors.greenLight)
                                            .cornerRadius(32)
                                            .padding(.top, 12)
                                        
                                        Image(systemName: "info.circle")
                                            .foregroundStyle(Colors.gray)
                                            .frame(width: 20, height: 20)
                                            .padding(.top, 12)
                                        
                                        Spacer()
                                    }
                                    .frame(minWidth: 300, maxHeight: 20)
                                    
                                    Toggle(
                                        isOn: Binding(
                                            get: { viewModel.promoCode[index].promocodes[promoIndex].active },
                                            set: { newValue in
                                                viewModel.promoCode[index].promocodes[promoIndex].active = newValue
                                            }
                                        )
                                    ) {}
                                    
                                    
                                        .padding(.trailing, 20)
                                        .padding(.top ,33)
                                }
                                
                                .frame(height: 35)
        
                                HStack {
                                    if let endDate = viewModel.promoCode[index].promocodes[promoIndex].endDate {
                                        Text(endDate.formattedForPromo())
                                            .font(Fonts.roboto2)
                                            .foregroundStyle(Colors.gray)
                                            .padding(.leading, 20)
                                            .padding(.bottom, 8)
                                            .padding(.top, 5)
                                          
                                    }
                                    Spacer()
                                }
                                .frame(height: 20)
                                
                                if let info = viewModel.promoCode[index].promocodes[promoIndex].info, !info.isEmpty {
                                    HStack {
                                        Text(info)
                                            .foregroundStyle(Colors.gray)
                                            .font(Fonts.roboto4)
                                            .lineLimit(nil)
                                            .fixedSize(horizontal: false, vertical: true)
                                            .padding(.leading, 20)
                                            .padding(.bottom, 12)
                                            .padding(.top, 8)
                                        Spacer()
                                    }
                                }
                                
                                
                                Spacer()
                                
                            }
                            
                            .frame(maxWidth: .infinity, minHeight: 66, maxHeight: 90)
                            .background(Colors.grayLight)
                            .cornerRadius(12)
                            .padding(.horizontal, 16)
                            .padding(.bottom, 8)
                            
                        }
                        
                    }
                    
                    HStack {
                        
                        Button {
                            
                        } label: {
                            Text("Скрыть промокоды")
                                .foregroundStyle(Colors.orangeRed)
                                .padding(.top, 17)
                                .padding(.bottom, 33)
                                .padding(.leading, 32)
                            Spacer()
                            
                            
                        }
                
                    }
                 
                }
            }
            
            VStack() {
                HStack {
                    CustomText(text: "Цена за 2 товара", paddingLeading: 32, paddingTrailing: 0, colortext: .black)
                        .padding(.bottom, 10)
                        .padding(.top, 24)
                    
                    Spacer()
                    
                    CustomText(text: "2500 р", paddingLeading: 0, paddingTrailing: 32, colortext: .black)
                        .padding(.top, 24)
                    
                        .padding(.bottom, 10)
                }
                
                HStack {
                    CustomText(text: "Скидки", paddingLeading: 32, paddingTrailing: 0, colortext: .black)
                        .padding(.bottom, 10)
                    
                    Spacer()
                    
                    CustomText(text: "2500 р", paddingLeading: 0, paddingTrailing: 32, colortext: Colors.orangeRed)
                        .padding(.bottom, 10)
                }
                
                HStack(spacing: 4) {
                    CustomText(text: "Промокоды", paddingLeading: 32, paddingTrailing: 0, colortext: .black)
                        .padding(.bottom, 10)
                    Image(systemName: "info.circle")
                        .foregroundStyle(Colors.gray)
                        .frame(width: 20, height: 20)
                        .padding(.bottom, 10)
                    
                    Spacer()
                    
                    CustomText(text: "2500 р", paddingLeading: 0, paddingTrailing: 32, colortext: Colors.greenLight)
                        .padding(.bottom, 10)
                }
                
                HStack {
                    CustomText(text: "Способ оплаты", paddingLeading: 32, paddingTrailing: 0, colortext: .black)
       
                    
                    Spacer()
                    
                    CustomText(text: "2500 р", paddingLeading: 0, paddingTrailing: 32, colortext: .black)
                    
                }
                
                Divider()
                    .padding([.top, .bottom], 16)
                    .padding([.leading, .trailing], 32)
                
                HStack {
                    Text("Итого")
                        .font(Fonts.roboto5)
                        .padding(.leading, 32)
                    
                    
                    Spacer()
                    
                    Text("2500 р")
                        .font(Fonts.roboto5)
                        .padding(.trailing, 32)
                      
                }
                
             
                    
                    Button {
                        
                    } label: {
                        Text("Оформить заказ")
                            .padding(16)
                            .font(Fonts.roboto3)
                            .foregroundStyle(Colors.white)
                            .frame(maxWidth: .infinity, maxHeight: 54)
                            .background(Colors.orangeRed)
                            .cornerRadius(12)
                            .padding(.horizontal, 32)
                       
                    }
            
                var attributedString: AttributedString {
                    var string = AttributedString("Нажимая кнопку «Оформить заказ»,\nВы соглашаетесь с Условиями оферты")
                    
                    if let range = string.range(of: "Условиями оферты") {
                        string[range].foregroundColor = .black
                    }
                    
                    return string
                }

                Text(attributedString)
                    .font(Fonts.roboto4)
                    .multilineTextAlignment(.center)
                    .padding(.top, 16)
                    .foregroundStyle(Colors.gray)
                    .padding(.bottom, 10)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Colors.grayLight)
        }
        
    }
}

#Preview {
    PromoView()
}

