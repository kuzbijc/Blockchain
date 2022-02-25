// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    mapping(address => uint256) public addressToAmountFunded;
    address[] public funders;
    address public owner;

    // this gets called the instant contract is deployed
    // so you will immediately be the owner
    constructor() public {
        owner = msg.sender;
    }

    // fund an address with an amount of ether (wei, gwei, ether)
    function fund() public payable {
        // $50
        uint256 minimumUSD = 50 * 10 **18; //converted USD to gwei
        require(getConversionRate(msg.Value) >= minimumUSD, "minimum not met");
        // if sender does not meet min req, transaction reverted, sender gets money back
        addressToAmountFunded[msg.sender] += msg.value;
        funders.push(msg.sender);
    }

    // ETH -> USD conversion rate? chainlink contracts, decentralized oracle
    // interfaces (similar to structs) used to interact with deployed contracts, need ABI
    // deploy to injected web3 (your wallet)
    function getVersion() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(_insertAddress here);
        return priceFeed.version();
    }

    // returns LATEST price of ETH in terms of USD
    function getPrice() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(_insertAddress here, plus 5 variables that this function has);
        priceFeed.latestRoundData();
        return uint256(answer);
        // answer is in 'answer * 10 ** 8'
        // clear unused variables by leaving the commas
        // convert to wei (smallest unit of measure of ether)
        // multiply ether by 10**18
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        //1000000000 wei = 1 gwei
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 10**18;
        return ethAmountInUsd;
    }

    // function will only run if you are the owner
    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }

    function withdraw() payable onlyOwner public { 
        // send entire balance of eth from one address to another
        // 'this' represents the contract
        //use 'require msg.sender == owner' so only you can withdraw
        msg.sender.transfer(address(this).balance);
        
        // reset sender balance to zero
        for (uint256 funderIndex=0; funderIndex<funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        // reset funders
        funders = new address[](0);
    }



}
