// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;
import "./safemath.sol";
import "./Ownable.sol";


contract TasksContract is Ownable {

  using SafeMath for uint256;  //Defining SafeMath for any type of Uint
 
    uint256 public tasksCounter = 0;    //Task Definition 

    struct Task { //List of Task 
        uint256 id;
        string title;
        string description;
        bool done;
        uint256 createdAt;
    }
//With this event I can recieve the information of the created task
    event TaskCreated(
        uint256 id,
        string title,
        string description,
        bool done,
        uint256 createdAt
    );
//Know if the task was Updated
    event TaskToggledDone(uint256 id, bool done);
 //Searching Task
    mapping(uint256 => Task) public tasks;
//create the first task so that when the contract is deployed the task 0 is not empty
    constructor() {
        createTask("my first task", "my first description");
    }

    function createTask(string memory _title, string memory _description) public onlyOwner {
        tasksCounter = tasksCounter.add(1); //Using SafeMath
       //Task added to the list   
        tasks[tasksCounter] = Task(
            tasksCounter,
            _title,
            _description,
            false,
            block.timestamp
        );
    //Emit = Return Task
        emit TaskCreated(
            tasksCounter,
            _title,
            _description,
            false,
            block.timestamp
        );
    }
// Updating task   
    function toggleDone(uint256 _id) public onlyOwner {
        Task memory _task = tasks[_id];
        _task.done = !_task.done;
        tasks[_id] = _task;
        emit TaskToggledDone(_id, _task.done);
    }
}
