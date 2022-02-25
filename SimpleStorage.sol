// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;

contract SimpStorage {
    
    // initialized to 0
    uint256 favoriteNumber;
    
    /*
    bool favoriteBool = true;
    string favoriteString = "bingo";
    int256 favoriteInt = -5;
    // address ...
    bytes32 favoriteBytes = "cat";
    */
    
    struct People {
        uint256 favoriteNumber;
        string Name;
    }
    
    // dynamic array
    People[] public people;
    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    } 
    
    // view is for reading, pure is for math
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }
    
    
    // after execution, variable is erased
    function addPerson(string memory _Name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _Name));
        nameToFavoriteNumber[_Name] = _favoriteNumber;
    }
    
}

/*
What is happening:

Store function designates the value of favoriteNumber.
Retrieve is a view function that returns favoriteNumber.
People struct is used to associate favoriteNumber and Name with a person/people.
people array creates an array of the object People, allowing to store multiple people with favoriteNumber and Name.
addPerson function allows us to add to the people array.
mapping on line 25 allows us to look up Name to find favoriteNumber.
*/
