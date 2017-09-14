//
//  MainTabViewController.swift
//  running
//
//  Created by 刘光强 on 2017/9/13.
//  Copyright © 2017年 guangqiang. All rights reserved.
//

import UIKit

class MainTabViewController: UITabBarController {
    
    let titles = ["Steps","Sport","Me"]
    
    let stepsViewController = StepsViewController()
    let sportViewController = SportViewController()
    let meViewController = MeViewController()
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepsViewController.tabBarItem.title = "Steps"
        sportViewController.tabBarItem.title = "Sport"
        meViewController.tabBarItem.title = "Me"
        
        stepsViewController.tabBarItem.image=UIImage(named: "ic_menu_step")
        sportViewController.tabBarItem.image=UIImage(named: "ic_menu_sport")
        meViewController.tabBarItem.image=UIImage(named: "ic_menu_me")
        
        self.viewControllers = [stepsViewController, sportViewController, meViewController]
        self.tabBar.tintColor = UIColor.primary()
        self.tabBar.unselectedItemTintColor = UIColor.grayLight()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
