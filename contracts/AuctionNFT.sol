// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract AuctionContract is ERC721, ERC721Enumerable, Ownable {
    using Strings for uint256;

    mapping(address => uint256) finalBidAmount;

    uint256 private _nextTokenId;
    uint256 private daysOfAuction;
    uint256 private auctionStartDay;
    uint256 private minBid;
    uint256 private bidIncrement;

    string private baseURI;
    string private contractURI;
    string private baseExtension = ".json";

    constructor(address initialOwner)
        ERC721("AuctionContract", "ACN")
        Ownable(initialOwner)
    {}

    //Bidding functions
    function submitBid() public payable {
        bidIncrement = checkBid();
        finalBidAmount[msg.sender] = msg.value;
        if (!payable(msg.sender).send(msg.value - bidIncrement)) revert();
    }

    function checkBid() internal view returns (uint256) {
        require(auctionAvailable() == true);
        require(msg.value > 0);
        require(finalBidAmount[msg.sender] < msg.value);
        return msg.value - finalBidAmount[msg.sender];
    }

    function safeMint(address to) public onlyOwner {
        _safeMint(to, _nextTokenId++);
    }

    function publicMint() public payable {
        require(auctionAvailable() == false);
        if (finalBidAmount[msg.sender] >= minBid) {
            _safeMint(msg.sender, _nextTokenId++);
        } else {
            if (!payable(msg.sender).send(finalBidAmount[msg.sender])) revert();
        }
    }

    //Additional functions
    function auctionAvailable() public view returns (bool) {
        if (auctionStartDay + daysOfAuction * 1 days >= block.timestamp) {
            return true;
        } else {
            return false;
        }
    }

    //Execute only by Owner
    function setAuctionTime(uint256 _daysOfAuction) external onlyOwner {
        daysOfAuction = _daysOfAuction;
        auctionStartDay = block.timestamp;
    }

    function setMinBid(uint256 _minBid) external onlyOwner {
        minBid = _minBid;
    }

    //Other functions
    function _baseURI() internal view virtual override returns (string memory) {
        return baseURI;
    }

    function setBaseURI() public onlyOwner {
        baseURI = "ipfs://Qma8rLEpTpdKETstRaMFgbmiqNQjNTmi8cGFK9j9NAqYeS/";
    }

    function _contractURI() internal view virtual returns (string memory) {
        return contractURI;
    }

    function setContractURI() public onlyOwner {
        contractURI = "https://aqua-generous-impala-333.mypinata.cloud/ipfs/QmWaEXC1FSZ6mBciKQ4dJYuHWR8ctgnWQN3dR6trC8XUCL/contract.json";
    }

    function tokenURI(uint256 tokenId)
        public
        view
        virtual
        override
        returns (string memory)
    {
        string memory currentBaseURI = _baseURI();
        return
            bytes(currentBaseURI).length > 0
                ? string(
                    abi.encodePacked(
                        currentBaseURI,
                        tokenId.toString(),
                        baseExtension
                    )
                )
                : "";
    }

    function withdraw(address _addr) external onlyOwner {
        uint256 balance = address(this).balance;
        payable(_addr).transfer(balance);
    }

    // The following functions are overrides required by Solidity.

    function _update(
        address to,
        uint256 tokenId,
        address auth
    ) internal override(ERC721, ERC721Enumerable) returns (address) {
        return super._update(to, tokenId, auth);
    }

    function _increaseBalance(address account, uint128 value)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._increaseBalance(account, value);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
