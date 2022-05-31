// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;
import "./safemath.sol";
import "./Ownable.sol";


contract TasksContract is Ownable {

  using SafeMath for uint256;  //definiendo SafeMath para cualquier tipo de uint
 
    uint256 public tasksCounter = 0;    //Definicion tarea

    struct Task {//Enlistado de tareas 
        uint256 id;
        string title;
        string description;
        bool done;
        uint256 createdAt;
    }

    event TaskCreated(
        uint256 id,
        string title,
        string description,
        bool done,
        uint256 createdAt
    );
    event TaskToggledDone(uint256 id, bool done);

    mapping(uint256 => Task) public tasks;

    constructor() {
        createTask("my first task", "my first description");
    }

    function createTask(string memory _title, string memory _description) public onlyOwner {
        tasksCounter = tasksCounter.add(1);//usando SafeMath
        tasks[tasksCounter] = Task(
            tasksCounter,
            _title,
            _description,
            false,
            block.timestamp
        );
        emit TaskCreated(
            tasksCounter,
            _title,
            _description,
            false,
            block.timestamp
        );
    }

    function toggleDone(uint256 _id) public onlyOwner {
        Task memory _task = tasks[_id];
        _task.done = !_task.done;
        tasks[_id] = _task;
        emit TaskToggledDone(_id, _task.done);
    }
}