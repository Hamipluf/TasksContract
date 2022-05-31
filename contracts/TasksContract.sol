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
//Con el evento puedo recibir la informacion de la tarea creada
    event TaskCreated(
        uint256 id,
        string title,
        string description,
        bool done,
        uint256 createdAt
    );
//Saber si la tarea fue actualizada
    event TaskToggledDone(uint256 id, bool done);
 //busqueda de tarea
    mapping(uint256 => Task) public tasks;

    constructor() {
        createTask("my first task", "my first description");
    }

    function createTask(string memory _title, string memory _description) public onlyOwner {
        tasksCounter = tasksCounter.add(1);//usando SafeMath
       //Tarea agregada a la lista  
        tasks[tasksCounter] = Task(
            tasksCounter,
            _title,
            _description,
            false,
            block.timestamp
        );
    //Emit = devuelve la tarea 
        emit TaskCreated(
            tasksCounter,
            _title,
            _description,
            false,
            block.timestamp
        );
    }
// actualizando la tarea    
    function toggleDone(uint256 _id) public onlyOwner {
        Task memory _task = tasks[_id];
        _task.done = !_task.done;
        tasks[_id] = _task;
        emit TaskToggledDone(_id, _task.done);
    }
}