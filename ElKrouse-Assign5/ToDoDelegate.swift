//
//  ToDoDelegate.swift
//  ElKrouse-Assign5
//
//  Created by Krouse, William E. on 4/17/26.
//

import UIKit

protocol ToDoDelegate: AnyObject
{
    //insert
    func addViewController(_ vc: UIViewController, didInsert todo: String)
    //cancel
    func addViewControllerDidCancel(_ vc: UIViewController)
}

