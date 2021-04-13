//
//  ShowViewController.swift
//  CoreData_Complete
//
//  Created by Mr. Naveen Kumar on 13/04/21.
//

import UIKit

protocol DidDataPassProtocol: class {
    func didDataPass(studentEntity: Student, isEdit: Bool, index: Int)
}

class ShowViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var studentData = [Student]()
    weak var delegate: DidDataPassProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentData = DataBaseHelper.shared.fetchData()
        tableView.register(StudentTableViewCell.shared.nib(), forCellReuseIdentifier: StudentTableViewCell.shared.cellIdentifier)
    }

}

 // MARK:- TableView Methods
extension ShowViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StudentTableViewCell.shared.cellIdentifier, for: indexPath) as! StudentTableViewCell
        cell.updateStudentProfile = studentData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
           studentData = DataBaseHelper.shared.deleteData(index: indexPath.row)
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didDataPass(studentEntity: studentData[indexPath.row], isEdit: true, index: indexPath.row)
        self.navigationController?.popToRootViewController(animated: true)
    }
}
