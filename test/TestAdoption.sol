pragma solidity ^0.4.2;

import "truffle/Assert.sol";   // 引入的斷言
import "truffle/DeployedAddresses.sol";  // 用來獲取被測試合約的地址
import "../contracts/Adoption.sol";      // 被測試合約

contract TestAdoption {
  Adoption adoption = Adoption(DeployedAddresses.Adoption());

  // 領養測試用例
  function testUserCanAdoptPet() public {
    uint returnedId = adoption.adopt(8);

    uint expected = 8;
    Assert.equal(returnedId, expected, "Adoption of pet ID 8 should be recorded.");
  }

  // 寵物所有者測試用例
  function testGetAdopterAddressByPetId() public {
    // 期望領養者的地址就是本合約地址，因為交易是由測試合約發起交易，
    address expected = this;
    address adopter = adoption.adopters(8);
    Assert.equal(adopter, expected, "Owner of pet ID 8 should be recorded.");
  }

    // 測試所有領養者
  function testGetAdopterAddressByPetIdInArray() public {
  // 領養者的地址就是本合約地址
    address expected = this;
    address[16] memory adopters = adoption.getAdopters();
    Assert.equal(adopters[8], expected, "Owner of pet ID 8 should be recorded.");
  }
}