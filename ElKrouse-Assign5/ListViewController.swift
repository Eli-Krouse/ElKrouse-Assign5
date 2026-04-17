//
//  ViewController.swift
//  ElKrouse-Assign5
//
//  Created by Krouse, William E. on 4/17/26.
//

import UIKit

class ListViewController: UIViewController
{
    var toDoList = [String]()
    
    @IBOutlet weak var toDoTableView: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination.children.first as? SaveViewController
        {
            vc.delegate = self
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let center = NotificationCenter.default
        center.addObserver(forName: .toDoDidInsert, object: nil, queue: .main) { notif in
            if let todo = notif.userInfo?["todo"] as? String
            {
                self.toDoList.append(todo)
                self.toDoTableView.reloadData()
            }
        }
    }


}

extension ListViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = toDoList[indexPath.row]
        return cell
    }
}

extension ListViewController: ToDoDelegate
{
    func addViewController(_ vc: UIViewController, didInsert todo: String) {
        toDoList.append(todo)
        toDoTableView.reloadData()
    }
    
    func addViewControllerDidCancel(_ vc: UIViewController) {
        
    }
    
    
}

enum Key
{
    case todo
}
