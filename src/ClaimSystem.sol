// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "openzeppelin-contracts/contracts/access/Ownable.sol";
import "src/interfaces/IVerifyClaim.sol";


contract ClaimSystem is Ownable {
    // mapping claim type to hash of trust kernel
    mapping(uint256 => bytes32) public trustHashes;

    // mapping of claim types to addresses
    mapping(uint256 => IVerifyClaim) public claimTypes;

    // mapping of addresses to claims strengths
    mapping(address => mapping(uint256 => uint256)) public claims;

    /**
     * @dev Initializes the contract by setting an owner in Ownable
     */
    constructor(
    ) Ownable(msg.sender) {}

    function setTrustHash(uint256 ClaimType, bytes32 trustHash) onlyOwner() public {
        trustHashes[ClaimType] = trustHash;
    }

    function setType (uint256 ClaimType, address prover) onlyOwner() public {
        claimTypes[ClaimType] = IVerifyClaim(prover);
    }

    function claim(
        bytes calldata proof, 
        uint256 verifiedForDate,
        uint256 strength,
        uint256 ClaimType,
        bytes32[] calldata morePublicInputs
    ) external {
        require (claimTypes[ClaimType] != IVerifyClaim(address(0)), "The type doesn't have a prover set for it");
        require (trustHashes[ClaimType] != bytes32(0), "The type doesn't have a prover set for it");

        // Verify the claim
        require ( claimTypes[ClaimType].verifyClaimAddress(
            proof,
            msg.sender,
            verifiedForDate,
            trustHashes[ClaimType],
            strength,
            ClaimType,
            morePublicInputs
            ) ,
            "The claim couldn't be verified");

        // If claim is verified, save it
        claims[msg.sender][ClaimType] = strength;

    }



}
