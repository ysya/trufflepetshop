pragma solidity ^0.4.2;

contract Adoption {

    address[16] public adopters;  // 保存領養者的地址

    // 領養寵物
    function adopt(uint petId) public returns (uint) {
        require(petId >= 0 && petId <= 15);  // 確保id在數組長度內

        adopters[petId] = msg.sender;        // 保存調用地址 
        return petId;
    }

    // 返回領養者
    function getAdopters() public view returns (address[16]) {
        return adopters;
    }

}