pragma solidity >=0.6.6;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

// NFT baseline
contract SimpleCollectible is ERC721 {
    uint256 tokenCounter;
    constructor () public ERC721 ("Dogie", "DOG") {
        tokenCounter = 0;
    }
    // tokenURI is metadata of the NFT
    function createCollectible(string memory tokenURI) public returns (uint256) {
        uint256 newItemId = tokenCounter;
        _safeMint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        tokenCounter += 1;
        return newItemId;
    }

}
