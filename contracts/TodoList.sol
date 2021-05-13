pragma solidity ^0.5.0;

contract TodoList {
    //State variables are written to the blockchain
    uint256 public taskCount;

    struct Task {
        uint256 id;
        string content;
        bool completed;
    }

    //Mapping in solidity is an array or a key/value pair
    //this will serve as our database on the smart contract
    //The keyword public allows us to access the variable outside of the mapping
    //In solidity, the only way you can get the count of a mapping (array) is to iterate over it all
    mapping(uint256 => Task) public tasks;

    event TaskCreated(uint256 id, string content, bool completed);

    event TaskCompleted(uint256 id, bool completed);

    constructor() public {
        createTask("Check out verkyav peter");
    }

    function createTask(string memory _content) public {
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false);
        emit TaskCreated(taskCount, _content, false);
    }

    function toggleCompleted(uint256 _id) public {
        Task memory _task = tasks[_id];
        _task.completed = !_task.completed;
        tasks[_id] = _task;
        emit TaskCompleted(_id, _task.completed);
    }
}
