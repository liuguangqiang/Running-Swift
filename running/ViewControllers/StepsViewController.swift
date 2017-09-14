//
//  StepsViewController.swift
//  running
//
//  Created by 刘光强 on 2017/9/14.
//  Copyright © 2017年 guangqiang. All rights reserved.
//

import UIKit
import CoreMotion

class StepsViewController: UIViewController {
    
    @IBOutlet weak var lbSteps: UILabel!
    
    let pedometer = CMPedometer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startPeometer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startPeometer(){
        guard CMPedometer.isStepCountingAvailable() else {
            print("Pedometer is unavailable")
            return
        }
        
        let cal = Calendar.current
        print("Calendar.current:%@",cal)
        var comps = cal.dateComponents([.year, .month, .day], from: Date())
        comps.hour = 0
        comps.minute = 0
        comps.second = 0
        let midnightOfToday = cal.date(from: comps)!
        print("midnightOfToday:%@",midnightOfToday)
        
        self.pedometer.startUpdates(from: midnightOfToday) { (pedometerData, error) in
            let steps = pedometerData?.numberOfSteps
            DispatchQueue.main.async {
                self.lbSteps.text = steps?.stringValue
            }
        }
    }

}
