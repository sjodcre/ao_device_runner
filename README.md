# ao_sim

**ao_sim** is a lightweight Erlang CLI tool that simulates how HyperBEAM handles device requests.

It lets you call mock "devices" like `~hello@1.0` from the command line, so you can prototype and test device logic as if it were part of a distributed compute network like Arweave's AO.

---

## 🚀 Features

- Simulate AO-style device dispatch (`~device@version`)
- Lightweight and hackable — no OTP boilerplate
- Output responses as structured Erlang maps
- Good for learning Erlang + contributing to HyperBEAM later

---

## 🛠 Requirements

- Erlang/OTP 24+  
- `rebar3` build tool  
  Install via: https://www.rebar3.org/docs/getting-started

---

## 🧪 Usage

### 1. Clone & Build

```bash
git clone https://github.com/your-username/ao_sim.git
cd ao_sim
rebar3 compile
rebar3 escriptize
```

### 2. Run the simulator

```bash
./_build/default/bin/ao_sim hello@1.0 greet
```

Expected output:

```erlang
{ok,#{message => <<"Hello from ~hello@1.0!">>}}
```

---

## 📁 Project Structure

```
src/
├── ao_sim.erl        # CLI entry point with main/1 and device dispatch logic
└── dev_hello.erl     # Mock device that handles the "greet" command
```

---

## ✨ Future Ideas

- Add `--data` flag to pass message payloads
- Support dynamic device registry (like `hb_opts.erl`)
- Pipe input/output in JSON
- Simulate process devices, WASM, or crypto logic

---

## 🤝 Contributing

Pull requests welcome!  
Open an issue or just fork and improve.

---

## 📄 License

MIT License
