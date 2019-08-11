#![no_std]
#![no_main]


#[no_mangle]
pub extern "C" fn main() -> ! {
    let _a = 1u64;
    unimplemented!("TODO")
}


#[panic_handler]
pub extern fn panic(info: &core::panic::PanicInfo) -> ! {
    // get message
    let _s = match info.payload().downcast_ref::<&str>() {
        Some(s) => s,
        None => ""
    };
    loop{}
}


#[no_mangle]
pub extern "C" fn abort() -> ! {
    loop{}
}
