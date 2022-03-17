//
//  NoteListTableViewController.swift
//  Daily Notes
//
//  Created by Rethink on 15/03/22.
//

import UIKit
import CoreData

class NoteListTableViewController: UITableViewController {
    
    var context: NSManagedObjectContext!
    var notes: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.recoverNote()
    }
    

    func recoverNote(){
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
        
        let order = NSSortDescriptor(key: "date", ascending: false)
        request.sortDescriptors = [order]
        do {
            let notesRecover = try context.fetch(request)
            self.notes = notesRecover as! [NSManagedObject]
            self.tableView.reloadData()
            print(notes[0])

        } catch let erro {
            print("Mano deu esse ERRO aqui: \(erro.localizedDescription)")
        }
        
//        do {
//            self.notes = try context.fetch(Note.fetchRequest())
//
//
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        } catch let erro as Error {
//            print("Mano deu esse ERRO aqui: \(erro.localizedDescription)")
//        }
//
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.notes.count
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        let note = self.notes[indexPath.row]
        self.performSegue(withIdentifier: "add&Update", sender: note)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "add&Update"{
            
            let destinyView = segue.destination as! NoteViewController
            destinyView.note = sender as? NSManagedObject
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let note = self.notes[indexPath.row]
        let textNote = note.value(forKey: "text")
        cell.textLabel?.text = textNote as? String
        let dateNote = note.value(forKey: "date")
        //formatar a data
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = ("dd/MM/yyyy - HH:mm")
        
        let newDateNote = dateFormatter.string(from: dateNote as! Date)
        
        cell.detailTextLabel?.text = newDateNote
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            let note = self.notes[indexPath.row]
            self.context.delete(note)
            self.notes.remove(at: indexPath.row)
            
            self.tableView.deleteRows(at: [indexPath], with: .automatic) // deleta um row sem precisar recarregar tudo que nem no tableView.reloadData
            
            do {
                try context.save()
                print("parabéns ta safe")
                
            } catch let erro {
                print("deu esse ERRO aqui: \(erro.localizedDescription)")
            }
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
