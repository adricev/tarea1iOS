//
//  ViewController.swift
//  TareaiOS
//
//  Created by Adrian  on 18/10/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func JugarBtn(_ sender: Any) {
        let storyboard = self.storyboard?.instantiateViewController(withIdentifier:
            "GameStoryboard") as! gameController
        
    }


}
