// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.8;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    uint256 public minimumUSD = 50 * 1e18; // 1e18 is for 1 eth == 1 wei (18 zeroes)

    function fund() public payable {
       require(getConversionRate(msg.value) >= minimumUSD, "Send More ETH");
    }

    function getVersion() public view returns (uint256){
        // ETH/USD price feed address of Goerli Network.
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        return priceFeed.version();
    }

    function getPrice() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xA39434A63A52E749F02807ae27335515BA4b07F7);
        (,int256 price,,,) = priceFeed.latestRoundData();
        // price feed returns value with decimal upto 8 decimals.  We need to convert this interms of wei which have 18 zeros, so we need to append 10 zeros
        return uint256(price * 1e10);
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUSD = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUSD;
    }
}
