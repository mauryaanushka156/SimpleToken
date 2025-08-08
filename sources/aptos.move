module MyModule::SimpleToken {
    use std::signer;
    use std::error;
    use std::table;

    /// Resource storing token balances mapped by address
    struct TokenStore has key {
        balances: table::Table<address, u64>,
    }

    /// Initializes TokenStore under the creator's account
    public fun init_token_store(account: &signer) {
        assert!(!exists<TokenStore>(signer::address_of(account)), error::already_exists(1));
        move_to(account, TokenStore {
            balances: table::new(),
        });
    }

    /// Mints tokens to the creator's own address
    public fun mint(account: &signer, amount: u64) acquires TokenStore {
        let addr = signer::address_of(account);
        assert!(exists<TokenStore>(addr), error::not_found(2));
        let store = borrow_global_mut<TokenStore>(addr);
        
        if (!table::contains(&store.balances, addr)) {
            table::add(&mut store.balances, addr, amount);
        } else {
            let bal = table::borrow_mut(&mut store.balances, addr);
            *bal = *bal + amount;
        }
    }

    /// Transfers tokens from sender to recipient
    public fun transfer(account: &signer, to: address, amount: u64) acquires TokenStore {
        let sender = signer::address_of(account);
        assert!(exists<TokenStore>(sender), error::not_found(2));
        assert!(exists<TokenStore>(to), error::not_found(4));
        assert!(sender != to, error::invalid_argument(5));

        let store = borrow_global_mut<TokenStore>(sender);
        assert!(table::contains(&store.balances, sender), error::not_found(6));
        let from_bal = table::borrow_mut(&mut store.balances, sender);
        assert!(*from_bal >= amount, error::invalid_argument(3));
        *from_bal = *from_bal - amount;

        let store_to = borrow_global_mut<TokenStore>(to);
        if (!table::contains(&store_to.balances, to)) {
            table::add(&mut store_to.balances, to, amount);
        } else {
            let to_bal = table::borrow_mut(&mut store_to.balances, to);
            *to_bal = *to_bal + amount;
        }
    }
}