//
//  HoroscopeViewController.swift
//  horoscopePersistence
//
//  Created by Sam Roman on 9/24/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import UIKit

class HoroscopeViewController: UIViewController {
    
    var currenthoroscope: Horoscope?

    @IBOutlet weak var singName: UILabel!
    
    @IBOutlet weak var horoscope: UITextView!
    
    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        singName.text = currenthoroscope?.sunsign
        horoscope.text = currenthoroscope?.horoscope
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
