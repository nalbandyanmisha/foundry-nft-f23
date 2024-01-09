// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721 {
    uint256 private s_tookenCounter;
    mapping(uint256 => string) private s_tokenIdToUri;

    constructor() ERC721("Dogie", "Dog") {
        s_tookenCounter = 0;
    }

    function mintNft(string memory tokenUri) public {
        s_tokenIdToUri[s_tookenCounter] = tokenUri;
        _safeMint(msg.sender, s_tookenCounter);
        s_tookenCounter += 1;
    }

    function tokenURI(uint256 tokenId) public view override returns(string memory) {
        return s_tokenIdToUri[tokenId];
    }
}