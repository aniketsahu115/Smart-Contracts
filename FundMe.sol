    //Get funds from the users
    //Withdraw funds
    //Set a minimum funding value in USD

    //SPDX-License-Identifier: MIT

    pragma solidity ^0.8.18;

    import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";



    contract FundMe {
        uint256 public minimumUsd = 5e18;
        
        function fund() public payable  {
            //Allow users to send $
            //Have a minimum $ sent
            //How do we send ETH to this contract
            require(getConversionRate(msg.value) >= minimumUsd, "Not enough eth sent!");

        }

        // function withdraw() public {

        // }

        function getPrice () public view returns(uint256) {
            //Address - 0x694AA1769357215DE4FAC081bf1f309aDC325306
            //ABI

            AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
            (,int256 price,,,) = priceFeed.latestRoundData();
            return uint256(price * 1e10);
        }

        function getConversionRate(uint256 ethAmount) public view returns(uint256) {
            uint256 ethPrice = getPrice();
            uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18; 
            return ethAmountInUsd;  

        }
        function getVersion() public view returns (uint256) {
            return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();   
        }

    }   
