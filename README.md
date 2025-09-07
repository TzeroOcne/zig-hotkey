# Zig Windows Hotkey Example

This is a simple example of using **Zig** with the Windows API to register global hotkeys.  
It shows how to bind keys, listen for hotkey events, and respond to them.

## Features
- Uses `RegisterHotKey` and `GetMessageA` from `user32.dll`.
- Listens to:
  - **F20** → Toggle between printing `true` and `false`.
  - **F24** → Exit the program.
- No modifier keys are required.

## Project Structure
~~~
.
├── src
│   ├── main.zig   # Entry point of the program
│   └── win.zig    # Windows API bindings and VK constants
└── build.zig      # Zig build script
~~~

## Build Instructions

1. Make sure you have **Zig installed** ([Download Zig](https://ziglang.org/download/)).

2. Build the program:
   ~~~sh
   zig build-exe src/main.zig -target x86_64-windows
   ~~~

3. Run it:
   ~~~sh
   ./main.exe
   ~~~

## Usage
- Press **F20** → Console prints alternating `true` and `false`.
- Press **F24** → Program exits gracefully.

Example output:
~~~
true
false
true
false
~~~

## Notes
- This example uses `GetMessageA` to process the Windows message loop.
- `win.zig` contains minimal Windows API bindings and the full list of Virtual-Key (VK) codes for convenience.
- Tested on **Windows 10 / 11** with **Zig 0.13+**.

---

💡 You can expand this to perform real actions instead of printing messages (e.g., control windows, send keystrokes, etc.).

