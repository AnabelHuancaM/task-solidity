// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TaskContract {
    uint nextId;

    struct Task {
        uint id;
        string name;
        string description;
    }
    //array 
    Task[] tasks;

    function createTask(string memory _name, string memory _description) public {
        tasks.push(Task(nextId, _name, _description));
        nextId++;
    }

    function findIndex(uint _id) internal view returns (uint) {
        for (uint i = 0; i < tasks.length; i++) {
            if (tasks[i].id == _id) {
                return i;
            }
        }
        //en caso de error 
        revert('Task not found');
    }


    function readTask(uint _id) public view returns (uint, string memory, string memory) { //especificar el tipo de dato 
        uint index = findIndex(_id);
        return (tasks[index].id, tasks[index].name, tasks[index].description);
    }

    function updateTask(uint _id, string memory _name, string memory _description) public {
        uint index = findIndex(_id); //buscar por id
        tasks[index].name = _name;
        tasks[index].description = _description;
    }

    function deleteTask(uint _id) public  {
        uint index = findIndex(_id);
        delete tasks[index];
    }

}