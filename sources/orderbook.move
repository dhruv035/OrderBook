module orderbook::my_module {

    use sui::coin::Coin;
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};
    use sui::transfer
    use std::type_name::{Self, TypeName};

    struct Order has key, store {
        id: UID,
        give: TypeName,
        giveAmount: u64,
        get: TypeName,
        getAmount: u64

    }
    fun init(ctx &mut TxContext) {
        let OrderBook = vector<Order>
        transfer::share_object(OrderBook)
    }

    public fun ask(base: Coin, quoteCoin: TypeName, quoteVal: u64, ctx: &mut TxContext) {
        let order = Order(
            id: object::new(ctx)
        )
    }
}