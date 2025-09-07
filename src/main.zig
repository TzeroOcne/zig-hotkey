const std = @import("std");
const win = @import("win.zig");

pub fn main() !void {
    const HOTKEY_TOGGLE: c_int = 1;
    const HOTKEY_EXIT: c_int = 2;

    // Register F20 for toggling
    if (win.RegisterHotKey(null, HOTKEY_TOGGLE, 0, win.VK_F20) == 0) {
        std.debug.print("Failed to register F20 hotkey\n", .{});
        return;
    }
    std.debug.print("Registered F20 for toggle\n", .{});

    // Register F24 for exit
    if (win.RegisterHotKey(null, HOTKEY_EXIT, 0, win.VK_F24) == 0) {
        std.debug.print("Failed to register F24 hotkey\n", .{});
        return;
    }
    std.debug.print("Registered F24 for exit\n", .{});

    var msg: win.MSG = undefined;
    var state: bool = false;

    while (true) {
        const res = win.GetMessageA(&msg, null, 0, 0);
        if (res == 0) {
            break; // WM_QUIT received
        } else if (res == -1) {
            std.debug.print("GetMessage error\n", .{});
            break;
        } else {
            if (msg.message == win.WM_HOTKEY) {
                switch (msg.wParam) {
                    HOTKEY_TOGGLE => {
                        state = !state;
                        std.debug.print("{any}\n", .{state});
                    },
                    HOTKEY_EXIT => {
                        std.debug.print("Exiting program...\n", .{});
                        win.PostQuitMessage(0);
                    },
                    else => {},
                }
            }
            _ = win.TranslateMessage(&msg);
            _ = win.DispatchMessageA(&msg);
        }
    }

    _ = win.UnregisterHotKey(null, HOTKEY_TOGGLE);
    _ = win.UnregisterHotKey(null, HOTKEY_EXIT);
    std.debug.print("Hotkeys unregistered. Bye!\n", .{});
}
