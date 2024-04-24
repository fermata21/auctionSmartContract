// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract AuctionContract is ERC721, ERC721Enumerable, Ownable {
    struct Bidder {
        uint256 lastBid;
        uint256 lastBidDate;
        bool claimed;
    }

    using Strings for uint256;

    mapping(address => Bidder) existingBidder;
    mapping(address => uint256) ordinalNumber;

    IERC20 public tokenAddress;

    uint256 public _nextTokenId;
    uint256 public auctionStartDate;
    uint256 public auctionEndDate;
    uint256 public finalPrice;
    uint256 public tokensCharged;
    uint256 public nextOrdinalNumber;
    uint256 public minBid;
    uint256 public maxBid;

    string private baseURI;
    string private contractURI;
    string private baseExtension = ".json";

    //Constructor, Setter, Getter
    constructor(address initialOwner, address _tokenAddress)
        ERC721("AuctionContract", "ACN")
        Ownable(initialOwner)
    {
        tokenAddress = IERC20(_tokenAddress);
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

    //Event
    event submitBidEvent(
        address bidderAddress,
        uint256 bidAmount,
        uint256 bidderordinalNumber,
        uint256 submitDate
    );

    event claimedAndRefunded(
        address bidderAddress,
        uint256 refundedAmount,
        bool claimedStatus,
        uint256 claimedAndRefundedDate
    );

    //Bidding functions
    function submitBid(uint256 bidAmount) public payable {
        //Check if the auction has ended or not
        require(auctionAvailable() == true, "The auction has ended");

        //Check if the bidder send the valid bid value or not
        require(
            existingBidder[msg.sender].lastBid < bidAmount &&
                tokenAddress.balanceOf(msg.sender) >= bidAmount &&
                bidAmount >= minBid &&
                bidAmount <= maxBid,
            "Invalid bidding value!"
        );

        //After validation, if bidder has not been initialized (lastBid == 0) then create new Bidder
        //If bidder has existed, change the value of last bid to current bid
        if (existingBidder[msg.sender].lastBid == 0) {
            tokensCharged = bidAmount;
            Bidder memory bidder = Bidder(bidAmount, block.timestamp, false);
            existingBidder[msg.sender] = bidder;
            ordinalNumber[msg.sender] = nextOrdinalNumber++;
        } else {
            /*If bidder already existed, calculate the difference between the last and
        this bid to indentify how much tokens will the bidder be charged*/
            tokensCharged = bidAmount - existingBidder[msg.sender].lastBid;
            existingBidder[msg.sender].lastBid = bidAmount;
            existingBidder[msg.sender].lastBidDate = block.timestamp;
        }

        //Transfer tokens from bidder to this contract
        transferTokens(msg.sender, tokensCharged, true);
        emit submitBidEvent(
            msg.sender,
            tokensCharged,
            ordinalNumber[msg.sender],
            block.timestamp
        );
    }

    //Minting functions
    function safeMint(address to) public onlyOwner {
        _safeMint(to, _nextTokenId++);
    }

    function mintAndClaim() public payable {
        //Cant mint and claim if the auction still ongoing
        require(auctionAvailable() == false, "The auction is still ongoing");

        /*If the bidder last bid >= the minium bid that the owner set, the
        bidder will be able to mint and claim the change*/
        if (
            existingBidder[msg.sender].lastBid >= finalPrice &&
            existingBidder[msg.sender].claimed == false
        ) {
            safeMint(msg.sender);
            existingBidder[msg.sender].claimed = true;
            //Calculate the change between the minium bid and the bidder last bid in order to refund
            uint256 changeTokens = existingBidder[msg.sender].lastBid -
                finalPrice;
            transferTokens(msg.sender, changeTokens, false);
            emit claimedAndRefunded(
                msg.sender,
                changeTokens,
                true,
                block.timestamp
            );
        } else {
            //The bidder has lost the auction therefore they will receive all of their money back
            transferTokens(
                msg.sender,
                existingBidder[msg.sender].lastBid,
                false
            );
            emit claimedAndRefunded(
                msg.sender,
                existingBidder[msg.sender].lastBid,
                false,
                block.timestamp
            );
        }
    }

    //Transfer funtion
    function transferTokens(
        address bidderAddress,
        uint256 amountofTokens,
        bool transferFrom
    ) public {
        if (transferFrom == true) {
            tokenAddress.transferFrom(
                bidderAddress,
                address(this),
                amountofTokens
            );
        } else {
            tokenAddress.transfer(bidderAddress, amountofTokens);
        }
    }

    //Additional functions
    function auctionAvailable() public view returns (bool) {
        if (
            auctionStartDate * 1 days <= block.timestamp &&
            auctionEndDate * 1 days >= block.timestamp
        ) {
            return true;
        } else {
            return false;
        }
    }

    //Execute only by Owner
    function setAuctionTime(uint256 _startDate, uint256 _endDate)
        external
        onlyOwner
    {
        auctionStartDate = _startDate;
        auctionEndDate = _endDate;
    }

    function setBidRange(uint256 _minBid, uint256 _maxBid) external onlyOwner {
        minBid = _minBid;
        maxBid = _maxBid;
    }

    function setFinalPrice(uint256 _finalPrice) external onlyOwner {
        finalPrice = _finalPrice;
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

    function withdraw() external onlyOwner {
        transferTokens(
            msg.sender,
            tokenAddress.balanceOf(address(this)),
            false
        );
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
