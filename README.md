# 🔧 AO Device Simulator CLI

A HyperBEAM-style AO device simulator for Erlang.  
Simulate AO-style devices with CLI commands, dynamic dispatch, and M1/M2/Env structure.

---

## 📌 What Is This?

This CLI tool allows you to test AO-compatible "devices" locally, before running them in HyperBEAM or the AO runtime.

Each device module mimics a real AO contract:
- Accepts `call(M1, M2, Env)`
- Returns `{ok, #{...}}` or `{error, #{...}}`
- Can be dynamically registered and simulated via CLI

---

## 📁 Project Structure

| File                | Description |
|---------------------|-------------|
| `ao_sim.erl`        | Main CLI entry. Parses args and dispatches device calls. Key funcs: `main/1`, `dispatch/5` |
| `ao_registry.erl`   | Central map of devices (`device@1.0` → `dev_mod`). Key funcs: `device_map/0`, `get_module/1` |
| `dev_calculator.erl`| Math ops like `add`, `sub`. Key func: `call/4`, `do_calc/2` |
| `dev_meta.erl`      | Returns list of all devices using `ao_registry:get_all_devices/0` |
| `dev_hello.erl`     | Simple greeter device |
| `dev_echo.erl`      | Returns the same payload that was sent |
| `test/`             | Contains EUnit tests for registry and devices |

---

## 💡 Device Call Format

```erlang
call(Key, M1, M2, Env)
```

Where:
- `Key`: operation like `"add"` or `"info"`
- `M1`: metadata (e.g. sender, signature)
- `M2`: input data (map)
- `Env`: runtime context (timestamp, host)

---

## 🚀 Usage Examples

```bash
# Calculator
./ao_sim calculator@1.0 add --data '{"a": 2, "b": 3}'

# Hello
./ao_sim hello@1.0 greet

# Meta (returns registered devices)
./ao_sim meta@1.0 info

# Echo
./ao_sim echo@1.0 repeat --data '{"ping": "pong"}'
```

---

## 🛠 Internals

1. `ao_sim:main/1` parses CLI input
2. `--data` is decoded into M2, and dummy `M1`/`Env` are added
3. `ao_registry:get_module/1` finds the right device
4. Device `call/4` is executed
5. Result is printed

---

## 🧪 Testing

Run all tests with:

```bash
rebar3 eunit
```

Tests cover:
- Device registry consistency
- Basic math logic in `dev_calculator`

---

## 📦 Extending

Add your own device:

1. Create `dev_new.erl`
2. Implement `call(Key, M1, M2, Env)`
3. Add to `ao_registry:device_map/0`
4. Run with:

```bash
./ao_sim new@1.0 key --data '{"your": "data"}'
```

---

## 📎 License

Apache 2.0