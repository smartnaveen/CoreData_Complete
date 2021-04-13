//
//  ViewController.swift
//  CoreData_Complete
//
//  Created by Mr. Naveen Kumar on 13/04/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextFiled: UITextField!
    @IBOutlet weak var addressTextFiled: UITextField!
    @IBOutlet weak var cityTextFiled: UITextField!
    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var studentData: StudentModel?
    
    fileprivate func setupUI() {
        saveButton.layer.cornerRadius = 20
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }


    @IBAction func saveDataTapped(_ sender: UIButton) {
        if let studentName = nameTextFiled.text, let studentAddress =  addressTextFiled.text, let studentCity = cityTextFiled.text, let studentMobile = mobileTextField.text{
            studentData = StudentModel(studentName: studentName, studentAddress: studentAddress, studentCity: studentCity, studentMobile: studentMobile)
            if let safeStudentData = studentData, let showViewController = self.storyboard?.instantiateViewController(identifier: "ShowViewController") as? ShowViewController{
                DataBaseHelper.shared.saveData(studentModel: safeStudentData)
                self.navigationController?.pushViewController(showViewController, animated: true)
            }
        }
    }
}

