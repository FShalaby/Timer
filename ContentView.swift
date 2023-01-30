//
//  ContentView.swift
//  Timer
//
//  Created by Fouad Shalaby on 2022-08-29.
//

import SwiftUI


struct ContentView: View {
    @State var selectedSec: Int = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var start = false
    @State var show = false
    @State private var showAlert = false
    
    var body: some View {
         var percent = selectedSec
        VStack {
            ZStack {
                
                
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .frame(width:500,height: 500)
                    .foregroundStyle(LinearGradient(colors: [Color.Background.opacity(0.6),Color.mint.opacity(0.5)], startPoint: .bottomLeading, endPoint: .topLeading))
                    .offset(x: 400)
                    .blur(radius: 30)
                    .rotationEffect(.degrees(30))
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .frame(width:500,height: 500)
                    .foregroundStyle(LinearGradient(colors: [Color.Background.opacity(0.6), Color.mint.opacity(0.6)], startPoint: .top, endPoint: .leading))
                    .offset(x: -300, y: -250)
                    .blur(radius: 30)
                    .rotationEffect(.degrees(-30))
                VStack(spacing: 40){
                    
                    
                    VStack {
                        ZStack{
                            Text(convert(time:selectedSec))
                                .padding()
                                .font(.system(size: 50))
                                .onReceive(timer){_ in
                                    if start == true
                                    {
                                        if selectedSec > 0
                                        {
                                            selectedSec -= 1
                                            percent -= 1
                                            
                                        }
                                       
                                        if selectedSec == 0
                                        {
                                            showAlert = true
                                            start = false
                                            show = false
                                            
                                            
                                        }
                                           
                                        
                                    }
                                    
                                }
                           
                            
                        }
                        ProgressBar(height: 30, percent: CGFloat(percent))
                            .padding()
                            .animation(.linear(duration: 1.0), value: show)
                            
                    }
                    
                    
                    
                    
                    HStack(spacing: 20)
                    {
                        Button
                        {
                            start = true
                            show = true
                           
                            
                        }label:
                        {
                            Text("Start")
                        }
                        
                        .frame(width: 100, height: 30)
                        .background(LinearGradient(colors: [Color.icon,Color.blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .cornerRadius(20)
                        .foregroundColor(Color.white)
                        Button
                        {
                            selectedSec = 0
                            percent = 0
                            showAlert = false
                        }label:
                        {
                            Text("Reset")
                        }
                        .alert(isPresented: $showAlert)
                    {
                        Alert(
                                  title: Text("Timer"),
                                  message: Text("Your Timer Countdown Is Over")
                              )
                    }
                        
                        .frame(width: 100, height: 30)
                        .background(LinearGradient(colors: [Color.icon,Color.blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .cornerRadius(20)
                        .foregroundColor(Color.white)
                        
                    }
                    .padding()
                    Spacer()
                    
                    GeometryReader { geometry in
                        HStack{
                            
                            Spacer()
                            Picker("Select Second", selection: $selectedSec)
                            {
                                ForEach(0...300, id: \.self){ sec in
                                    Text("\(sec)")
                                    
                                }
                            }
                            .pickerStyle(.inline)
                            .frame(width: geometry.size.width/3, height: 100)
                            .clipped()
                            .background(LinearGradient(colors: [Color.icon.opacity(0.6),Color.blue.opacity(0.6)], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .cornerRadius(20)
                            .foregroundColor(Color.white)
                            .labelsHidden()
                            Spacer()
                            
                            
                            
                            
                            
                        }
                        
                    }
                }
            }
        }
        
        
        
    }
    
    
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
