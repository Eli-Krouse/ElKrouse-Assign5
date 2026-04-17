//
//  SaveViewController.swift
//  ElKrouse-Assign5
//
//  Created by Krouse, William E. on 4/17/26.
//

import UIKit

class SaveViewController: UIViewController
{
    
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var toDoSegmentedControl: UISegmentedControl!
    
    var toDoVC: ListViewController?
    
    var delegate: ToDoDelegate?
    
    @IBAction func saveButton(_ sender: Any)
    {
        guard let text = inputTextField.text else
        {
            return
        }
        
        switch(toDoSegmentedControl.selectedSegmentIndex)
        {
        case 0:
            toDoVC?.toDoList.append(text)
            toDoVC?.toDoTableView.reloadData()
        case 1:
            delegate?.addViewController(self, didInsert: text)
        case 2:
            let center = NotificationCenter.default
            center.post(name: .toDoDidInsert, object: nil, userInfo: ["todo": text])
        default:
            print("error in segmented")
        }
        
        
        dismiss(animated: true)
    }
    
    @IBAction func cancelButton(_ sender: Any)
    {
  
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

extension NSNotification.Name
{
    static let toDoDidInsert = NSNotification.Name("toDoDidInsert")
}



