//
//  ViewController.swift
//  ReactorkitExam
//
//  Created by Chaekyeong Lee on 2022/11/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func GoXibBtn(_ sender: Any) {
        let vc = XibViewController()
        self.navigationController?.pushViewController(vc, animated: false)
        print("heeloo")
    }
    
    @IBAction func GoStoryboardBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "StoryboardViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "StoryboardViewController") as! StoryboardViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

