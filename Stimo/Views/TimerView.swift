//
//  TimerView.swift
//  Stimo
//
//  Created by Ariel Waraney on 22/07/22.
//

import SwiftUI

struct TimerView: View {
    
    @EnvironmentObject var timerModel: TimerModel
    @Environment(\.presentationMode) var presentMode
    @State var isDone = false
    @State var mvFocusPlanShowed = false
    @State var mvTimerControlShowed = false
    
    var body: some View {
        
        if isDone {
            CompleteView()
        } else {
            ZStack {
                Color("GreyOne").ignoresSafeArea()
                VStack {
                    HStack {
                        Spacer()
                        Button() {
                            //action
                            presentMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "x.circle.fill")
                                .foregroundColor(Color("YellowOne"))
                        }
                        .opacity(timerModel.isStarted ? 0 : 1)
                    }.padding()
                    VStack(alignment: .center) {
                        Spacer()
                        Text("Check Your Focus Plan Before You Start!")
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                        GeometryReader { proxy in
                            VStack(spacing: 15){
                                ZStack {
                                    Circle()
                                        .stroke(Color("GreyTwo"), lineWidth: 1)
                                    Circle()
                                        .trim(from: 0, to: CGFloat(timerModel.progressBar))
                                        .stroke(Color("YellowOne"), lineWidth: 20)
                                    Text("\(selectedTimeConvert(hint:"hr")):\(selectedTimeConvert(hint:"min")):\(selectedTimeConvert(hint:"sec"))")
                                        .font(.system(size: 45))
                                        .fontWeight(.heavy)
                                        .foregroundColor(Color("YellowOne"))
                                        .rotationEffect(.init(degrees: 90))
                                }
                                .padding(30)
                                .frame(height: proxy.size.width)
                                .rotationEffect(.init(degrees: -90))
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        }
                        Spacer(minLength: 77)
                        ZStack {
                            HStack() {
                                Spacer()
                                Button() {
                                    //action
                                    mvFocusPlanShowed.toggle()
                                } label: {
                                    VStack {
                                        Image(systemName: "pencil.circle.fill")
                                            .foregroundColor(Color("YellowTwo"))
                                        Text("Focus Plan")
                                            .foregroundColor(Color("YellowTwo"))
                                    }
                                }
                                .opacity(timerModel.isStarted ? 1 : 0)
                                .sheet(isPresented: $mvFocusPlanShowed) {
                                    TimerControlView()
                                }
                                Spacer()
                                Button() {
                                    //action
                                    mvTimerControlShowed.toggle()
                                    //TODO: Cara Pause Nanti
                                    /*
                                    timerModel.isStarted = true
                                    */
                                    //Cancelling All Notifications
                                    //UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                                } label: {
                                    VStack {
                                        Image(systemName: "timer")
                                            .foregroundColor(Color("YellowOne"))
                                        Text("Timer")
                                            .foregroundColor(Color("YellowOne"))
                                    }
                                }
                                .opacity(timerModel.isStarted ? 1 : 0)
                                .sheet(isPresented: $mvFocusPlanShowed) {
                                    TimerControlView()
                                }
                                
                                Spacer()
                            }
                            
                            HStack(spacing: 30) {
                                Button("FOCUS PLAN"){
                                    //action
                                    print("Focus Planner")
                                }
                                .font(.system(size: 15, weight: .bold, design: .default))
                                .frame(width: 137, height: 39)
                                .foregroundColor(Color("GreyOne"))
                                .background(Color("YellowTwo"))
                                .cornerRadius(100)
                                .opacity(timerModel.isStarted ? 0 : 1)
                                
                                Button("START"){
                                    //action
                                    timerModel.startTimer()
                                    print("Timer start")
                                }
                                .font(.system(size: 15, weight: .bold, design: .default))
                                .frame(width: 137, height: 39)
                                .foregroundColor(Color("GreyOne"))
                                .background(Color("YellowOne"))
                                .cornerRadius(100)
                                .opacity(timerModel.isStarted ? 0 : 1)
                            }
                        }
                        Spacer()
                    }
                    .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
                        if timerModel.isStarted {
                            timerModel.updateTimer()
                        }
                        if timerModel.isFinished {
                            //call the scheduler notification
                            NotificationManager.instance.scheduleNotification()
                            isDone = timerModel.isFinished
                            timerModel.isFinished.toggle()
                            timerModel.stopTimer()
                        }
                    }
                }
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            }
        }
         
    }
    
    func selectedTimeConvert(hint: String) -> String {
        switch hint {
        case "hr":
            return "\(timerModel.hour >= 10 ? "\(timerModel.hour)" : "0\(timerModel.hour)")"
        case "min":
            return "\(timerModel.minute >= 10 ? "\(timerModel.minute)" : "0\(timerModel.minute)")"
        case "sec":
            return "\(timerModel.second >= 10 ? "\(timerModel.second)" : "0\(timerModel.second)")"
        default:
            return "error"
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView().environmentObject(TimerModel())
    }
}

/*
//custom half modal view modifier
extension View{
    
    func halfScreen<ScreenView: View>(showScreen: Binding<Bool>, @ViewBuilder screenView: @escaping()->ScreenView)->some View {
        
        return self
            .background(HalfScreenHelper(screenView: screenView(), showScreen: showScreen))
    }
    
}

struct HalfScreenHelper<ScreenView: View>: UIViewControllerRepresentable {
    var screenView: ScreenView
    @Binding var showScreen: Bool
    
    let controller = UIViewController()
    
    func makeUIViewController(context: Context) -> some UIViewController {
        controller.view.backgroundColor = UIColor(Color("GreyOne"))
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        if showScreen {
            //present the modal view...
            let screenController = UIHostingController(rootView: screenView)
            //let screenController = CustomHostingController(rootView: screenView)
            
            uiViewController.present(screenController, animated: true) {
                //toogling the showed state
                DispatchQueue.main.async {
                    self.showScreen.toggle()
                }
            }
        }
    }
}

class CustomHostingController<Content: View> : UIHostingController<Content> {
    override func viewDidLoad() {
        //setting the controller properties
        if let presentationController = presentationController as? UISheetPresentationController {
            presentationController.detents = [
                .medium(),
                .large()
            ]
        }
    }
}
*/
