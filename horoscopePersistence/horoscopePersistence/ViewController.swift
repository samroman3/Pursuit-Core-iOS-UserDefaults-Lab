//
//  ViewController.swift
//  horoscopePersistence
//
//  Created by Sam Roman on 9/24/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var userNameField: UITextField!
    @IBAction func userNameAction(_ sender: UITextField) {
    }
    @IBAction func continueButton(_ sender: UIButton) {
        
    }

    
    var horoscope: Horoscope?
    
    func loadHoroscope(){
        HoroscopeAPIClient.shared.getHoroscopes { (result) in
            DispatchQueue.main.async {
                switch result{
                case .success(let data):
                    self.horoscope = data
                    print(data.sunsign)
                case .failure(let error):
                    print(error)
                    
                }
            }
        }
    }
    
    
    func getDate() -> String {
      let components = datePicker.calendar.dateComponents([.day, .month, .year], from: datePicker.date)
      let day = components.day
      let month = components.month
      let year = components.year
      return ""

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "segue" {
               let destination = segue.destination as! HoroscopeViewController
            destination.currenthoroscope = horoscope
           }
       }
       
    
    override func viewDidLoad() {
        loadHoroscope()
        userNameField.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}




extension ViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
