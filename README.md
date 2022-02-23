# Blockchain

Basic contract written in Solidity, deployed on remix.ethereum.org via Javascript VM.

What is happening:

Store function designates the value of favoriteNumber.

Retrieve is a view function that returns favoriteNumber.

People struct is used to associate favoriteNumber and Name with a person/people.

people array creates an array of the object People, allowing to store multiple people with favoriteNumber and Name.

addPerson function allows us to add to the people array.

mapping on line 25 allows us to look up Name to find favoriteNumber.

