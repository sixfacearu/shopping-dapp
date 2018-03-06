pragma solidity ^0.4.0;
contract shopping{
    struct product{
        string name;
        uint256 price;
        uint256 availability;
        uint256 id;
    }
    uint256 t=now+ 1 hours;
    modifier clock{
        require(t>now);
        _;
        
    }
    mapping(uint256=>product)store;
    function setproduct(string name,uint256 price,uint256 availability,uint256 id)public {
        store[id].name=name;
        store[id].price=price;
        store[id].availability=availability;
        store[id].id=id;
         }
    function buyproduct(uint256 id,uint256 count)public clock{
        require(store[id].availability>count&&count>0);
        store[id].availability-=count;
         }
    function getdetails(uint256 _id)public constant returns(string name,uint256 price,uint256 availability,uint256 id){
        return(store[_id].name,store[_id].price,store[_id].availability,store[_id].id);
         }
}
