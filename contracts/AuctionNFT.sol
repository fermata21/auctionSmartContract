// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract AuctionContract is ERC721, ERC721Enumerable, Ownable {
    using Strings for uint256;

    mapping(address => uint256) finalBidAmount;

    IERC20 public tokenAddress;

    uint256 private _nextTokenId;
    uint256 private daysOfAuction;
    uint256 private auctionStartDay;
    uint256 private minBid;
    uint256 private bidIncrement;

    string private baseURI;
    string private contractURI;
    string private baseExtension = ".json";

    //Constructor, Setter, Getter
    constructor(address initialOwner, IERC20 _tokenAddress)
        ERC721("AuctionContract", "ACN")
        Ownable(initialOwner)
    {
        tokenAddress = _tokenAddress;
    }

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

    //Bidding functions
    function submitBid(uint256 tokenAmount) public payable {
        bidIncrement = checkBid(tokenAmount);
        finalBidAmount[msg.sender] = tokenAmount;
        if (!tokenAddress.transferFrom(address(this), msg.sender, bidIncrement)) revert();
    }

    function checkBid(uint256 tokenAmount) internal returns (uint256) {
        require(auctionAvailable() == true, "The auction has ended");
        require(tokenAmount > 0, "You cannot bid 0 token");
        require(tokenAddress.balanceOf(msg.sender) >= tokenAmount, "You do not hold enough tokens for this transaction");
        require(finalBidAmount[msg.sender] < tokenAmount, "This bid must be higher than you last bid");
        if (!tokenAddress.transferFrom(msg.sender, address(this), tokenAmount)) revert();      
        return tokenAmount - finalBidAmount[msg.sender];
    }

    //Minting functions
    function safeMint(address to) public onlyOwner {
        _safeMint(to, _nextTokenId++);
    }

    function publicMint() public payable {
        require(auctionAvailable() == false, "The auction is still ongoing");
        if (finalBidAmount[msg.sender] >= minBid) {
            _safeMint(msg.sender, _nextTokenId++);
        } else {
            if (!tokenAddress.transferFrom(address(this), msg.sender, finalBidAmount[msg.sender])) revert();
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
