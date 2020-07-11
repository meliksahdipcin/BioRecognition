//
//  ViewController.swift
//  FaceRecognition
//
//  Created by Melikşah on 10.08.2019.
//  Copyright © 2019 Dipcin. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func button(_ sender: Any) {
        let authContext = LAContext()
        var error: NSError?
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "We want to be sure that you are the owner of the phone.") {
                (success, error) in
                if success == true {
                    // Succesfull authentication
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                    }
                } else {
                    DispatchQueue.main.async {
                        self.label.text = "Error!"
                    }
                }
            }
        }
    }
}
