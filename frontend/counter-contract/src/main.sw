contract;

abi TestContract {
    #[storage(read, write)]
    fn increment_counter(amount: u64) -> u64;

    #[storage(read)]
    fn get_counter() -> u64;
}

storage {
    counter: u64 = 0,
}

impl TestContract for Contract {
    #[storage(read, write)]
    fn increment_counter(amount: u64) -> u64 {
    require(amount>0,"Error");
        let incremented = storage.counter.read() + amount;
        storage.counter.write(incremented);
        incremented
    }

    #[storage(read)]
    fn get_counter() -> u64 {
        storage.counter.read()
    }
}