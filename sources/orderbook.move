module orderbook::my_module {

    use sui::coin::{Self,Coin};
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};
    use sui::transfer;
    use sui::vector;


    struct Order has key, store {
        id: UID,
        give: TypeName,
        giveAmount: u64,
        get: TypeName,
        getAmount: u64,
        owner: address,

    }
    fun new()
    fun init(ctx &mut TxContext) {
        let OrderBook = vector<Order>
        transfer::share_object(OrderBook)
    }

    public fun ask<X,Y>(base: Coin<X>, quoteCoin: Y, quoteVal: u64, ctx: &mut TxContext) {
        let order = Order(
            id: object::new(ctx),
            give: X,
            giveAmount: coin::value(&base),
            get:Y,
            getAmount:quoteVal,
            owner: tx_context::sender(ctx),
        )
        vector::push_back<Order>(OrderBook, order<Order>)
    }
    public fun trade<X,Y>(offer: Coin<X>, ctx &mut TxContext, orderId: UID):Coin<Y> {
        assert!(coin::value)
    }
}