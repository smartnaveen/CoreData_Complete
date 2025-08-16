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
    @IBOutlet weak var showButton: UIButton!
    
    var studentData: StudentModel?
    var isUpdate: Bool = false
    var editIndex: Int = Int()
    fileprivate func setupUI() {
        saveButton.layer.cornerRadius = 20
        showButton.layer.cornerRadius = 10
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    @IBAction func saveDataTapped(_ sender: UIButton) {
        if let studentName = nameTextFiled.text, let studentAddress =  addressTextFiled.text, let studentCity = cityTextFiled.text, let studentMobile = mobileTextField.text{
            studentData = StudentModel(studentName: studentName, studentAddress: studentAddress, studentCity: studentCity, studentMobile: studentMobile, id: "", fees: "", age: "11", gender: "male", avatar: "1.png", nickname: "Pos User", principle_name: "", school_name: "VS code", father_name: "", mother_name: "", is_active: "", created_at: "")
            if let safeStudentData = studentData{
                if isUpdate {
                    DataBaseHelper.shared.updateData(studentModel: studentData!, editIndex: editIndex)
                }else {
                    DataBaseHelper.shared.saveData(studentModel: safeStudentData)
                }
            }
        }
    }
    
    @IBAction func showButtonTapped(_ sender: UIButton) {
        if let showViewController = self.storyboard?.instantiateViewController(identifier: "ShowViewController") as? ShowViewController {
            showViewController.delegate = self
            self.navigationController?.pushViewController(showViewController, animated: true)
        }
    }
    
}

 // MARK:- Protocol Called
extension ViewController: DidDataPassProtocol {
    func didDataPass(studentEntity: Student, isEdit: Bool, index: Int) {
        nameTextFiled.text = studentEntity.name
        addressTextFiled.text = studentEntity.address
        cityTextFiled.text = studentEntity.city
        mobileTextField.text = studentEntity.mobile
        isUpdate = isEdit
        editIndex = index
    }
}
