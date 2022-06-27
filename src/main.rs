#![no_std]
#![no_main]

use core::panic::PanicInfo;

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}

#[no_mangle]
pub fn _start() -> ! {
    main()
}

fn main() -> ! {
    let buf = 0xb8000 as *mut u8;

    for (i, byte) in b"Hello World!".iter().enumerate() {
        unsafe {
            *buf.offset(i as isize * 2) = *byte;
            *buf.offset(i as isize * 2 + 1) = 0xb;
        }
    }
    loop {}
}
