// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import './ERC721Metadata.sol';
import './ERC721Enumerable.sol';

contract ERC721Connector is ERC721Metadata, ERC721Enumerable {
    constructor(string memory named, string memory symboled) ERC721Metadata(named, symboled) {
        
    }
}