pub const HWND = ?*anyopaque;
pub const BOOL = c_int;
pub const UINT = c_uint;
pub const WPARAM = usize;
pub const LPARAM = isize;
pub const LRESULT = isize;
pub const DWORD = c_ulong;

pub const MSG = extern struct {
    hwnd: HWND,
    message: UINT,
    wParam: WPARAM,
    lParam: LPARAM,
    time: DWORD,
    pt: extern struct { x: c_long, y: c_long },
};

pub extern "user32" fn RegisterHotKey(
    hWnd: HWND,
    id: c_int,
    fsModifiers: UINT,
    vk: UINT,
) callconv(.C) BOOL;

pub extern "user32" fn UnregisterHotKey(
    hWnd: HWND,
    id: c_int,
) callconv(.C) BOOL;

pub extern "user32" fn GetMessageA(
    lpMsg: *MSG,
    hWnd: HWND,
    wMsgFilterMin: UINT,
    wMsgFilterMax: UINT,
) callconv(.C) c_int;

pub extern "user32" fn TranslateMessage(lpMsg: *const MSG) callconv(.C) BOOL;

pub extern "user32" fn DispatchMessageA(lpMsg: *const MSG) callconv(.C) LRESULT;

pub extern "user32" fn PostQuitMessage(exitCode: c_int) callconv(.C) void;

// Hotkey modifiers
pub const MOD_ALT: UINT = 0x0001;
pub const MOD_CONTROL: UINT = 0x0002;
pub const MOD_SHIFT: UINT = 0x0004;
pub const MOD_WIN: UINT = 0x0008;

// Messages
pub const WM_HOTKEY: UINT = 0x0312;

// ---------------------------------------------------------
// Virtual-Key Codes
// Source: https://learn.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes
// ---------------------------------------------------------

pub const VK_LBUTTON: UINT = 0x01;
pub const VK_RBUTTON: UINT = 0x02;
pub const VK_CANCEL: UINT = 0x03;
pub const VK_MBUTTON: UINT = 0x04;
pub const VK_XBUTTON1: UINT = 0x05;
pub const VK_XBUTTON2: UINT = 0x06;

pub const VK_BACK: UINT = 0x08;
pub const VK_TAB: UINT = 0x09;

pub const VK_CLEAR: UINT = 0x0C;
pub const VK_RETURN: UINT = 0x0D;

pub const VK_SHIFT: UINT = 0x10;
pub const VK_CONTROL: UINT = 0x11;
pub const VK_MENU: UINT = 0x12;
pub const VK_PAUSE: UINT = 0x13;
pub const VK_CAPITAL: UINT = 0x14;

pub const VK_KANA: UINT = 0x15;
pub const VK_HANGUEL: UINT = 0x15; // old name
pub const VK_HANGUL: UINT = 0x15;
pub const VK_IME_ON: UINT = 0x16;
pub const VK_JUNJA: UINT = 0x17;
pub const VK_FINAL: UINT = 0x18;
pub const VK_HANJA: UINT = 0x19;
pub const VK_KANJI: UINT = 0x19;
pub const VK_IME_OFF: UINT = 0x1A;

pub const VK_ESCAPE: UINT = 0x1B;

pub const VK_CONVERT: UINT = 0x1C;
pub const VK_NONCONVERT: UINT = 0x1D;
pub const VK_ACCEPT: UINT = 0x1E;
pub const VK_MODECHANGE: UINT = 0x1F;

pub const VK_SPACE: UINT = 0x20;
pub const VK_PRIOR: UINT = 0x21;
pub const VK_NEXT: UINT = 0x22;
pub const VK_END: UINT = 0x23;
pub const VK_HOME: UINT = 0x24;
pub const VK_LEFT: UINT = 0x25;
pub const VK_UP: UINT = 0x26;
pub const VK_RIGHT: UINT = 0x27;
pub const VK_DOWN: UINT = 0x28;
pub const VK_SELECT: UINT = 0x29;
pub const VK_PRINT: UINT = 0x2A;
pub const VK_EXECUTE: UINT = 0x2B;
pub const VK_SNAPSHOT: UINT = 0x2C;
pub const VK_INSERT: UINT = 0x2D;
pub const VK_DELETE: UINT = 0x2E;
pub const VK_HELP: UINT = 0x2F;

// Number keys
pub const VK_0: UINT = 0x30;
pub const VK_1: UINT = 0x31;
pub const VK_2: UINT = 0x32;
pub const VK_3: UINT = 0x33;
pub const VK_4: UINT = 0x34;
pub const VK_5: UINT = 0x35;
pub const VK_6: UINT = 0x36;
pub const VK_7: UINT = 0x37;
pub const VK_8: UINT = 0x38;
pub const VK_9: UINT = 0x39;

// Letters
pub const VK_A: UINT = 0x41;
pub const VK_B: UINT = 0x42;
pub const VK_C: UINT = 0x43;
pub const VK_D: UINT = 0x44;
pub const VK_E: UINT = 0x45;
pub const VK_F: UINT = 0x46;
pub const VK_G: UINT = 0x47;
pub const VK_H: UINT = 0x48;
pub const VK_I: UINT = 0x49;
pub const VK_J: UINT = 0x4A;
pub const VK_K: UINT = 0x4B;
pub const VK_L: UINT = 0x4C;
pub const VK_M: UINT = 0x4D;
pub const VK_N: UINT = 0x4E;
pub const VK_O: UINT = 0x4F;
pub const VK_P: UINT = 0x50;
pub const VK_Q: UINT = 0x51;
pub const VK_R: UINT = 0x52;
pub const VK_S: UINT = 0x53;
pub const VK_T: UINT = 0x54;
pub const VK_U: UINT = 0x55;
pub const VK_V: UINT = 0x56;
pub const VK_W: UINT = 0x57;
pub const VK_X: UINT = 0x58;
pub const VK_Y: UINT = 0x59;
pub const VK_Z: UINT = 0x5A;

pub const VK_LWIN: UINT = 0x5B;
pub const VK_RWIN: UINT = 0x5C;
pub const VK_APPS: UINT = 0x5D;

pub const VK_SLEEP: UINT = 0x5F;

// Numpad
pub const VK_NUMPAD0: UINT = 0x60;
pub const VK_NUMPAD1: UINT = 0x61;
pub const VK_NUMPAD2: UINT = 0x62;
pub const VK_NUMPAD3: UINT = 0x63;
pub const VK_NUMPAD4: UINT = 0x64;
pub const VK_NUMPAD5: UINT = 0x65;
pub const VK_NUMPAD6: UINT = 0x66;
pub const VK_NUMPAD7: UINT = 0x67;
pub const VK_NUMPAD8: UINT = 0x68;
pub const VK_NUMPAD9: UINT = 0x69;

pub const VK_MULTIPLY: UINT = 0x6A;
pub const VK_ADD: UINT = 0x6B;
pub const VK_SEPARATOR: UINT = 0x6C;
pub const VK_SUBTRACT: UINT = 0x6D;
pub const VK_DECIMAL: UINT = 0x6E;
pub const VK_DIVIDE: UINT = 0x6F;

// Function keys
pub const VK_F1: UINT = 0x70;
pub const VK_F2: UINT = 0x71;
pub const VK_F3: UINT = 0x72;
pub const VK_F4: UINT = 0x73;
pub const VK_F5: UINT = 0x74;
pub const VK_F6: UINT = 0x75;
pub const VK_F7: UINT = 0x76;
pub const VK_F8: UINT = 0x77;
pub const VK_F9: UINT = 0x78;
pub const VK_F10: UINT = 0x79;
pub const VK_F11: UINT = 0x7A;
pub const VK_F12: UINT = 0x7B;
pub const VK_F13: UINT = 0x7C;
pub const VK_F14: UINT = 0x7D;
pub const VK_F15: UINT = 0x7E;
pub const VK_F16: UINT = 0x7F;
pub const VK_F17: UINT = 0x80;
pub const VK_F18: UINT = 0x81;
pub const VK_F19: UINT = 0x82;
pub const VK_F20: UINT = 0x83;
pub const VK_F21: UINT = 0x84;
pub const VK_F22: UINT = 0x85;
pub const VK_F23: UINT = 0x86;
pub const VK_F24: UINT = 0x87;

pub const VK_NUMLOCK: UINT = 0x90;
pub const VK_SCROLL: UINT = 0x91;

pub const VK_LSHIFT: UINT = 0xA0;
pub const VK_RSHIFT: UINT = 0xA1;
pub const VK_LCONTROL: UINT = 0xA2;
pub const VK_RCONTROL: UINT = 0xA3;
pub const VK_LMENU: UINT = 0xA4;
pub const VK_RMENU: UINT = 0xA5;

pub const VK_BROWSER_BACK: UINT = 0xA6;
pub const VK_BROWSER_FORWARD: UINT = 0xA7;
pub const VK_BROWSER_REFRESH: UINT = 0xA8;
pub const VK_BROWSER_STOP: UINT = 0xA9;
pub const VK_BROWSER_SEARCH: UINT = 0xAA;
pub const VK_BROWSER_FAVORITES: UINT = 0xAB;
pub const VK_BROWSER_HOME: UINT = 0xAC;

pub const VK_VOLUME_MUTE: UINT = 0xAD;
pub const VK_VOLUME_DOWN: UINT = 0xAE;
pub const VK_VOLUME_UP: UINT = 0xAF;
pub const VK_MEDIA_NEXT_TRACK: UINT = 0xB0;
pub const VK_MEDIA_PREV_TRACK: UINT = 0xB1;
pub const VK_MEDIA_STOP: UINT = 0xB2;
pub const VK_MEDIA_PLAY_PAUSE: UINT = 0xB3;

pub const VK_LAUNCH_MAIL: UINT = 0xB4;
pub const VK_LAUNCH_MEDIA_SELECT: UINT = 0xB5;
pub const VK_LAUNCH_APP1: UINT = 0xB6;
pub const VK_LAUNCH_APP2: UINT = 0xB7;

// OEM keys
pub const VK_OEM_1: UINT = 0xBA; // ;:
pub const VK_OEM_PLUS: UINT = 0xBB; // =+
pub const VK_OEM_COMMA: UINT = 0xBC; // ,<
pub const VK_OEM_MINUS: UINT = 0xBD; // -_
pub const VK_OEM_PERIOD: UINT = 0xBE; // .>
pub const VK_OEM_2: UINT = 0xBF; // /?
pub const VK_OEM_3: UINT = 0xC0; // `~
pub const VK_OEM_4: UINT = 0xDB; // [{
pub const VK_OEM_5: UINT = 0xDC; // \|
pub const VK_OEM_6: UINT = 0xDD; // ]}
pub const VK_OEM_7: UINT = 0xDE; // '"
pub const VK_OEM_8: UINT = 0xDF;

pub const VK_OEM_102: UINT = 0xE2; // <> or \|

pub const VK_PROCESSKEY: UINT = 0xE5;

pub const VK_PACKET: UINT = 0xE7;

pub const VK_ATTN: UINT = 0xF6;
pub const VK_CRSEL: UINT = 0xF7;
pub const VK_EXSEL: UINT = 0xF8;
pub const VK_EREOF: UINT = 0xF9;
pub const VK_PLAY: UINT = 0xFA;
pub const VK_ZOOM: UINT = 0xFB;
pub const VK_NONAME: UINT = 0xFC;
pub const VK_PA1: UINT = 0xFD;
pub const VK_OEM_CLEAR: UINT = 0xFE;
