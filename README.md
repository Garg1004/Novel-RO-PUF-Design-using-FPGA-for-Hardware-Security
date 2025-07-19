# Novel-RO-PUF-Design-using-FPGA-for-Hardware-Security
This project presents a novel Ring Oscillator Physical Unclonable Function (RO-PUF) design implemented on the Basys 3 FPGA board (Xilinx Artix-7) using Vivado Design Suite. The design focuses on achieving low power consumption and enhanced response quality using a custom RO selector mechanism and a Double Feynman gate-based architecture.
# 🔐 Novel 8-bit RO-PUF Design Using Basys 3 FPGA

This repository contains the implementation of a **novel 8-bit Ring Oscillator Physical Unclonable Function (RO-PUF)** using the **Basys 3 FPGA board** and **Vivado Design Suite**. The design focuses on achieving **low power consumption** and **strong randomness** by introducing a custom RO selector logic and a Double Feynman gate-based oscillator structure.

---

## 📘 Detailed Project Explanation

This project involves the design and implementation of a novel 8-bit Ring Oscillator Physical Unclonable Function (RO-PUF) using the Basys 3 FPGA board and Vivado Design Suite. The core objective of the project is to achieve **low power consumption** while maintaining a reliable and secure PUF response, which is essential for hardware-level authentication and cryptographic key generation.

In conventional RO-PUF architectures, multiple ring oscillators are kept running simultaneously, which leads to higher dynamic power usage. To address this issue, a custom **RO Selector logic** is implemented in this design. The selector uses control logic to ensure that **only two ring oscillators are turned on at any given time**, thus reducing unnecessary switching activity and significantly saving power. This selective activation is the key novelty of the design.

The PUF core is built using multiple **Double Feynman gates**, which are known for their ability to increase randomness and reduce correlation in signal transitions. These gates are used to construct the oscillators, ensuring more unpredictable and unique outputs. The output from each selected pair of ROs is passed through internal logic to derive response bits.

To construct an 8-bit response, the design uses a combination of **RO selector logic** and **sequential oscillator pair evaluations**, repeated over multiple pairs. This allows reliable generation of an 8-bit challenge-response output suitable for use in lightweight security applications.

The final design is synthesized and implemented on the **Basys 3 FPGA board**, which is based on the Artix-7 FPGA. The output can also be transmitted over UART to a PC for response collection or encryption purposes, making it easier to interface with external software like Python for further analysis.

This project not only demonstrates a working RO-PUF with reduced power but also proves its uniqueness and robustness by analyzing the **inter-chip Hamming Distance** across multiple challenge pairs. An average uniqueness value of **45.0099%** was achieved, which is close to the ideal 50%, indicating strong inter-chip randomness and differentiation.

---

## 🛠️ Tools and Platform

- **FPGA Board**: Basys 3 (Artix-7)
- **Design Software**: Vivado Design Suite (2025 or later)
- **HDL Language**: Verilog
- Optional:
  - **UART communication**
  - **Python scripts** for PUF response logging

---

## 🚀 Key Features

- ✅ **Low Power Design**: Only 2 ring oscillators are turned ON per operation
- ✅ **8-bit PUF Output**: Stable and repeatable responses suitable for security protocols
- ✅ **Double Feynman Gates**: Improve entropy and signal independence
- ✅ **Suitable for Secure Applications**: Cryptographic key generation, hardware authentication

---


