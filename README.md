

---

**Title of the Project:**
**SimpleToken – A Basic Fungible Token Smart Contract on Aptos**

---

**Description of the Project:**
SimpleToken is a smart contract written in the Move language for the Aptos blockchain. It provides a minimal, secure, and efficient fungible token system where users can:

* Initialize a personal token vault (TokenStore)
* Mint tokens to their own balance
* Transfer tokens to other users

It uses `table::Table` for dynamic address-based storage and includes error handling with `std::error`, making it a great learning project for blockchain developers.

---

**Vision:**
To deliver a simple, transparent, and educational fungible token contract that introduces developers to Move’s powerful resource model and fosters experimentation on the Aptos blockchain.

---

**Future Scope:**

* Add a `burn()` function to allow users to destroy tokens
* Implement admin-only minting for better access control
* Integrate event logging (e.g., for mint and transfer)
* Build helper functions to query balances and total supply
* Connect with frontend DApps for real-time interaction
* Extend to support multiple token types or NFTs

---

**Contract Address:**
```
  "Result": {
    "transaction_hash": "0xee1f0915e6c774391bdf4be8783682c2b7e6a05010677aec9e2ac98596a74a02",
    "gas_used": 82,
    "gas_unit_price": 100,
    "sender": "d4ecf13f03fcf15c24fd127cd4feb1d917330457ea9a69f34927dc221d264c53",
    "sequence_number": 1,
    "replay_protector": {
      "SequenceNumber": 1
    },
    "success": true,
    "timestamp_us": 1754652599372212,
    "version": 28380245,
    "vm_status": "Executed successfully"
  }
```

<img width="1366" height="647" alt="apt" src="https://github.com/user-attachments/assets/cc8335cf-6ee0-4c27-a39f-cf32810e75e0" />

