# 🔌 Connections Between Modules in Roblox

Modules often need to communicate. There are two common patterns:

---

## 🟢 One-Way Connection

A **one-way connection** means that **ModuleA** calls **ModuleB**, but **ModuleB** never calls back.
It’s like **a sender → receiver** setup.

### Example

```lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Require the modules
local ModuleA = require(ReplicatedStorage.Modules.ModuleA)
local ModuleB = require(ReplicatedStorage.Modules.ModuleB)

-- Initialize both (ModuleA knows about ModuleB directly)
ModuleA:Init(ModuleB)
ModuleB:Init()

-- Start ModuleA (fires only one direction: A → B)
ModuleA:Start()
```

**Flow:**

1. `ModuleA:Start()` calls `ModuleA:Ping()`.
2. `Ping()` prints `"Ping"` and directly calls `ModuleB:Pong()`.
3. `ModuleB:Pong()` runs, but does **not** call back to ModuleA.

Result: `Ping → Pong → stop`.

---

## 🔁 Two-Way Connection

A **two-way connection** means both modules can talk to each other **through a middleman** (connection module).
It’s like a **ping-pong loop**: A → B → A → B.

We use a third module (**ModuleC**) to manage connections.

### Example

```lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Require the modules
local ModuleA = require(ReplicatedStorage.Modules.ModuleA)
local ModuleB = require(ReplicatedStorage.Modules.ModuleB)

-- Initialize both modules so they register with ModuleC
ModuleA:Init()
ModuleB:Init()

-- Start ModuleA (this will kick off Ping -> Pong loop)
ModuleA:Start()
```

**Flow:**

1. `ModuleA:Start()` calls `ModuleA:Ping()`.
2. `Ping()` prints `"Ping from A"` and sends message to **ModuleC**.
3. **ModuleC** forwards it to `ModuleB:Pong()`.
4. `Pong()` prints `"Pong from B"` and sends message back to **ModuleC**.
5. **ModuleC** forwards it back to `ModuleA:Ping()`.
6. Loop continues (unless you add a stop condition `which i added`). 

Result: `Ping → Pong → Ping → Pong → ...`

---

## ⚖️ When to Use Which

* **One-way connection** → simple requests, like "save data" or "update UI".
* **Two-way connection** → ongoing communication, like "heartbeat checks" or "turn-based actions".

---
